/* Display driver */
const unsigned DIM        = 16;
const unsigned width      = DIM * DIM;

const unsigned int RCLK   = 7;
const unsigned int RSDI   = 6;
const unsigned int OE     = 5;
const unsigned int CSDI   = 4;
const unsigned int CCLK   = 3;
const unsigned int LE     = 2;

volatile unsigned int screen[DIM];
volatile byte row = 0;

typedef struct {
  const unsigned int pin;
  int currState;  // the current reading from the input pin
  int lastState;  // the previous reading from the input pin
  unsigned long lastChanged;
  unsigned long lastDebounce;
} Button;

Button LEFT   = {A0, LOW, LOW, 0, 0};
Button RIGHT  = {A2, LOW, LOW, 0, 0};
Button ROT    = {A3, LOW, LOW, 0, 0};
Button DOWN   = {A1, LOW, LOW, 0, 0};
const unsigned long debounceDelay = 50;

typedef struct {
  int x, y;
} Vertex;

typedef struct {
  Vertex vertex[4];
} Shape;

typedef struct {
  Shape shape[4];
} BrickDef;

BrickDef brickdefs[7] = {
  { // I
    .shape = {
      { .vertex = {{-1, 0}, {0, 0}, {1, 0}, {2, 0}} },
      { .vertex = {{0, 1}, {0, 0}, {0, -1}, {0, -2}} },
      { .vertex = {{-1, 0}, {0, 0}, {1, 0}, {2, 0}} },
      { .vertex = {{0, 1}, {0, 0}, {0, -1}, {0, -2}} }
    }
  },
  { // O
    .shape = {
      { .vertex = {{0, 0}, {0, 1}, {1, 0}, {1, 1}} },
      { .vertex = {{0, 0}, {0, 1}, {1, 0}, {1, 1}} },
      { .vertex = {{0, 0}, {0, 1}, {1, 0}, {1, 1}} },
      { .vertex = {{0, 0}, {0, 1}, {1, 0}, {1, 1}} }
    }
  },
  { // J
    .shape = {
      { .vertex = {{0, 0}, {1, 0}, {2, 0}, {2, 1}} },
      { .vertex = {{1, 1}, {1, 0}, {1, -1}, {0, 1}} },
      { .vertex = {{0, -1}, {0, 0}, {1, 0}, {2, 0}} },
      { .vertex = {{1, -1}, {1, 0}, {1, 1}, {2, -1}} }
    }
  },
  { // L
    .shape = {
      { .vertex = {{0, 1}, {0, 0}, {1, 0}, {2, 0}} },
      { .vertex = {{0, -1}, {1, -1}, {1, 0}, {1, 1}} },
      { .vertex = {{0, 0}, {1, 0}, {2, 0}, {2, -1}} },
      { .vertex = {{1, -1}, {1, 0}, {1, 1}, {2, 1}} }
    }
  },
  { // S
    .shape = {
      { .vertex = {{0, 1}, {1, 1}, {1, 0}, {2, 0}} },
      { .vertex = {{1, -1}, {1, 0}, {2, 0}, {2, 1}} },
      { .vertex = {{0, 1}, {1, 1}, {1, 0}, {2, 0}} },
      { .vertex = {{1, -1}, {1, 0}, {2, 0}, {2, 1}} }
    }
  },
  { // Z
    .shape = {
      { .vertex = {{0, 0}, {1, 0}, {1, 1}, {2, 1}} },
      { .vertex = {{1, -1}, {1, 0}, {0, 0}, {0, 1}} },
      { .vertex = {{0, 0}, {1, 0}, {1, 1}, {2, 1}} },
      { .vertex = {{1, -1}, {1, 0}, {0, 0}, {0, 1}} }
    }
  },
  { // T
    .shape = {
      { .vertex = {{0, 0}, {1, 0}, {2, 0}, {1, 1}} },
      { .vertex = {{1, -1}, {1, 0}, {1, 1}, {0, 0}} },
      { .vertex = {{0, 0}, {1, 0}, {2, 0}, {1, -1}} },
      { .vertex = {{1, -1}, {1, 0}, {1, 1}, {2, 0}} }
    }
  }
};

typedef struct {
  byte id;
  byte rotation;
  Vertex location;
} FallingBrick;

