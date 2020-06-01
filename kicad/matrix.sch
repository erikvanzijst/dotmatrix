EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "16x16 LED Dot Matrix Display"
Date "2020-05-31"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 "Email: erik.van.zijst@gmail.com"
Comment4 "Author: Erik van Zijst"
$EndDescr
$Comp
L akn:DISP_LED_MAT_8x8_COM_ANODE D1
U 1 1 5EDDDB47
P 6025 3625
F 0 "D1" H 6700 4712 60  0000 C CNN
F 1 "DISP_LED_MAT_8x8_COM_ANODE" H 6700 4606 60  0000 C CNN
F 2 "akn_misc:LED_8x8_3MM_32x32MM" H 6125 3575 60  0001 C CNN
F 3 "" H 6125 3575 60  0000 C CNN
	1    6025 3625
	1    0    0    -1  
$EndComp
$Comp
L akn:DISP_LED_MAT_8x8_COM_ANODE D3
U 1 1 5EDE1F36
P 8800 3625
F 0 "D3" H 9475 4712 60  0000 C CNN
F 1 "DISP_LED_MAT_8x8_COM_ANODE" H 9475 4606 60  0000 C CNN
F 2 "akn_misc:LED_8x8_3MM_32x32MM" H 8900 3575 60  0001 C CNN
F 3 "" H 8900 3575 60  0000 C CNN
	1    8800 3625
	1    0    0    -1  
$EndComp
$Comp
L akn:DISP_LED_MAT_8x8_COM_ANODE D2
U 1 1 5EE08D5B
P 6025 6175
F 0 "D2" H 6700 7262 60  0000 C CNN
F 1 "DISP_LED_MAT_8x8_COM_ANODE" H 6700 7156 60  0000 C CNN
F 2 "akn_misc:LED_8x8_3MM_32x32MM" H 6125 6125 60  0001 C CNN
F 3 "" H 6125 6125 60  0000 C CNN
	1    6025 6175
	1    0    0    -1  
$EndComp
$Comp
L akn:DISP_LED_MAT_8x8_COM_ANODE D4
U 1 1 5EE08D61
P 8800 6175
F 0 "D4" H 9475 7262 60  0000 C CNN
F 1 "DISP_LED_MAT_8x8_COM_ANODE" H 9475 7156 60  0000 C CNN
F 2 "akn_misc:LED_8x8_3MM_32x32MM" H 8900 6125 60  0001 C CNN
F 3 "" H 8900 6125 60  0000 C CNN
	1    8800 6175
	1    0    0    -1  
$EndComp
$Comp
L local:TLC59025 U1
U 1 1 5EE0C466
P 3650 5775
F 0 "U1" V 4150 4900 50  0000 R CNN
F 1 "TLC59025" V 3650 5975 50  0000 R CNN
F 2 "Package_SO:SSOP-24_3.9x8.7mm_P0.635mm" H 3650 5775 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tlc59025.pdf" H 3650 5775 50  0001 C CNN
	1    3650 5775
	0    -1   -1   0   
$EndComp
Entry Wire Line
	7600 2825 7700 2925
Entry Wire Line
	7600 2925 7700 3025
Entry Wire Line
	7600 3025 7700 3125
Entry Wire Line
	7600 3125 7700 3225
Entry Wire Line
	7600 3225 7700 3325
Entry Wire Line
	7600 3325 7700 3425
Entry Wire Line
	7600 3425 7700 3525
Entry Wire Line
	7600 3525 7700 3625
Entry Wire Line
	7600 5375 7700 5475
Entry Wire Line
	7600 5475 7700 5575
Entry Wire Line
	7600 5575 7700 5675
Entry Wire Line
	7600 5675 7700 5775
Entry Wire Line
	7600 5775 7700 5875
Entry Wire Line
	7600 5875 7700 5975
Entry Wire Line
	7600 5975 7700 6075
Entry Wire Line
	7600 6075 7700 6175
Connection ~ 7700 4900
Wire Wire Line
	7375 2825 7600 2825
Wire Wire Line
	7600 2925 7375 2925
Wire Wire Line
	7375 3025 7600 3025
Wire Wire Line
	7600 3125 7375 3125
Wire Wire Line
	7375 3225 7600 3225
Wire Wire Line
	7600 3325 7375 3325
Wire Wire Line
	7375 3425 7600 3425
Wire Wire Line
	7600 3525 7375 3525
Text Label 7375 2825 0    50   ~ 0
COL0
Text Label 7375 2925 0    50   ~ 0
COL1
Text Label 7375 3025 0    50   ~ 0
COL2
Text Label 7375 3125 0    50   ~ 0
COL3
Text Label 7375 3225 0    50   ~ 0
COL4
Text Label 7375 3325 0    50   ~ 0
COL5
Text Label 7375 3425 0    50   ~ 0
COL6
Text Label 7375 3525 0    50   ~ 0
COL7
Wire Wire Line
	7375 5375 7600 5375
Wire Wire Line
	7600 5475 7375 5475
Wire Wire Line
	7375 5575 7600 5575
