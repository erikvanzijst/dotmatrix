from ctypes import c_bool, c_uint16
from time import time
from multiprocessing import Process, Value, Array
from typing import List

from gpiozero import DigitalOutputDevice


def _pulse(dev: DigitalOutputDevice) -> None:
    dev.pin.state = False
    dev.pin.state = True


def _run(screen: Array, die: Value, rowclk: int, rowsdi: int, oe: int, colsdi: int, colclk: int, le: int,
         showhz: bool):
    print("Connecting to display...")
    ROWSDI = DigitalOutputDevice(rowsdi)
    ROWCLK = DigitalOutputDevice(rowclk)
    COLSDI = DigitalOutputDevice(colsdi)
    COLCLK = DigitalOutputDevice(colclk)
    OE = DigitalOutputDevice(oe, initial_value=True)
    LE = DigitalOutputDevice(le)

    try:
        OE.pin.state = False
        cnt, last = 0, time()
        width = 2 ** MatrixDriver.DIM

        while not die.value:
            for row in range(MatrixDriver.DIM):
                LE.pin.state = False
                ROWSDI.pin.state = row != 0
                _pulse(ROWCLK)

                bit = 1
                value = screen[row]
                while bit < width:
                    COLSDI.pin.state = bool(value & bit)
                    _pulse(COLCLK)
                    bit <<= 1
                _pulse(LE)

            if showhz:
                cnt += 1
                now = time()
                if now - last > .5:
                    print("Refresh rate: %.1fHz" % (cnt / (now - last)))
                    cnt, last = 0, now
    finally:
        print("Releasing display...")
        ROWSDI.close()
        ROWCLK.close()
        COLSDI.close()
        COLCLK.close()
        LE.close()
        OE.close()


class MatrixDriver(object):
    DIM = 16

    def __init__(self, rowclk: int = 2, rowsdi: int = 3, oe: int = 4, colsdi: int = 17, colclk: int = 27, le: int = 22,
                 showhz: bool = False) -> None:
        self.screen = Array(c_uint16, [0] * self.DIM, lock=True)
        self.die = Value(c_bool, False)

        self.showhz = showhz
        self.process = Process(target=_run,
                               args=(self.screen, self.die, rowclk, rowsdi, oe, colsdi, colclk, le, showhz))
        self.process.start()

    def draw(self, screen: List[int]) -> None:
        assert len(screen) == self.DIM
        for i in range(self.DIM):
            self.screen[i] = screen[i]

    def setpixel(self, row: int, col: int, on: bool) -> None:
        if on:
            self.screen[row] |= (1 << col)
        else:
            self.screen[row] &= ((1 << col) ^ 0xff)

    def close(self) -> None:
        self.die.value = True
        self.process.join()
