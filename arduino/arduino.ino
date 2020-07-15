/*
Copyright (c) 2020 Erik van Zijst <erik.van.zijst@gmail.com>

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/

// Display driver
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

// partial minimalist 5x5 font from https://www.dafont.com/5x5.font
const byte font[43][5] PROGMEM = {
  {0x1f, 0x13, 0x15, 0x19, 0x1f}, // 0
  {0x04, 0x0c, 0x04, 0x04, 0x0e}, // 1
  {0x1e, 0x01, 0x0e, 0x10, 0x1f}, // 2
  {0x1f, 0x01, 0x0e, 0x01, 0x1f}, // 3
  {0x10, 0x10, 0x14, 0x1f, 0x04}, // 4
  {0x1f, 0x10, 0x1e, 0x01, 0x1e}, // 5
  {0x1f, 0x10, 0x1f, 0x11, 0x1f}, // 6
  {0x1f, 0x01, 0x02, 0x04, 0x04}, // 7
  {0x1f, 0x11, 0x1f, 0x11, 0x1f}, // 8
  {0x1f, 0x11, 0x1f, 0x01, 0x1f}, // 9

  {0x0, 0x04, 0x0, 0x04, 0x0},    // :
  {0x0, 0x04, 0x0, 0x04, 0x04},   // ;
  {0, 0, 0, 0, 0},  // <
  {0, 0, 0, 0, 0},  // =
  {0, 0, 0, 0, 0},  // >
  {0, 0, 0, 0, 0},  // ?
  {0, 0, 0, 0, 0},  // fake space

  {0x1f, 0x11, 0x11, 0x1f, 0x11}, // A
  {0x1f, 0x11, 0x1e, 0x11, 0x1f}, // B
  {0x1f, 0x10, 0x10, 0x10, 0x1f}, // C
  {0x1e, 0x11, 0x11, 0x11, 0x1e}, // D
  {0x1f, 0x10, 0x1e, 0x10, 0x1f}, // E
  {0x1f, 0x10, 0x1e, 0x10, 0x10}, // F
  {0x1f, 0x10, 0x13, 0x11, 0x1f}, // G
  {0x11, 0x11, 0x1f, 0x11, 0x11}, // H
  {0x1f, 0x04, 0x04, 0x04, 0x1f}, // I
  {0x03, 0x01, 0x01, 0x11, 0x1f}, // J
  {0x11, 0x12, 0x1c, 0x12, 0x11}, // K
  {0x10, 0x10, 0x10, 0x10, 0x1f}, // L
  {0x11, 0x1b, 0x15, 0x11, 0x11}, // M
  {0x11, 0x19, 0x15, 0x13, 0x11}, // N
  {0x0e, 0x11, 0x11, 0x11, 0x0e}, // O
  {0x1e, 0x11, 0x1e, 0x10, 0x10}, // P
  {0x1f, 0x11, 0x11, 0x1f, 0x04}, // Q
  {0x1e, 0x11, 0x1e, 0x11, 0x11}, // R
  {0x1f, 0x10, 0x1f, 0x01, 0x1f}, // S
  {0x1f, 0x04, 0x04, 0x04, 0x04}, // T
  {0x11, 0x11, 0x11, 0x11, 0x1f}, // U
  {0x11, 0x11, 0x0a, 0x0a, 0x04}, // V
  {0x11, 0x11, 0x15, 0x15, 0x0a}, // W
  {0x11, 0x0a, 0x04, 0x0a, 0x11}, // X
  {0x11, 0x11, 0x0a, 0x04, 0x04}, // Y
  {0x1f, 0x02, 0x04, 0x08, 0x1f}  // Z
};

void setup() {
  cli();

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
  // Timer2 at 2kHz yielding 125Hz refresh rate.
  //
  // The scanline ISR takes 296us, making 3kHz the absolute fastest we could
  // schedule the interrupt, as the display would consume the entire CPU with no
  // cycles left for the main program loop.
  // We need 16 scanlines for one full refresh, so for a robust flicker-free refresh
  // rate of 125Hz, we need a 2kHz interrupt timer, consuming about two thirds
  // of the ATmega328's processing power.

  TCCR2A = 0;               // set entire TCCR2A register to 0
  TCCR2B = 0;               // same for TCCR2B
  TCNT2  = 0;               // initialize counter value to 0

  // set compare match register for 2khz increments
  OCR2A = 124;              // = (16*10^6) / (2000*64) - 1 (must be <256)
  TCCR2A |= (1 << WGM21);   // turn on CTC mode
  TCCR2B |= (1 << CS22);    // Set CS22 bit for 64 prescaler
  TIMSK2 |= (1 << OCIE2A);  // enable timer compare interrupt

  sei();
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

SIGNAL(TIMER2_COMPA_vect) {
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

void scroll(const char *msg, byte row, long timeout) {
  byte chars[strlen(msg)][5];

  for (unsigned int i = 0; i < strlen(msg); i++) {
    const int j = ((int)msg[i]) == 0x20 ? 0x10 : ((int)toupper(msg[i])) - 0x30; // space is mapped to @
    if (j < 0 || j > 43) {
      Serial.print("Invalid character! 0x");
      Serial.println((int)msg[i], HEX);
      return;
    }
    memcpy_P(chars[i], &(font[j]), 5);
  }
  scrollbytes(chars, sizeof(chars) / 5, row, timeout);
}

void scrollbytes(byte glyphs[][5], unsigned int len, byte row, long timeout) {
  const unsigned long start = millis();

  for (unsigned int pos = 0; (timeout == -1 || (millis() - start) < timeout) && !waspressed(&ROT); pos = ++pos % (len * 6)) {
    for (int r = 4; r >= 0; r--) {
      screen[fix(row + r)] <<= 1;
      screen[fix(row + r)] |= ( (glyphs[pos / 6][r] & (0x20 >> (pos % 6))) ? 1 : 0);
    }
    delay(75);
  }
}

/*
 * Returns the speed associated with the specified number of removed lines.
 * Speed in measured in delay ms.
 */