Wire Wire Line
	7600 5675 7375 5675
Wire Wire Line
	7375 5775 7600 5775
Wire Wire Line
	7600 5875 7375 5875
Wire Wire Line
	7375 5975 7600 5975
Wire Wire Line
	7600 6075 7375 6075
Text Label 7375 5375 0    50   ~ 0
COL0
Text Label 7375 5475 0    50   ~ 0
COL1
Text Label 7375 5575 0    50   ~ 0
COL2
Text Label 7375 5675 0    50   ~ 0
COL3
Text Label 7375 5775 0    50   ~ 0
COL4
Text Label 7375 5875 0    50   ~ 0
COL5
Text Label 7375 5975 0    50   ~ 0
COL6
Text Label 7375 6075 0    50   ~ 0
COL7
Wire Wire Line
	2900 5225 2900 5000
Wire Wire Line
	3000 5000 3000 5225
Wire Wire Line
	3100 5225 3100 5000
Wire Wire Line
	3200 5000 3200 5225
Wire Wire Line
	3300 5225 3300 5000
Wire Wire Line
	3400 5000 3400 5225
Wire Wire Line
	3500 5225 3500 5000
Wire Wire Line
	3600 5000 3600 5225
Text Label 2900 5225 1    50   ~ 0
COL0
Text Label 3000 5225 1    50   ~ 0
COL1
Text Label 3100 5225 1    50   ~ 0
COL2
Text Label 3200 5225 1    50   ~ 0
COL3
Text Label 3300 5225 1    50   ~ 0
COL4
Text Label 3400 5225 1    50   ~ 0
COL5
Text Label 3500 5225 1    50   ~ 0
COL6
Text Label 3600 5225 1    50   ~ 0
COL7
Entry Wire Line
	3600 5000 3700 4900
Entry Wire Line
	3500 5000 3600 4900
Entry Wire Line
	3400 5000 3500 4900
Entry Wire Line
	3300 5000 3400 4900
Entry Wire Line
	3200 5000 3300 4900
Entry Wire Line
	3100 5000 3200 4900
Entry Wire Line
	3000 5000 3100 4900
Entry Wire Line
	2900 5000 3000 4900
Wire Wire Line
	10375 3525 10150 3525
Wire Wire Line
	10150 3425 10375 3425
Wire Wire Line
	10375 3325 10150 3325
Wire Wire Line
	10150 3225 10375 3225
Wire Wire Line
	10375 3125 10150 3125
Wire Wire Line
	10150 3025 10375 3025
Wire Wire Line
	10375 2925 10150 2925
Wire Wire Line
	10150 2825 10375 2825
Text Label 10375 3525 2    50   ~ 0
COL15
Text Label 10375 3425 2    50   ~ 0
COL14
Text Label 10375 3325 2    50   ~ 0
COL13
Text Label 10375 3225 2    50   ~ 0
COL12
Text Label 10375 3125 2    50   ~ 0
COL11
Text Label 10375 3025 2    50   ~ 0
COL10
Text Label 10325 2925 2    50   ~ 0
COL9
Text Label 10325 2825 2    50   ~ 0
COL8
Wire Wire Line
	10375 6075 10150 6075
Wire Wire Line
	10150 5975 10375 5975
Wire Wire Line
	10375 5875 10150 5875
Wire Wire Line
	10150 5775 10375 5775
Wire Wire Line
	10375 5675 10150 5675
Wire Wire Line
	10150 5575 10375 5575
Wire Wire Line
	10375 5475 10150 5475
Wire Wire Line
	10150 5375 10375 5375
Text Label 10375 6075 2    50   ~ 0
COL15
Text Label 10375 5975 2    50   ~ 0
COL14
Text Label 10375 5875 2    50   ~ 0
COL13
Text Label 10375 5775 2    50   ~ 0
COL12
Text Label 10375 5675 2    50   ~ 0
COL11
Text Label 10375 5575 2    50   ~ 0
COL10
Text Label 10325 5475 2    50   ~ 0
COL9
Text Label 10325 5375 2    50   ~ 0
COL8
Entry Wire Line
	10375 2825 10475 2925
Entry Wire Line
	10375 2925 10475 3025
Entry Wire Line
	10375 3025 10475 3125
Entry Wire Line
	10375 3125 10475 3225
Entry Wire Line
	10375 3225 10475 3325
Entry Wire Line
	10375 3325 10475 3425
Entry Wire Line
	10375 3425 10475 3525
Entry Wire Line
	10375 3525 10475 3625
Entry Wire Line
	10375 5375 10475 5475
Entry Wire Line
	10375 5475 10475 5575
Entry Wire Line
	10375 5575 10475 5675
Entry Wire Line
	10375 5675 10475 5775
Entry Wire Line
	10375 5775 10475 5875
Entry Wire Line
	10375 5875 10475 5975
Entry Wire Line
	10375 5975 10475 6075
Entry Wire Line
	10375 6075 10475 6175
Connection ~ 10475 4900
Wire Bus Line
	5725 4900 7700 4900
