const unsigned DIM        = 16;
const unsigned width      = DIM * DIM;

const unsigned int RCLK   = A0;
const unsigned int RSDI   = A1;
const unsigned int OE     = A2;
const unsigned int CSDI   = A3;
const unsigned int CCLK   = A4;
const unsigned int LE     = A5;

volatile unsigned int screen[DIM];
unsigned int cnt = 0;
unsigned long last = 0;

volatile unsigned int row = 0;

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
  for (int row = 0; row < DIM; row++) {
    screen[row] = 0;
  }
}

void pulse(unsigned int pin) {
  digitalWrite(pin, HIGH);
  digitalWrite(pin, LOW);
}

SIGNAL(TIMER0_COMPA_vect) {
  unsigned int col;
  unsigned long now;

  // Adjust for hardware wiring error:
  // https://github.com/erikvanzijst/dotmatrix/commit/3c7690eb47
  const unsigned int rowadj = (row % 2) ? row - 1 : row + 1;

  digitalWrite(RSDI, row != 0);
  pulse(RCLK);

  for (int col = 0; col < DIM; col++) {
    digitalWrite(CSDI, (screen[rowadj] & (1 << col)) ? HIGH : LOW);
    pulse(CCLK);    
  }
  pulse(LE);

// Can't print refresh rate in ISR
//  cnt++;
//  now = millis();
//  if (now - last > 5000) {
//    Serial.print((float)cnt / DIM);
//    Serial.print(": ");
//    Serial.print((1000.0 * cnt / ((float)now - last)) / DIM);
//    Serial.println("Hz");
//    cnt = 0;
//    last = now;
//  }
  row = (row + 1) % DIM;
}

void setpixel(unsigned int row, unsigned int col, bool on) {
  Serial.print("Setting pixel ");
  Serial.print(row);
  Serial.print(", ");
  Serial.println(col);
  if (on) {
    screen[row] |= (1 << col);
  } else {
    screen[row] &= ((1 << col) ^ 0xff);
  }
//  dumpscreen();
}

void dumpscreen() {
  for (int row = 0; row < DIM; row++) {
    Serial.println(screen[row], BIN);
  }
}

void loop() {
  for (int i = 0; ; i = ((i + 1) % width)) {
    clear();
    setpixel(i / DIM, i % DIM, true);
    delay(100);
  }
}
