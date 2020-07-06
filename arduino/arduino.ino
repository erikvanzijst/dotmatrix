/* Display driver */
const unsigned DIM        = 16;
const unsigned width      = DIM * DIM;

const unsigned int RCLK   = 7;
const unsigned int RSDI   = 6;
const unsigned int OE     = 5;
const unsigned int CSDI   = 4;
const unsigned int CCLK   = 3;
const unsigned int LE     = 2;

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

volatile unsigned int screen[DIM];
volatile byte row = 0;

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
      { .vertex = {{-1, 0}, {0, 0}, {1, 0}, {1, 1}} },
      { .vertex = {{0, 1}, {0, 0}, {0, -1}, {-1, 1}} },
      { .vertex = {{-1, -1}, {-1, 0}, {0, 0}, {1, 0}} },
      { .vertex = {{0, -1}, {0, 0}, {0, 1}, {1, -1}} }
    }
  },
  { // L
    .shape = {
      { .vertex = {{-1, 1}, {-1, 0}, {0, 0}, {1, 0}} },
      { .vertex = {{-1, -1}, {0, -1}, {0, 0}, {0, 1}} },
      { .vertex = {{-1, 0}, {0, 0}, {1, 0}, {1, -1}} },
      { .vertex = {{0, -1}, {0, 0}, {0, 1}, {1, 1}} }
    }
  },
  { // S
    .shape = {
      { .vertex = {{-1, 1}, {0, 1}, {0, 0}, {1, 0}} },
      { .vertex = {{0, -1}, {0, 0}, {1, 0}, {1, 1}} },
      { .vertex = {{-1, 1}, {0, 1}, {0, 0}, {1, 0}} },
      { .vertex = {{0, -1}, {0, 0}, {1, 0}, {1, 1}} }
    }
  },
  { // Z
    .shape = {
      { .vertex = {{-1, 0}, {0, 0}, {0, 1}, {1, 1}} },
      { .vertex = {{0, -1}, {0, 0}, {-1, 0}, {-1, 1}} },
      { .vertex = {{-1, 0}, {0, 0}, {0, 1}, {1, 1}} },
      { .vertex = {{0, -1}, {0, 0}, {-1, 0}, {-1, 1}} }
    }
  },
  { // T
    .shape = {
      { .vertex = {{-1, 0}, {0, 0}, {1, 0}, {0, 1}} },
      { .vertex = {{0, -1}, {0, 0}, {0, 1}, {-1, 0}} },
      { .vertex = {{-1, 0}, {0, 0}, {1, 0}, {0, -1}} },
      { .vertex = {{0, -1}, {0, 0}, {0, 1}, {1, 0}} }
    }
  }
};

typedef struct {
  int bricknr;
  int rotation;
  Vertex location;
} FallingBrick;

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

  randomSeed(analogRead(0));
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

  shiftOut(CSDI, CCLK, MSBFIRST, screen[row] >> 8);
  shiftOut(CSDI, CCLK, MSBFIRST, screen[row]);
  pulse(LE);
  row = (row + 1) % DIM;
}

// Adjust for hardware wiring error in v01:
// https://github.com/erikvanzijst/dotmatrix/commit/3c7690eb47
#define fix(row) (row + ((row & 1) ? -1 : 1))

void setrow(unsigned int row, unsigned int value) {
  screen[fix(row)] = value;
}