Wire Bus Line
	7700 4900 10475 4900
Wire Wire Line
	4400 5000 4400 5225
Wire Wire Line
	4300 5225 4300 5000
Wire Wire Line
	4200 5000 4200 5225
Wire Wire Line
	4100 5225 4100 5000
Wire Wire Line
	4000 5000 4000 5225
Wire Wire Line
	3900 5225 3900 5000
Wire Wire Line
	3800 5000 3800 5225
Wire Wire Line
	3700 5225 3700 5000
Text Label 4400 5000 3    50   ~ 0
COL15
Text Label 4200 5000 3    50   ~ 0
COL13
Text Label 4100 5000 3    50   ~ 0
COL12
Text Label 4000 5000 3    50   ~ 0
COL11
Text Label 3900 5000 3    50   ~ 0
COL10
Text Label 3800 5025 3    50   ~ 0
COL9
Text Label 3700 5025 3    50   ~ 0
COL8
Entry Wire Line
	4400 5000 4500 4900
Entry Wire Line
	4300 5000 4400 4900
Text Label 4300 5000 3    50   ~ 0
COL14
Entry Wire Line
	4200 5000 4300 4900
Entry Wire Line
	4100 5000 4200 4900
Entry Wire Line
	4000 5000 4100 4900
Entry Wire Line
	3900 5000 4000 4900
Entry Wire Line
	3800 5000 3900 4900
Entry Wire Line
	3700 5000 3800 4900
$Comp
L power:GND #PWR06
U 1 1 5EE2949F
P 4700 6600
F 0 "#PWR06" H 4700 6350 50  0001 C CNN
F 1 "GND" H 4705 6427 50  0000 C CNN
F 2 "" H 4700 6600 50  0001 C CNN
F 3 "" H 4700 6600 50  0001 C CNN
	1    4700 6600
	1    0    0    -1  
$EndComp
Wire Wire Line
	4600 5775 4700 5775
Wire Wire Line
	4700 5775 4700 6450
$Comp
L power:VDD #PWR01
U 1 1 5EE2B883
P 2425 5650
F 0 "#PWR01" H 2425 5500 50  0001 C CNN
F 1 "VDD" H 2442 5823 50  0000 C CNN
F 2 "" H 2425 5650 50  0001 C CNN
F 3 "" H 2425 5650 50  0001 C CNN
	1    2425 5650
	1    0    0    -1  
$EndComp
Wire Wire Line
	2425 5775 2650 5775
$Comp
L 74xx:74HC595 U3
U 1 1 5EE2D2DB
P 2075 3700
F 0 "U3" H 2250 4250 50  0000 R CNN
F 1 "74HC595" V 2075 3700 50  0000 R CNN
F 2 "Package_SO:SOIC-16_3.9x9.9mm_P1.27mm" H 2075 3700 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74hc595.pdf" H 2075 3700 50  0001 C CNN
	1    2075 3700
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC595 U2
U 1 1 5EE2FD5B
P 2075 2150
F 0 "U2" H 2250 2700 50  0000 R CNN
F 1 "74HC595" V 2075 2175 50  0000 R CNN
F 2 "Package_SO:SOIC-16_3.9x9.9mm_P1.27mm" H 2075 2150 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74hc595.pdf" H 2075 2150 50  0001 C CNN
	1    2075 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	2475 2650 2600 2650
Wire Wire Line
	2600 2650 2600 3000
Wire Wire Line
	2600 3000 1600 3000
Wire Wire Line
	1600 3000 1600 3300
Wire Wire Line
	1600 3300 1675 3300
$Comp
L power:GND #PWR05
U 1 1 5EE5EF5C
P 2075 4400
F 0 "#PWR05" H 2075 4150 50  0001 C CNN
F 1 "GND" V 2080 4272 50  0000 R CNN
F 2 "" H 2075 4400 50  0001 C CNN
F 3 "" H 2075 4400 50  0001 C CNN
	1    2075 4400
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR04
U 1 1 5EE5F5AD
P 1975 2875
F 0 "#PWR04" H 1975 2625 50  0001 C CNN
F 1 "GND" V 1980 2747 50  0000 R CNN
F 2 "" H 1975 2875 50  0001 C CNN
F 3 "" H 1975 2875 50  0001 C CNN
	1    1975 2875
	0    1    1    0   
$EndComp
Wire Wire Line
	1675 2350 1500 2350
Wire Wire Line
	1500 2350 1500 3900
Wire Wire Line
	1500 3900 1675 3900
Wire Wire Line
	1675 2050 1425 2050
Wire Wire Line
	1425 2050 1425 3600
Wire Wire Line
	1425 3600 1675 3600
Wire Wire Line
	1675 1950 1350 1950
Wire Wire Line
	1350 1950 1350 3500
Wire Wire Line
	1350 3500 1675 3500