unsigned int getspeed(unsigned int lines) {
  return (unsigned int) max((-5.6 * lines + 550) + 50, 50);
}

Vertex down = {0, 1};
Vertex left = {-1, 0};
Vertex right = {1, 0};
Vertex identity = {0, 0};
const unsigned int linevalue[] = {0, 40, 100, 300, 1200};

void loop() {
  clearScreen();
  scroll("TETRIS   ", 5, 4000);

  unsigned int lines = 0;
  unsigned int score = 0;
  unsigned long speed = getspeed(lines);
  unsigned long now = millis();
  unsigned int board[DIM];
  memset(board, 0, sizeof(unsigned int) * DIM);
  byte next = (byte)random(7);

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
      speed = getspeed(lines);
    }

    if ((millis() - now) > speed) {
      now = millis();

      if (move(&copy, &brick, 0, &down, board)) {
        memcpy(&brick, &copy, sizeof(FallingBrick));
      } else {
        Serial.println("Could not move down; merging.");
        printBrick(&brick);
        const byte removed = merge(&brick, board);
        lines += removed;
        score += linevalue[min(removed, 4)] + 1;

        brick.id = next;
        brick.rotation = 0;
        brick.location.x = 4;
        brick.location.y = 0;
        next = (int)random(7);
        drawnext(next);

        if (!move(&copy, &brick, 0, &down, board)) {
          gameover(score);
          return;
        }
      }
      drawboard(board, &brick);
    }
  }
}

void gameover(unsigned int score) {
  char buf[] = "SCORE:             ";
  // TODO: do something more elaborate
  Serial.println("--=GAME OVER=--");

  delay(1000);
  clearScreen();
  itoa(score, (char *)(buf + 6), 10);
  strcpy((char *)(buf + strlen(buf)), "  ");
  waspressed(&ROT); // clear button state
  scroll(buf, 5, -1);
}