void setpixel(unsigned int row, unsigned int col, bool on) {
  if (on) {
    screen[fix(row)] |= (1 << col);
  } else {
    screen[fix(row)] &= ((1 << col) ^ 0xff);
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

void draw(unsigned int *board, FallingBrick *brick) {
  Shape shape;
  materialize(&shape, brick);
  for (int i = 0; i < DIM; i++) {
    setrow(i, board[i]);
  }
  for (byte i = 0; i < 4; i++) {
    setpixel(shape.vertex[i].y, shape.vertex[i].x, true);
  }
}

bool fits(FallingBrick *brick, unsigned int *board) {
  Shape shape;
  materialize(&shape, brick);

  for (byte i = 0; i < 4; i++) {
    if (shape.vertex[i].y < 0 || shape.vertex[i].y >= DIM || shape.vertex[i].x < 0 || shape.vertex[i].x >= DIM) {
//      Serial.print("Out of bounds: ");
//      Serial.print(shape.vertex[i].x, DEC);
//      Serial.print(", ");
//      Serial.println(shape.vertex[i].y, DEC);

      return false;
    }
    if (board[shape.vertex[i].y] & (1 << shape.vertex[i].x)) {
//      Serial.print("Hit the board: ");
//      Serial.print(shape.vertex[i].x, DEC);
//      Serial.print(", ");
//      Serial.println(shape.vertex[i].y, DEC);

      return false;
    }
//    Serial.println("Vertex fits");
  }
//  Serial.println("Fits!");
  return true;
}

void materialize(Shape *shape, FallingBrick *brick) {
  for (int i = 0; i < 4; i++) {
    shape->vertex[i].x = brickdefs[brick->bricknr].shape[brick->rotation].vertex[i].x + brick->location.x;
    shape->vertex[i].y = brickdefs[brick->bricknr].shape[brick->rotation].vertex[i].y + brick->location.y;
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

void merge(FallingBrick *brick, unsigned int *board) {
  Shape shape;
  materialize(&shape, brick);
  for (int i = 0; i < 4; i++) {
    board[shape.vertex[i].y] |= (1 << shape.vertex[i].x);
  }

  // remove completed lines:
  int row = DIM - 1;
  for (int i = DIM - 1; i >= 0; i--) {
    if (board[i] != 0xffff) {
      board[row--] = board[i];
    }
  }
  for (; row >= 0; row--) {
    board[row] = 0;
  }
}

Vertex down = {0, 1};
Vertex left = {-1, 0};
Vertex right = {1, 0};
Vertex identity = {0, 0};

void loop() {
  unsigned long speed = 500;
  unsigned long now = millis();
  unsigned int board[DIM];
  memset(board, 0, sizeof(unsigned int) * DIM);

  FallingBrick brick = {
    .bricknr = (int)random(7),
    .rotation = 0,
    .location = {.x = 7, .y = 0}
  };
  FallingBrick copy;

  while (true) {

    if (waspressed(&LEFT)) {
      if(move(&copy, &brick, 0, &left, board)) {
        memcpy(&brick, &copy, sizeof(FallingBrick));
        draw(board, &brick);
      }
    }
    if (waspressed(&RIGHT)) {
      if(move(&copy, &brick, 0, &right, board)) {
        memcpy(&brick, &copy, sizeof(FallingBrick));
        draw(board, &brick);
      }
    }
    if (waspressed(&ROT)) {
      if(move(&copy, &brick, 1, &identity, board)) {
        memcpy(&brick, &copy, sizeof(FallingBrick));
        draw(board, &brick);
      }
    }
    if (waspressed(&DOWN)) {
      now -= speed;
    } else if (islongpressed(&DOWN)) {
      speed = 60;
    } else {
      speed = 500;
    }

    if ((millis() - now) > speed) {
      now = millis();

      if (move(&copy, &brick, 0, &down, board)) {
        memcpy(&brick, &copy, sizeof(FallingBrick));
        Serial.println("Brick moved down");
        printBrick(&copy);
      } else {
        Serial.println("Could not move down; merging.");
        printBrick(&brick);
        merge(&brick, board);

        brick.bricknr = (int)random(7);
        brick.rotation = 0;
        brick.location.x = 7;
        brick.location.y = 0;

        if (!move(&copy, &brick, 0, &down, board)) {
          Serial.println("--=GAME OVER=--");
          clearScreen();
          delay(2000);
          return;
        }
      }
      draw(board, &brick);
    }
  }
}