$Comp
L power:VDD #PWR03
U 1 1 5EE68524
P 1975 3075
F 0 "#PWR03" H 1975 2925 50  0001 C CNN
F 1 "VDD" V 1993 3202 50  0000 L CNN
F 2 "" H 1975 3075 50  0001 C CNN
F 3 "" H 1975 3075 50  0001 C CNN
	1    1975 3075
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1975 3075 2075 3075
Wire Wire Line
	2075 3075 2075 3100
$Comp
L power:VDD #PWR02
U 1 1 5EE6B22D
P 1975 1525
F 0 "#PWR02" H 1975 1375 50  0001 C CNN
F 1 "VDD" V 1993 1652 50  0000 L CNN
F 2 "" H 1975 1525 50  0001 C CNN
F 3 "" H 1975 1525 50  0001 C CNN
	1    1975 1525
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1975 1525 2075 1525
Wire Wire Line
	2075 1525 2075 1550
Text Label 1525 3900 0    50   ~ 0
~OE
Text Label 3500 6400 0    50   ~ 0
~OE
Wire Wire Line
	3500 6275 3500 6400
Wire Wire Line
	2475 1750 2725 1750
Wire Wire Line
	2475 1850 2725 1850
Wire Wire Line
	2475 1950 2725 1950
Wire Wire Line
	2475 2050 2725 2050
Wire Wire Line
	2475 2150 2725 2150
Wire Wire Line
	2475 2250 2725 2250
Wire Wire Line
	2475 2350 2725 2350
Wire Wire Line
	2475 2450 2725 2450
Wire Wire Line
	2475 3300 2725 3300
Wire Wire Line
	2475 3400 2725 3400
Wire Wire Line
	2475 3500 2725 3500
Wire Wire Line
	2475 3600 2725 3600
Wire Wire Line
	2475 3700 2725 3700
Wire Wire Line
	2475 3800 2725 3800
Wire Wire Line
	2475 3900 2725 3900
Wire Wire Line
	2475 4000 2725 4000
NoConn ~ 2475 4200
Text Label 2475 1750 0    50   ~ 0
ROW1
Text Label 2475 1850 0    50   ~ 0
ROW2
Text Label 2475 1950 0    50   ~ 0
ROW3
Text Label 2475 2050 0    50   ~ 0
ROW4
Text Label 2475 2150 0    50   ~ 0
ROW5
Text Label 2475 2250 0    50   ~ 0
ROW6
Text Label 2475 2350 0    50   ~ 0
ROW7
Text Label 2475 2450 0    50   ~ 0
ROW8
Text Label 2475 3300 0    50   ~ 0
ROW9
Text Label 2475 3400 0    50   ~ 0
ROW10
Text Label 2475 3500 0    50   ~ 0
ROW11
Text Label 2475 3600 0    50   ~ 0
ROW12
Text Label 2475 3700 0    50   ~ 0
ROW13
Text Label 2475 3800 0    50   ~ 0
ROW14
Text Label 2475 3900 0    50   ~ 0
ROW15
Text Label 2475 4000 0    50   ~ 0
ROW16
Wire Wire Line
	5775 2825 6025 2825
Wire Wire Line
	5775 2925 6025 2925
Wire Wire Line
	5775 3025 6025 3025
Wire Wire Line
	5775 3125 6025 3125
Wire Wire Line
	5775 3225 6025 3225
Wire Wire Line
	5775 3325 6025 3325
Wire Wire Line
	5775 3425 6025 3425
Wire Wire Line
	5775 3525 6025 3525
Text Label 5775 2825 0    50   ~ 0
ROW1
Text Label 5775 2925 0    50   ~ 0
ROW2
Text Label 5775 3025 0    50   ~ 0
ROW3
Text Label 5775 3125 0    50   ~ 0
ROW4
Text Label 5775 3225 0    50   ~ 0
ROW5
Text Label 5775 3325 0    50   ~ 0
ROW6
Text Label 5775 3425 0    50   ~ 0
ROW7
Text Label 5775 3525 0    50   ~ 0
ROW8
Wire Wire Line
	5775 5375 6025 5375
Wire Wire Line
	5775 5475 6025 5475
Wire Wire Line
	5775 5575 6025 5575
Wire Wire Line
	5775 5675 6025 5675
Wire Wire Line
	5775 5775 6025 5775
Wire Wire Line
	5775 5875 6025 5875
Wire Wire Line
	5775 5975 6025 5975
Wire Wire Line
	5775 6075 6025 6075
Text Label 5775 5375 0    50   ~ 0
ROW9
Text Label 5775 5475 0    50   ~ 0
ROW10
Text Label 5775 5575 0    50   ~ 0
ROW11
Text Label 5775 5675 0    50   ~ 0
ROW12
Text Label 5775 5775 0    50   ~ 0
ROW13
Text Label 5775 5875 0    50   ~ 0
ROW14
Text Label 5775 5975 0    50   ~ 0
ROW15
Text Label 5775 6075 0    50   ~ 0
ROW16
Wire Wire Line
	8550 5375 8800 5375
Wire Wire Line
	8550 5475 8800 5475
Wire Wire Line
	8550 5575 8800 5575
Wire Wire Line
	8550 5675 8800 5675
Wire Wire Line
	8550 5775 8800 5775
