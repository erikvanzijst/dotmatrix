const unsigned DIM        = 16;
const unsigned width      = DIM * DIM;

const unsigned int RCLK   = A0;
const unsigned int RSDI   = A1;
const unsigned int OE     = A2;
const unsigned int CSDI   = A3;
const unsigned int CCLK   = A4;
const unsigned int LE     = A5;

volatile unsigned int screen[DIM];
volatile byte row = 0;

void setup() {
  Serial.begin(115200);

  pinMode(RCLK, OUTPUT);
  pinMode(RSDI, OUTPUT);
  pinMode(OE, OUTPUT);
  pinMode(CSDI, OUTPUT);
  pinMode(CCLK, OUTPUT);
  pinMode(LE, OUTPUT);

  digitalWrite(OE, LOW);
  digitalWrite(LE, LOW);

  clear();

  // Schedule timer interrupt to draw 1 display row at a time on
  // Timer0 at 976.5625Hz yielding 61Hz refresh rate:
  OCR0A = 0xAF;
  TIMSK0 |= _BV(OCIE0A);
}

void clear() {
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

  for (unsigned int col = 1; col; col <<= 1) {
    digitalWrite(CSDI, (screen[row] & col) ? HIGH : LOW);
    pulse(CCLK);    
  }
  pulse(LE);
  row = (row + 1) % DIM;
}

// Adjust for hardware wiring error in v01:
// https://github.com/erikvanzijst/dotmatrix/commit/3c7690eb47
#define fix(row) (row + ((row & 1) ? -1 : 1))

void setpixel(unsigned int row, unsigned int col, bool on) {
  if (on) {
    screen[fix(row)] |= (1 << col);
  } else {
    screen[fix(row)] &= ((1 << col) ^ 0xff);
  }
}

void loop() {
  for (int i = 0; ; i = ((i + 1) % width)) {
    clear();
    setpixel(i / DIM, i % DIM, true);
    delay(30);
  }
}
