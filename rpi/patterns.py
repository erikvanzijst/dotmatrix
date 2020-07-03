#!/usr/bin/env python3
import argparse
from itertools import cycle, islice
from time import sleep
from typing import List, Iterator

from driver import MatrixDriver


def blank(args, dim: int = MatrixDriver.DIM) -> Iterator[List[int]]:
    while True:
        yield [(2 ** dim) - 1] * dim


def chess(args, dim: int = MatrixDriver.DIM) -> Iterator[List[int]]:
    """Generates a chessboard pattern with each consecutive pattern the inverse of the previous."""
    for j in cycle((0, 1)):
        yield [int(''.join(islice(cycle(('0', '1') if (i + j) % 2 else ('1', '0')), dim)), 2) for i in range(dim)]


def scan(args, dim: int = MatrixDriver.DIM) -> Iterator[List[int]]:
    """Generates a sequence of baords with one pixel lit. The pixel moves,
    following the horizontal scan lines, moving from the top-left to
    bottom-right one row at a time.
    """
    i = 0
    while True:
        g = ('1' if j == i else '0' for j in range(0, dim ** 2))
        yield [int(''.join(islice(g, dim)), 2) for _ in range(dim)]
        i = (i + 1) % (dim ** 2)


def allpatterns(args, dim: int = MatrixDriver.DIM) -> Iterator[List[int]]:
    raise AssertionError('Not implemented')


def main():
    patterns = {
        'blank': blank,
        'chess': chess,
        'scan': scan,
        'all': allpatterns
    }

    parser = argparse.ArgumentParser(description='Test dot matrix display.')
    parser.add_argument('pattern', help='the pattern to show', choices=list(patterns) + ['all'], nargs=1)
    parser.add_argument('-i', '--interval', help='time in seconds between patterns', default=1)
    args = parser.parse_args()

    display = MatrixDriver(1, 2, 3, 4, 5, 6, showhz=True)

    try:
        while True:
            for p in patterns[args.pattern[0]](args, display.DIM):
                display.draw(p)
                sleep(args.interval)
    except KeyboardInterrupt:
        pass
    finally:
        display.close()


if __name__ == '__main__':
    main()