Wire Wire Line
	8550 5875 8800 5875
Wire Wire Line
	8550 5975 8800 5975
Wire Wire Line
	8550 6075 8800 6075
Text Label 8550 5375 0    50   ~ 0
ROW9
Text Label 8550 5475 0    50   ~ 0
ROW10
Text Label 8550 5575 0    50   ~ 0
ROW11
Text Label 8550 5675 0    50   ~ 0
ROW12
Text Label 8550 5775 0    50   ~ 0
ROW13
Text Label 8550 5875 0    50   ~ 0
ROW14
Text Label 8550 5975 0    50   ~ 0
ROW15
Text Label 8550 6075 0    50   ~ 0
ROW16
Wire Wire Line
	8550 2825 8800 2825
Wire Wire Line
	8550 2925 8800 2925
Wire Wire Line
	8550 3025 8800 3025
Wire Wire Line
	8550 3125 8800 3125
Wire Wire Line
	8550 3225 8800 3225
Wire Wire Line
	8550 3325 8800 3325
Wire Wire Line
	8550 3425 8800 3425
Wire Wire Line
	8550 3525 8800 3525
Text Label 8550 2825 0    50   ~ 0
ROW1
Text Label 8550 2925 0    50   ~ 0
ROW2
Text Label 8550 3025 0    50   ~ 0
ROW3
Text Label 8550 3125 0    50   ~ 0
ROW4
Text Label 8550 3225 0    50   ~ 0
ROW5
Text Label 8550 3325 0    50   ~ 0
ROW6
Text Label 8550 3425 0    50   ~ 0
ROW7
Text Label 8550 3525 0    50   ~ 0
ROW8
Entry Wire Line
	5775 2825 5675 2925
Entry Wire Line
	5775 2925 5675 3025
Entry Wire Line
	5775 3025 5675 3125
Entry Wire Line
	5775 3125 5675 3225
Entry Wire Line
	5775 3225 5675 3325
Entry Wire Line
	5775 3325 5675 3425
Entry Wire Line
	5775 3425 5675 3525
Entry Wire Line
	5775 3525 5675 3625
Entry Wire Line
	5775 5375 5675 5475
Entry Wire Line
	5775 5475 5675 5575
Entry Wire Line
	5775 5575 5675 5675
Entry Wire Line
	5775 5675 5675 5775
Entry Wire Line
	5775 5775 5675 5875
Entry Wire Line
	5775 5875 5675 5975
Entry Wire Line
	5775 5975 5675 6075
Entry Wire Line
	5775 6075 5675 6175
Wire Bus Line
	8500 4900 10475 4900
Entry Wire Line
	8550 2825 8450 2925
Entry Wire Line
	8550 2925 8450 3025
Entry Wire Line
	8550 3025 8450 3125
Entry Wire Line
	8550 3125 8450 3225
Entry Wire Line
	8550 3225 8450 3325
Entry Wire Line
	8550 3325 8450 3425
Entry Wire Line
	8550 3425 8450 3525
Entry Wire Line
	8550 3525 8450 3625
Entry Wire Line
	8550 5375 8450 5475
Entry Wire Line
	8550 5475 8450 5575
Entry Wire Line
	8550 5575 8450 5675
Entry Wire Line
	8550 5675 8450 5775
Entry Wire Line
	8550 5775 8450 5875
Entry Wire Line
	8550 5875 8450 5975
Entry Wire Line
	8550 5975 8450 6075
Entry Wire Line
	8550 6075 8450 6175
Wire Bus Line
	8450 3875 5675 3875
Connection ~ 8450 3875
Connection ~ 5675 3875
Wire Bus Line
	6725 3875 5675 3875
$Comp
L Device:R R1
U 1 1 5EF48347
P 4300 6450
F 0 "R1" V 4093 6450 50  0000 C CNN
F 1 "2.2K" V 4184 6450 50  0000 C CNN
F 2 "" V 4230 6450 50  0001 C CNN
F 3 "~" H 4300 6450 50  0001 C CNN
	1    4300 6450
	0    1    1    0   
$EndComp
Wire Wire Line
	4450 6450 4700 6450
Connection ~ 4700 6450
Wire Wire Line
	4700 6450 4700 6600
Wire Wire Line
	3300 6275 3300 6450
Wire Wire Line
	3300 6450 4150 6450
$Comp
L Device:C C1
U 1 1 5EF743CF
P 2425 5925
F 0 "C1" H 2540 5971 50  0000 L CNN
F 1 "C" H 2540 5880 50  0000 L CNN
F 2 "" H 2463 5775 50  0001 C CNN
F 3 "~" H 2425 5925 50  0001 C CNN
	1    2425 5925
	1    0    0    -1  
$EndComp
Connection ~ 2425 5775
Wire Wire Line
	2425 5650 2425 5775
Wire Wire Line
	3300 6450 2425 6450
Wire Wire Line
	2425 6450 2425 6075
