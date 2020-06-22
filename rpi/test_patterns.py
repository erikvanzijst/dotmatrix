import unittest
from typing import List

from patterns import blank, chess, scan


class TestPatterns(unittest.TestCase):

    def assertBoard(self, expected: List[str], value: List[int]) -> None:
        self.assertEqual(len(expected), len(value))
        self.assertListEqual([int(s, 2) for s in expected], value)

    def test_blank(self) -> None:
        self.assertBoard(['1111',
                          '1111',
                          '1111',
                          '1111'],
                         next(blank(4)))

    def test_chess(self) -> None:
        screens = chess(4)
        self.assertBoard(['1010',
                          '0101',
                          '1010',
                          '0101'],
                         next(screens))
        self.assertBoard(['0101',
                          '1010',
                          '0101',
                          '1010'],
                         next(screens))
        self.assertBoard(['1010',
                          '0101',
                          '1010',
                          '0101'],
                         next(screens))

    def test_scan(self) -> None:
        screens = scan(2)
        self.assertBoard(['10',
                          '00'], next(screens))
        self.assertBoard(['01',
                          '00'], next(screens))
        self.assertBoard(['00',
                          '10'], next(screens))
        self.assertBoard(['00',
                          '01'], next(screens))
        self.assertBoard(['10',
                          '00'], next(screens))