const byte WIDTH = 10;  // width of tetris board

void setup() {
  Serial.begin(115200);

  pinMode(RCLK, OUTPUT);
  pinMode(RSDI, OUTPUT);
  pinMode(OE, OUTPUT);
  pinMode(CSDI, OUTPUT);
  pinMode(CCLK, OUTPUT);
  pinMode(LE, OUTPUT);

  pinMode(LEFT.pin, INPUT);
  pinMode(RIGHT.pin, INPUT);
  pinMode(ROT.pin, INPUT);
  pinMode(DOWN.pin, INPUT);

  digitalWrite(OE, LOW);
  digitalWrite(LE, LOW);

  randomSeed(analogRead(A4)); // poor attempt at random data from floating input
  clearScreen();

  // Schedule timer interrupt to draw 1 display row at a time on
  // Timer0 at 976.5625Hz yielding 61Hz refresh rate:
  OCR0A = 0xAF;
  TIMSK0 |= _BV(OCIE0A);
}

void clearScreen() {
  for (byte row = 0; row < DIM; row++) {
    screen[row] = 0;
  }
}

void pulse(unsigned int pin) {
  digitalWrite(pin, HIGH);
  digitalWrite(pin, LOW);
}

SIGNAL(TIMER0_COMPA_vect) {
  digitalWrite(RSDI, row != 0);
  pulse(RCLK);

  shiftOut(CSDI, CCLK, LSBFIRST, screen[row]);
  shiftOut(CSDI, CCLK, LSBFIRST, screen[row] >> 8);
  pulse(LE);
  row = (row + 1) % DIM;
}

// Adjust for hardware wiring error in v01:
// https://github.com/erikvanzijst/dotmatrix/commit/3c7690eb47
#define fix(row) (row + ((row & 1) ? -1 : 1))

void setpixel(unsigned int row, unsigned int col, bool on) {
  if (on) {
    screen[fix(row)] |= (0x8000 >> col);
  } else {
    screen[fix(row)] &= ((0x8000 >> col) ^ 0xff);
  }
}

/*
 * Returns true if the button went from not pressed to pressed.
 */
bool waspressed(Button *button) {
  const int value = digitalRead(button->pin);
  if (value != button->lastState) {
    button->lastDebounce = millis();
    button->lastState = value;
  }

  if ((millis() - button->lastDebounce) > debounceDelay && value != button->currState) {
    button->currState = value;
    button->lastChanged = millis();
    if (button->currState == HIGH) {
      return true;
    }
  }
  return false;
}

bool islongpressed(Button *button) {
  return button->currState == HIGH && (millis() - button->lastChanged) >= 400;
}

/* Tetris */

void drawboard(unsigned int *board, FallingBrick *brick) {
  Shape shape;
  materialize(&shape, brick);
  for (byte i = 0; i < DIM; i++) {
    screen[fix(i)] &= 0x801F; // clear the board section of the screen line
    screen[fix(i)] |= ((board[i] >> 1) & 0x7fe0);
  }
  for (byte i = 0; i < 4; i++) {
    setpixel(shape.vertex[i].y, shape.vertex[i].x + 1, true);
  }
}

void drawnext(byte id) {
  // clear preview area:
  for (byte row = 0; row < 5; row++) {
    screen[fix(row)] &= 0xfff0;
  }
  // paint the next tetromino:
  for (byte i = 0; i < 4; i++) {
    setpixel(brickdefs[id].shape[0].vertex[i].y + 2, brickdefs[id].shape[0].vertex[i].x + 13, true);
  }
}

bool fits(FallingBrick *brick, unsigned int *board) {
  Shape shape;
  materialize(&shape, brick);

  for (byte i = 0; i < 4; i++) {
    if (shape.vertex[i].y < 0 || shape.vertex[i].y >= DIM || shape.vertex[i].x < 0 || shape.vertex[i].x >= WIDTH ||
        (board[shape.vertex[i].y] & (0x8000 >> shape.vertex[i].x))) {
      return false;
    }
  }
  return true;
}

void materialize(Shape *dest, FallingBrick *brick) {
  for (byte i = 0; i < 4; i++) {
    dest->vertex[i].x = brickdefs[brick->id].shape[brick->rotation].vertex[i].x + brick->location.x;
    dest->vertex[i].y = brickdefs[brick->id].shape[brick->rotation].vertex[i].y + brick->location.y;
  }
}