Connection ~ 3300 6450
$Comp
L Device:C C2
U 1 1 5EF8250E
P 2350 3075
F 0 "C2" V 2098 3075 50  0000 C CNN
F 1 "100nF" V 2189 3075 50  0000 C CNN
F 2 "" H 2388 2925 50  0001 C CNN
F 3 "~" H 2350 3075 50  0001 C CNN
	1    2350 3075
	0    1    1    0   
$EndComp
Wire Wire Line
	2075 3075 2200 3075
Connection ~ 2075 3075
Wire Wire Line
	1975 2875 2075 2875
Wire Wire Line
	2500 2875 2500 3075
Wire Wire Line
	2075 2850 2075 2875
Connection ~ 2075 2875
Wire Wire Line
	2075 2875 2500 2875
$Comp
L Device:C C3
U 1 1 5EFA155D
P 2375 1525
F 0 "C3" V 2123 1525 50  0000 C CNN
F 1 "100nF" V 2214 1525 50  0000 C CNN
F 2 "" H 2413 1375 50  0001 C CNN
F 3 "~" H 2375 1525 50  0001 C CNN
	1    2375 1525
	0    1    1    0   
$EndComp
Wire Wire Line
	2075 1525 2225 1525
Connection ~ 2075 1525
$Comp
L power:GND #PWR07
U 1 1 5EFA945D
P 2625 1525
F 0 "#PWR07" H 2625 1275 50  0001 C CNN
F 1 "GND" V 2630 1397 50  0000 R CNN
F 2 "" H 2625 1525 50  0001 C CNN
F 3 "" H 2625 1525 50  0001 C CNN
	1    2625 1525
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2525 1525 2625 1525
$Comp
L dk_Transistors-FETs-MOSFETs-Arrays:2N7002DW-7-F Q?
U 1 1 5EFDDAF7
P 3650 1450
F 0 "Q?" V 3597 1778 60  0000 L CNN
F 1 "2N7002DW-7-F" V 3703 1778 60  0000 L CNN
F 2 "digikey-footprints:SOT-363" H 3850 1650 60  0001 L CNN
F 3 "https://www.diodes.com/assets/Datasheets/ds30120.pdf" H 3850 1750 60  0001 L CNN
F 4 "2N7002DW-FDICT-ND" H 3850 1850 60  0001 L CNN "Digi-Key_PN"
F 5 "2N7002DW-7-F" H 3850 1950 60  0001 L CNN "MPN"
F 6 "Discrete Semiconductor Products" H 3850 2050 60  0001 L CNN "Category"
F 7 "Transistors - FETs, MOSFETs - Arrays" H 3850 2150 60  0001 L CNN "Family"
F 8 "https://www.diodes.com/assets/Datasheets/ds30120.pdf" H 3850 2250 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/diodes-incorporated/2N7002DW-7-F/2N7002DW-FDICT-ND/750003" H 3850 2350 60  0001 L CNN "DK_Detail_Page"
F 10 "MOSFET 2N-CH 60V 0.23A SOT-363" H 3850 2450 60  0001 L CNN "Description"
F 11 "Diodes Incorporated" H 3850 2550 60  0001 L CNN "Manufacturer"
F 12 "Active" H 3850 2650 60  0001 L CNN "Status"
	1    3650 1450
	0    1    1    0   
$EndComp
$Comp
L dk_Transistors-FETs-MOSFETs-Arrays:2N7002DW-7-F Q?
U 1 1 5EFF4DCD
P 4750 1450
F 0 "Q?" V 4697 1778 60  0000 L CNN
F 1 "2N7002DW-7-F" V 4803 1778 60  0000 L CNN
F 2 "digikey-footprints:SOT-363" H 4950 1650 60  0001 L CNN
F 3 "https://www.diodes.com/assets/Datasheets/ds30120.pdf" H 4950 1750 60  0001 L CNN
F 4 "2N7002DW-FDICT-ND" H 4950 1850 60  0001 L CNN "Digi-Key_PN"
F 5 "2N7002DW-7-F" H 4950 1950 60  0001 L CNN "MPN"
F 6 "Discrete Semiconductor Products" H 4950 2050 60  0001 L CNN "Category"
F 7 "Transistors - FETs, MOSFETs - Arrays" H 4950 2150 60  0001 L CNN "Family"
F 8 "https://www.diodes.com/assets/Datasheets/ds30120.pdf" H 4950 2250 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/diodes-incorporated/2N7002DW-7-F/2N7002DW-FDICT-ND/750003" H 4950 2350 60  0001 L CNN "DK_Detail_Page"
F 10 "MOSFET 2N-CH 60V 0.23A SOT-363" H 4950 2450 60  0001 L CNN "Description"
F 11 "Diodes Incorporated" H 4950 2550 60  0001 L CNN "Manufacturer"
F 12 "Active" H 4950 2650 60  0001 L CNN "Status"
	1    4750 1450
	0    1    1    0   
$EndComp
$Comp
L dk_Transistors-FETs-MOSFETs-Arrays:2N7002DW-7-F Q?
U 1 1 5EFFE58A
P 3650 2325
F 0 "Q?" V 3597 2653 60  0000 L CNN
F 1 "2N7002DW-7-F" V 3703 2653 60  0000 L CNN
F 2 "digikey-footprints:SOT-363" H 3850 2525 60  0001 L CNN
F 3 "https://www.diodes.com/assets/Datasheets/ds30120.pdf" H 3850 2625 60  0001 L CNN
F 4 "2N7002DW-FDICT-ND" H 3850 2725 60  0001 L CNN "Digi-Key_PN"
F 5 "2N7002DW-7-F" H 3850 2825 60  0001 L CNN "MPN"
F 6 "Discrete Semiconductor Products" H 3850 2925 60  0001 L CNN "Category"
F 7 "Transistors - FETs, MOSFETs - Arrays" H 3850 3025 60  0001 L CNN "Family"
F 8 "https://www.diodes.com/assets/Datasheets/ds30120.pdf" H 3850 3125 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/diodes-incorporated/2N7002DW-7-F/2N7002DW-FDICT-ND/750003" H 3850 3225 60  0001 L CNN "DK_Detail_Page"
F 10 "MOSFET 2N-CH 60V 0.23A SOT-363" H 3850 3325 60  0001 L CNN "Description"
F 11 "Diodes Incorporated" H 3850 3425 60  0001 L CNN "Manufacturer"
F 12 "Active" H 3850 3525 60  0001 L CNN "Status"
	1    3650 2325
	0    1    1    0   
$EndComp
$Comp
L dk_Transistors-FETs-MOSFETs-Arrays:2N7002DW-7-F Q?
U 1 1 5EFFE599
P 4750 2325
F 0 "Q?" V 4697 2653 60  0000 L CNN
F 1 "2N7002DW-7-F" V 4803 2653 60  0000 L CNN
F 2 "digikey-footprints:SOT-363" H 4950 2525 60  0001 L CNN
F 3 "https://www.diodes.com/assets/Datasheets/ds30120.pdf" H 4950 2625 60  0001 L CNN
F 4 "2N7002DW-FDICT-ND" H 4950 2725 60  0001 L CNN "Digi-Key_PN"
F 5 "2N7002DW-7-F" H 4950 2825 60  0001 L CNN "MPN"
F 6 "Discrete Semiconductor Products" H 4950 2925 60  0001 L CNN "Category"
F 7 "Transistors - FETs, MOSFETs - Arrays" H 4950 3025 60  0001 L CNN "Family"
F 8 "https://www.diodes.com/assets/Datasheets/ds30120.pdf" H 4950 3125 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/diodes-incorporated/2N7002DW-7-F/2N7002DW-FDICT-ND/750003" H 4950 3225 60  0001 L CNN "DK_Detail_Page"
F 10 "MOSFET 2N-CH 60V 0.23A SOT-363" H 4950 3325 60  0001 L CNN "Description"
F 11 "Diodes Incorporated" H 4950 3425 60  0001 L CNN "Manufacturer"
F 12 "Active" H 4950 3525 60  0001 L CNN "Status"
	1    4750 2325
	0    1    1    0   
$EndComp
$Comp
L dk_Transistors-FETs-MOSFETs-Arrays:2N7002DW-7-F Q?
U 1 1 5F028EB6
P 3650 3375
F 0 "Q?" V 3597 3703 60  0000 L CNN
F 1 "2N7002DW-7-F" V 3703 3703 60  0000 L CNN
F 2 "digikey-footprints:SOT-363" H 3850 3575 60  0001 L CNN
F 3 "https://www.diodes.com/assets/Datasheets/ds30120.pdf" H 3850 3675 60  0001 L CNN
F 4 "2N7002DW-FDICT-ND" H 3850 3775 60  0001 L CNN "Digi-Key_PN"
F 5 "2N7002DW-7-F" H 3850 3875 60  0001 L CNN "MPN"
F 6 "Discrete Semiconductor Products" H 3850 3975 60  0001 L CNN "Category"
F 7 "Transistors - FETs, MOSFETs - Arrays" H 3850 4075 60  0001 L CNN "Family"
F 8 "https://www.diodes.com/assets/Datasheets/ds30120.pdf" H 3850 4175 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/diodes-incorporated/2N7002DW-7-F/2N7002DW-FDICT-ND/750003" H 3850 4275 60  0001 L CNN "DK_Detail_Page"
F 10 "MOSFET 2N-CH 60V 0.23A SOT-363" H 3850 4375 60  0001 L CNN "Description"
F 11 "Diodes Incorporated" H 3850 4475 60  0001 L CNN "Manufacturer"
F 12 "Active" H 3850 4575 60  0001 L CNN "Status"
	1    3650 3375
	0    1    1    0   