bool move(FallingBrick *dest, FallingBrick *src, int rot, Vertex *vector, unsigned int *board) {
  memcpy(dest, src, sizeof(FallingBrick));

  dest->rotation = (dest->rotation + rot) % 4;
  dest->location.x += vector->x;
  dest->location.y += vector->y;

  return fits(dest, board);
}

void printBrick(FallingBrick *brick) {
  Shape shape;
  materialize(&shape, brick);
  Serial.print("Shape: ");
  for (int i = 0; i < 4; i++) {
    Serial.print("(");
    Serial.print(shape.vertex[i].x, DEC);
    Serial.print(", ");
    Serial.print(shape.vertex[i].y, DEC);
    Serial.print(") ");
  }
  Serial.println(brick->rotation);
}

byte merge(FallingBrick *brick, unsigned int *board) {
  byte removed = 0;
  Shape shape;
  materialize(&shape, brick);
  for (byte i = 0; i < 4; i++) {
    board[shape.vertex[i].y] |= (0x8000 >> shape.vertex[i].x);
  }

  // remove completed lines:
  int row = DIM - 1;
  for (int i = DIM - 1; i >= 0; i--) {
    if (board[i] < 0xffc0) {
      board[row--] = board[i];
    } else {
      removed++;
    }
  }
  for (; row >= 0; row--) {
    board[row] = 0;
  }
  return removed;
}

/*
 * Returns the speed associate with the specified score.
 * Speed in measured in delay ms.
 */
unsigned int getspeed(unsigned int score) {
  return (unsigned int) max((-5.6 * score + 550) + 50, 50);
}

Vertex down = {0, 1};
Vertex left = {-1, 0};
Vertex right = {1, 0};
Vertex identity = {0, 0};

byte next;

void loop() {
  unsigned int score = 0;
  unsigned long speed = getspeed(score);
  unsigned long now = millis();
  unsigned int board[DIM];
  memset(board, 0, sizeof(unsigned int) * DIM);
  next = (byte)random(7);

  for (byte i = 0; i < DIM; i++) {
    screen[i] = 0x8010; // paint background
  }
  drawnext(next);

  FallingBrick brick = {
    .id = (byte)random(7),
    .rotation = 0,
    .location = {.x = 4, .y = 0}
  };
  FallingBrick copy;

  while (true) {

    if (waspressed(&LEFT)) {
      if(move(&copy, &brick, 0, &left, board)) {
        memcpy(&brick, &copy, sizeof(FallingBrick));
        drawboard(board, &brick);
      }
    }
    if (waspressed(&RIGHT)) {
      if(move(&copy, &brick, 0, &right, board)) {
        memcpy(&brick, &copy, sizeof(FallingBrick));
        drawboard(board, &brick);
      }
    }
    if (waspressed(&ROT)) {
      if(move(&copy, &brick, 1, &identity, board)) {
        memcpy(&brick, &copy, sizeof(FallingBrick));
        drawboard(board, &brick);
      }
    }
    if (waspressed(&DOWN)) {
      now -= speed;
    } else if (islongpressed(&DOWN)) {
      speed = 40;
    } else {
      speed = getspeed(score);
    }

    if ((millis() - now) > speed) {
      now = millis();

      if (move(&copy, &brick, 0, &down, board)) {
        memcpy(&brick, &copy, sizeof(FallingBrick));
//        Serial.println("Brick moved down");
//        printBrick(&copy);
      } else {
        Serial.println("Could not move down; merging.");
        printBrick(&brick);
        score += merge(&brick, board);
        Serial.print("Score: ");
        Serial.print(score, DEC);
        Serial.print(" speed: ");
        Serial.println(getspeed(score), DEC);

        brick.id = next;
        brick.rotation = 0;
        brick.location.x = 4;
        brick.location.y = 0;
        next = (int)random(7);
        drawnext(next);

        if (!move(&copy, &brick, 0, &down, board)) {
          gameover();
          return;
        }
      }
      drawboard(board, &brick);
    }
  }
}

void gameover() {
  // TODO: do something more elaborate
  Serial.println("--=GAME OVER=--");
  clearScreen();
  delay(2000);
}