$EndComp
$Comp
L dk_Transistors-FETs-MOSFETs-Arrays:2N7002DW-7-F Q?
U 1 1 5F028EC5
P 4750 3375
F 0 "Q?" V 4697 3703 60  0000 L CNN
F 1 "2N7002DW-7-F" V 4803 3703 60  0000 L CNN
F 2 "digikey-footprints:SOT-363" H 4950 3575 60  0001 L CNN
F 3 "https://www.diodes.com/assets/Datasheets/ds30120.pdf" H 4950 3675 60  0001 L CNN
F 4 "2N7002DW-FDICT-ND" H 4950 3775 60  0001 L CNN "Digi-Key_PN"
F 5 "2N7002DW-7-F" H 4950 3875 60  0001 L CNN "MPN"
F 6 "Discrete Semiconductor Products" H 4950 3975 60  0001 L CNN "Category"
F 7 "Transistors - FETs, MOSFETs - Arrays" H 4950 4075 60  0001 L CNN "Family"
F 8 "https://www.diodes.com/assets/Datasheets/ds30120.pdf" H 4950 4175 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/diodes-incorporated/2N7002DW-7-F/2N7002DW-FDICT-ND/750003" H 4950 4275 60  0001 L CNN "DK_Detail_Page"
F 10 "MOSFET 2N-CH 60V 0.23A SOT-363" H 4950 4375 60  0001 L CNN "Description"
F 11 "Diodes Incorporated" H 4950 4475 60  0001 L CNN "Manufacturer"
F 12 "Active" H 4950 4575 60  0001 L CNN "Status"
	1    4750 3375
	0    1    1    0   
$EndComp
$Comp
L dk_Transistors-FETs-MOSFETs-Arrays:2N7002DW-7-F Q?
U 1 1 5F028ED4
P 3650 4250
F 0 "Q?" V 3597 4578 60  0000 L CNN
F 1 "2N7002DW-7-F" V 3703 4578 60  0000 L CNN
F 2 "digikey-footprints:SOT-363" H 3850 4450 60  0001 L CNN
F 3 "https://www.diodes.com/assets/Datasheets/ds30120.pdf" H 3850 4550 60  0001 L CNN
F 4 "2N7002DW-FDICT-ND" H 3850 4650 60  0001 L CNN "Digi-Key_PN"
F 5 "2N7002DW-7-F" H 3850 4750 60  0001 L CNN "MPN"
F 6 "Discrete Semiconductor Products" H 3850 4850 60  0001 L CNN "Category"
F 7 "Transistors - FETs, MOSFETs - Arrays" H 3850 4950 60  0001 L CNN "Family"
F 8 "https://www.diodes.com/assets/Datasheets/ds30120.pdf" H 3850 5050 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/diodes-incorporated/2N7002DW-7-F/2N7002DW-FDICT-ND/750003" H 3850 5150 60  0001 L CNN "DK_Detail_Page"
F 10 "MOSFET 2N-CH 60V 0.23A SOT-363" H 3850 5250 60  0001 L CNN "Description"
F 11 "Diodes Incorporated" H 3850 5350 60  0001 L CNN "Manufacturer"
F 12 "Active" H 3850 5450 60  0001 L CNN "Status"
	1    3650 4250
	0    1    1    0   
$EndComp
$Comp
L dk_Transistors-FETs-MOSFETs-Arrays:2N7002DW-7-F Q?
U 1 1 5F028EE3
P 4750 4250
F 0 "Q?" V 4697 4578 60  0000 L CNN
F 1 "2N7002DW-7-F" V 4803 4578 60  0000 L CNN
F 2 "digikey-footprints:SOT-363" H 4950 4450 60  0001 L CNN
F 3 "https://www.diodes.com/assets/Datasheets/ds30120.pdf" H 4950 4550 60  0001 L CNN
F 4 "2N7002DW-FDICT-ND" H 4950 4650 60  0001 L CNN "Digi-Key_PN"
F 5 "2N7002DW-7-F" H 4950 4750 60  0001 L CNN "MPN"
F 6 "Discrete Semiconductor Products" H 4950 4850 60  0001 L CNN "Category"
F 7 "Transistors - FETs, MOSFETs - Arrays" H 4950 4950 60  0001 L CNN "Family"
F 8 "https://www.diodes.com/assets/Datasheets/ds30120.pdf" H 4950 5050 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/diodes-incorporated/2N7002DW-7-F/2N7002DW-FDICT-ND/750003" H 4950 5150 60  0001 L CNN "DK_Detail_Page"
F 10 "MOSFET 2N-CH 60V 0.23A SOT-363" H 4950 5250 60  0001 L CNN "Description"
F 11 "Diodes Incorporated" H 4950 5350 60  0001 L CNN "Manufacturer"
F 12 "Active" H 4950 5450 60  0001 L CNN "Status"
	1    4750 4250
	0    1    1    0   
$EndComp
Wire Bus Line
	10475 4900 10475 6175
Wire Bus Line
	10475 2925 10475 4900
Wire Bus Line
	7700 4900 7700 6175
Wire Bus Line
	7700 2925 7700 4900
Wire Bus Line
	5675 2925 5675 3875
Wire Bus Line
	8450 2925 8450 3875
Wire Bus Line
	8450 3875 8450 6175
Wire Bus Line
	5675 3875 5675 6175
Wire Bus Line
	3000 4900 7700 4900
$EndSCHEMATC
