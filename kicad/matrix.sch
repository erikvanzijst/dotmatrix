EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A3 16535 11693
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
P 10625 6575
F 0 "D1" H 11300 7662 60  0000 C CNN
F 1 "DISP_LED_MAT_8x8_COM_ANODE" H 11300 7556 60  0000 C CNN
F 2 "local:LED_8x8_3MM_38x38MM" H 10725 6525 60  0001 C CNN
F 3 "" H 10725 6525 60  0000 C CNN
	1    10625 6575
	1    0    0    -1  
$EndComp
$Comp
L akn:DISP_LED_MAT_8x8_COM_ANODE D3
U 1 1 5EDE1F36
P 13400 6575
F 0 "D3" H 14075 7662 60  0000 C CNN
F 1 "DISP_LED_MAT_8x8_COM_ANODE" H 14075 7556 60  0000 C CNN
F 2 "local:LED_8x8_3MM_38x38MM" H 13500 6525 60  0001 C CNN
F 3 "" H 13500 6525 60  0000 C CNN
	1    13400 6575
	1    0    0    -1  
$EndComp
$Comp
L akn:DISP_LED_MAT_8x8_COM_ANODE D2
U 1 1 5EE08D5B
P 10625 9125
F 0 "D2" H 11300 10212 60  0000 C CNN
F 1 "DISP_LED_MAT_8x8_COM_ANODE" H 11300 10106 60  0000 C CNN
F 2 "local:LED_8x8_3MM_38x38MM" H 10725 9075 60  0001 C CNN
F 3 "" H 10725 9075 60  0000 C CNN
	1    10625 9125
	1    0    0    -1  
$EndComp
$Comp
L akn:DISP_LED_MAT_8x8_COM_ANODE D4
U 1 1 5EE08D61
P 13400 9125
F 0 "D4" H 14075 10212 60  0000 C CNN
F 1 "DISP_LED_MAT_8x8_COM_ANODE" H 14075 10106 60  0000 C CNN
F 2 "local:LED_8x8_3MM_38x38MM" H 13500 9075 60  0001 C CNN
F 3 "" H 13500 9075 60  0000 C CNN
	1    13400 9125
	1    0    0    -1  
$EndComp
$Comp
L local:TLC59025 U1
U 1 1 5EE0C466
P 8250 8725
F 0 "U1" V 8750 7850 50  0000 R CNN
F 1 "TLC59025" V 8250 8925 50  0000 R CNN
F 2 "local:SSOP-24_3.9x8.7mm_P0.635mm_widepads" H 8250 8725 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tlc59025.pdf" H 8250 8725 50  0001 C CNN
	1    8250 8725
	0    -1   -1   0   
$EndComp
Entry Wire Line
	12200 5775 12300 5875
Entry Wire Line
	12200 5875 12300 5975
Entry Wire Line
	12200 5975 12300 6075
Entry Wire Line
	12200 6075 12300 6175
Entry Wire Line
	12200 6175 12300 6275
Entry Wire Line
	12200 6275 12300 6375
Entry Wire Line
	12200 6375 12300 6475
Entry Wire Line
	12200 6475 12300 6575
Entry Wire Line
	12200 8325 12300 8425
Entry Wire Line
	12200 8425 12300 8525
Entry Wire Line
	12200 8525 12300 8625
Entry Wire Line
	12200 8625 12300 8725
Entry Wire Line
	12200 8725 12300 8825
Entry Wire Line
	12200 8825 12300 8925
Entry Wire Line
	12200 8925 12300 9025
Entry Wire Line
	12200 9025 12300 9125
Connection ~ 12300 7850
Wire Wire Line
	11975 5775 12200 5775
Wire Wire Line
	12200 5875 11975 5875
Wire Wire Line
	11975 5975 12200 5975
Wire Wire Line
	12200 6075 11975 6075
Wire Wire Line
	11975 6175 12200 6175
Wire Wire Line
	12200 6275 11975 6275
Wire Wire Line
	11975 6375 12200 6375
Wire Wire Line
	12200 6475 11975 6475
Text Label 11975 5775 0    50   ~ 0
COL0
Text Label 11975 5875 0    50   ~ 0
COL1
Text Label 11975 5975 0    50   ~ 0
COL2
Text Label 11975 6075 0    50   ~ 0
COL3
Text Label 11975 6175 0    50   ~ 0
COL4
Text Label 11975 6275 0    50   ~ 0
COL5
Text Label 11975 6375 0    50   ~ 0
COL6
Text Label 11975 6475 0    50   ~ 0
COL7
Wire Wire Line
	11975 8325 12200 8325
Wire Wire Line
	12200 8425 11975 8425
Wire Wire Line
	11975 8525 12200 8525
Wire Wire Line
	12200 8625 11975 8625
Wire Wire Line
	11975 8725 12200 8725
Wire Wire Line
	12200 8825 11975 8825
Wire Wire Line
	11975 8925 12200 8925
Wire Wire Line
	12200 9025 11975 9025
Text Label 11975 8325 0    50   ~ 0
COL0
Text Label 11975 8425 0    50   ~ 0
COL1
Text Label 11975 8525 0    50   ~ 0
COL2
Text Label 11975 8625 0    50   ~ 0
COL3
Text Label 11975 8725 0    50   ~ 0
COL4
Text Label 11975 8825 0    50   ~ 0
COL5
Text Label 11975 8925 0    50   ~ 0
COL6
Text Label 11975 9025 0    50   ~ 0
COL7
Wire Wire Line
	7500 8175 7500 7950
Wire Wire Line
	7600 7950 7600 8175
Wire Wire Line
	7700 8175 7700 7950
Wire Wire Line
	7800 7950 7800 8175
Wire Wire Line
	7900 8175 7900 7950
Wire Wire Line
	8000 7950 8000 8175
Wire Wire Line
	8100 8175 8100 7950
Wire Wire Line
	8200 7950 8200 8175
Text Label 7500 8175 1    50   ~ 0
COL0
Text Label 7600 8175 1    50   ~ 0
COL1
Text Label 7700 8175 1    50   ~ 0
COL2
Text Label 7800 8175 1    50   ~ 0
COL3
Text Label 7900 8175 1    50   ~ 0
COL4
Text Label 8000 8175 1    50   ~ 0
COL5
Text Label 8100 8175 1    50   ~ 0
COL6
Text Label 8200 8175 1    50   ~ 0
COL7
Entry Wire Line
	8200 7950 8300 7850
Entry Wire Line
	8100 7950 8200 7850
Entry Wire Line
	8000 7950 8100 7850
Entry Wire Line
	7900 7950 8000 7850
Entry Wire Line
	7800 7950 7900 7850
Entry Wire Line
	7700 7950 7800 7850
Entry Wire Line
	7600 7950 7700 7850
Entry Wire Line
	7500 7950 7600 7850
Wire Wire Line
	14975 6475 14750 6475
Wire Wire Line
	14750 6375 14975 6375
Wire Wire Line
	14975 6275 14750 6275
Wire Wire Line
	14750 6175 14975 6175
Wire Wire Line
	14975 6075 14750 6075
Wire Wire Line
	14750 5975 14975 5975
Wire Wire Line
	14975 5875 14750 5875
Wire Wire Line
	14750 5775 14975 5775
Text Label 14975 6475 2    50   ~ 0
COL15
Text Label 14975 6375 2    50   ~ 0
COL14
Text Label 14975 6275 2    50   ~ 0
COL13
Text Label 14975 6175 2    50   ~ 0
COL12
Text Label 14975 6075 2    50   ~ 0
COL11
Text Label 14975 5975 2    50   ~ 0
COL10
Text Label 14925 5875 2    50   ~ 0
COL9
Text Label 14925 5775 2    50   ~ 0
COL8
Wire Wire Line
	14975 9025 14750 9025
Wire Wire Line
	14750 8925 14975 8925
Wire Wire Line
	14975 8825 14750 8825
Wire Wire Line
	14750 8725 14975 8725
Wire Wire Line
	14975 8625 14750 8625
Wire Wire Line
	14750 8525 14975 8525
Wire Wire Line
	14975 8425 14750 8425
Wire Wire Line
	14750 8325 14975 8325
Text Label 14975 9025 2    50   ~ 0
COL15
Text Label 14975 8925 2    50   ~ 0
COL14
Text Label 14975 8825 2    50   ~ 0
COL13
Text Label 14975 8725 2    50   ~ 0
COL12
Text Label 14975 8625 2    50   ~ 0
COL11
Text Label 14975 8525 2    50   ~ 0
COL10
Text Label 14925 8425 2    50   ~ 0
COL9
Text Label 14925 8325 2    50   ~ 0
COL8
Entry Wire Line
	14975 5775 15075 5875
Entry Wire Line
	14975 5875 15075 5975
Entry Wire Line
	14975 5975 15075 6075
Entry Wire Line
	14975 6075 15075 6175
Entry Wire Line
	14975 6175 15075 6275
Entry Wire Line
	14975 6275 15075 6375
Entry Wire Line
	14975 6375 15075 6475
Entry Wire Line
	14975 6475 15075 6575
Entry Wire Line
	14975 8325 15075 8425
Entry Wire Line
	14975 8425 15075 8525
Entry Wire Line
	14975 8525 15075 8625
Entry Wire Line
	14975 8625 15075 8725
Entry Wire Line
	14975 8725 15075 8825
Entry Wire Line
	14975 8825 15075 8925
Entry Wire Line
	14975 8925 15075 9025
Entry Wire Line
	14975 9025 15075 9125
Connection ~ 15075 7850
Wire Bus Line
	10325 7850 12300 7850
Wire Bus Line
	12300 7850 15075 7850
Wire Wire Line
	9000 7950 9000 8175
Wire Wire Line
	8900 8175 8900 7950
Wire Wire Line
	8800 7950 8800 8175
Wire Wire Line
	8700 8175 8700 7950
Wire Wire Line
	8600 7950 8600 8175
Wire Wire Line
	8500 8175 8500 7950
Wire Wire Line
	8400 7950 8400 8175
Wire Wire Line
	8300 8175 8300 7950
Text Label 9000 7950 3    50   ~ 0
COL15
Text Label 8800 7950 3    50   ~ 0
COL13
Text Label 8700 7950 3    50   ~ 0
COL12
Text Label 8600 7950 3    50   ~ 0
COL11
Text Label 8500 7950 3    50   ~ 0
COL10
Text Label 8400 7975 3    50   ~ 0
COL9
Text Label 8300 7975 3    50   ~ 0
COL8
Entry Wire Line
	9000 7950 9100 7850
Entry Wire Line
	8900 7950 9000 7850
Text Label 8900 7950 3    50   ~ 0
COL14
Entry Wire Line
	8800 7950 8900 7850
Entry Wire Line
	8700 7950 8800 7850
Entry Wire Line
	8600 7950 8700 7850
Entry Wire Line
	8500 7950 8600 7850
Entry Wire Line
	8400 7950 8500 7850
Entry Wire Line
	8300 7950 8400 7850
$Comp
L power:GND #PWR06
U 1 1 5EE2949F
P 9300 9550
F 0 "#PWR06" H 9300 9300 50  0001 C CNN
F 1 "GND" H 9305 9377 50  0000 C CNN
F 2 "" H 9300 9550 50  0001 C CNN
F 3 "" H 9300 9550 50  0001 C CNN
	1    9300 9550
	1    0    0    -1  
$EndComp
Wire Wire Line
	9200 8725 9300 8725
Wire Wire Line
	9300 8725 9300 9400
$Comp
L power:VDD #PWR01
U 1 1 5EE2B883
P 7025 8600
F 0 "#PWR01" H 7025 8450 50  0001 C CNN
F 1 "VDD" H 7042 8773 50  0000 C CNN
F 2 "" H 7025 8600 50  0001 C CNN
F 3 "" H 7025 8600 50  0001 C CNN
	1    7025 8600
	1    0    0    -1  
$EndComp
Wire Wire Line
	7025 8725 7250 8725
$Comp
L 74xx:74HC595 U3
U 1 1 5EE2D2DB
P 6675 6650
F 0 "U3" H 6850 7200 50  0000 R CNN
F 1 "74HC595" V 6675 6650 50  0000 R CNN
F 2 "local:SOIC-16_3.9x9.9mm_P1.27mm_widepads" H 6675 6650 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74hc595.pdf" H 6675 6650 50  0001 C CNN
	1    6675 6650
	1    0    0    -1  
$EndComp
Wire Wire Line
	7075 5600 7200 5600
Wire Wire Line
	7200 5600 7200 5925
Wire Wire Line
	7200 5925 6200 5925
Wire Wire Line
	6200 5925 6200 6250
Wire Wire Line
	6200 6250 6275 6250
$Comp
L power:GND #PWR05
U 1 1 5EE5EF5C
P 6675 7350
F 0 "#PWR05" H 6675 7100 50  0001 C CNN
F 1 "GND" V 6680 7222 50  0000 R CNN
F 2 "" H 6675 7350 50  0001 C CNN
F 3 "" H 6675 7350 50  0001 C CNN
	1    6675 7350
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR04
U 1 1 5EE5F5AD
P 6575 5825
F 0 "#PWR04" H 6575 5575 50  0001 C CNN
F 1 "GND" V 6580 5697 50  0000 R CNN
F 2 "" H 6575 5825 50  0001 C CNN
F 3 "" H 6575 5825 50  0001 C CNN
	1    6575 5825
	0    1    1    0   
$EndComp
Wire Wire Line
	6275 5300 5950 5300
Wire Wire Line
	5950 5300 5950 6850
Wire Wire Line
	5950 6850 6275 6850
Wire Wire Line
	6275 4900 5750 4900
Wire Wire Line
	5750 4900 5750 6450
Wire Wire Line
	5750 6450 6275 6450
$Comp
L power:VDD #PWR03
U 1 1 5EE68524
P 6575 6025
F 0 "#PWR03" H 6575 5875 50  0001 C CNN
F 1 "VDD" V 6593 6152 50  0000 L CNN
F 2 "" H 6575 6025 50  0001 C CNN
F 3 "" H 6575 6025 50  0001 C CNN
	1    6575 6025
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6575 6025 6675 6025
Wire Wire Line
	6675 6025 6675 6050
$Comp
L power:VDD #PWR02
U 1 1 5EE6B22D
P 6575 4475
F 0 "#PWR02" H 6575 4325 50  0001 C CNN
F 1 "VDD" V 6593 4602 50  0000 L CNN
F 2 "" H 6575 4475 50  0001 C CNN
F 3 "" H 6575 4475 50  0001 C CNN
	1    6575 4475
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6575 4475 6675 4475
Wire Wire Line
	6675 4475 6675 4500
Text Label 5950 10175 1    50   ~ 0
~OE
NoConn ~ 7075 7150
Wire Wire Line
	10375 5775 10625 5775
Wire Wire Line
	10375 5875 10625 5875
Wire Wire Line
	10375 5975 10625 5975
Wire Wire Line
	10375 6075 10625 6075
Wire Wire Line
	10375 6175 10625 6175
Wire Wire Line
	10375 6275 10625 6275
Wire Wire Line
	10375 6375 10625 6375
Wire Wire Line
	10375 6475 10625 6475
Text Label 10375 5775 0    50   ~ 0
ROW1
Text Label 10375 5875 0    50   ~ 0
ROW2
Text Label 10375 5975 0    50   ~ 0
ROW3
Text Label 10375 6075 0    50   ~ 0
ROW4
Text Label 10375 6175 0    50   ~ 0
ROW5
Text Label 10375 6275 0    50   ~ 0
ROW6
Text Label 10375 6375 0    50   ~ 0
ROW7
Text Label 10375 6475 0    50   ~ 0
ROW8
Wire Wire Line
	10375 8325 10625 8325
Wire Wire Line
	10375 8425 10625 8425
Wire Wire Line
	10375 8525 10625 8525
Wire Wire Line
	10375 8625 10625 8625
Wire Wire Line
	10375 8725 10625 8725
Wire Wire Line
	10375 8825 10625 8825
Wire Wire Line
	10375 8925 10625 8925
Wire Wire Line
	10375 9025 10625 9025
Text Label 10375 8325 0    50   ~ 0
ROW9
Text Label 10375 8425 0    50   ~ 0
ROW10
Text Label 10375 8525 0    50   ~ 0
ROW11
Text Label 10375 8625 0    50   ~ 0
ROW12
Text Label 10375 8725 0    50   ~ 0
ROW13
Text Label 10375 8825 0    50   ~ 0
ROW14
Text Label 10375 8925 0    50   ~ 0
ROW15
Text Label 10375 9025 0    50   ~ 0
ROW16
Wire Wire Line
	13150 8325 13400 8325
Wire Wire Line
	13150 8425 13400 8425
Wire Wire Line
	13150 8525 13400 8525
Wire Wire Line
	13150 8625 13400 8625
Wire Wire Line
	13150 8725 13400 8725
Wire Wire Line
	13150 8825 13400 8825
Wire Wire Line
	13150 8925 13400 8925
Wire Wire Line
	13150 9025 13400 9025
Text Label 13150 8325 0    50   ~ 0
ROW9
Text Label 13150 8425 0    50   ~ 0
ROW10
Text Label 13150 8525 0    50   ~ 0
ROW11
Text Label 13150 8625 0    50   ~ 0
ROW12
Text Label 13150 8725 0    50   ~ 0
ROW13
Text Label 13150 8825 0    50   ~ 0
ROW14
Text Label 13150 8925 0    50   ~ 0
ROW15
Text Label 13150 9025 0    50   ~ 0
ROW16
Wire Wire Line
	13150 5775 13400 5775
Wire Wire Line
	13150 5875 13400 5875
Wire Wire Line
	13150 5975 13400 5975
Wire Wire Line
	13150 6075 13400 6075
Wire Wire Line
	13150 6175 13400 6175
Wire Wire Line
	13150 6275 13400 6275
Wire Wire Line
	13150 6375 13400 6375
Wire Wire Line
	13150 6475 13400 6475
Text Label 13150 5775 0    50   ~ 0
ROW1
Text Label 13150 5875 0    50   ~ 0
ROW2
Text Label 13150 5975 0    50   ~ 0
ROW3
Text Label 13150 6075 0    50   ~ 0
ROW4
Text Label 13150 6175 0    50   ~ 0
ROW5
Text Label 13150 6275 0    50   ~ 0
ROW6
Text Label 13150 6375 0    50   ~ 0
ROW7
Text Label 13150 6475 0    50   ~ 0
ROW8
Entry Wire Line
	10375 5775 10275 5875
Entry Wire Line
	10375 5875 10275 5975
Entry Wire Line
	10375 5975 10275 6075
Entry Wire Line
	10375 6075 10275 6175
Entry Wire Line
	10375 6175 10275 6275
Entry Wire Line
	10375 6275 10275 6375
Entry Wire Line
	10375 6375 10275 6475
Entry Wire Line
	10375 6475 10275 6575
Entry Wire Line
	10375 8325 10275 8425
Entry Wire Line
	10375 8425 10275 8525
Entry Wire Line
	10375 8525 10275 8625
Entry Wire Line
	10375 8625 10275 8725
Entry Wire Line
	10375 8725 10275 8825
Entry Wire Line
	10375 8825 10275 8925
Entry Wire Line
	10375 8925 10275 9025
Entry Wire Line
	10375 9025 10275 9125
Wire Bus Line
	13100 7850 15075 7850
Entry Wire Line
	13150 5775 13050 5875
Entry Wire Line
	13150 5875 13050 5975
Entry Wire Line
	13150 5975 13050 6075
Entry Wire Line
	13150 6075 13050 6175
Entry Wire Line
	13150 6175 13050 6275
Entry Wire Line
	13150 6275 13050 6375
Entry Wire Line
	13150 6375 13050 6475
Entry Wire Line
	13150 6475 13050 6575
Entry Wire Line
	13150 8325 13050 8425
Entry Wire Line
	13150 8425 13050 8525
Entry Wire Line
	13150 8525 13050 8625
Entry Wire Line
	13150 8625 13050 8725
Entry Wire Line
	13150 8725 13050 8825
Entry Wire Line
	13150 8825 13050 8925
Entry Wire Line
	13150 8925 13050 9025
Entry Wire Line
	13150 9025 13050 9125
Wire Bus Line
	13050 6825 10275 6825
Connection ~ 13050 6825
Connection ~ 10275 6825
Wire Bus Line
	11325 6825 10275 6825
$Comp
L Device:R R1
U 1 1 5EF48347
P 8900 9400
F 0 "R1" V 8693 9400 50  0000 C CNN
F 1 "2.2K" V 8784 9400 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" V 8830 9400 50  0001 C CNN
F 3 "~" H 8900 9400 50  0001 C CNN
	1    8900 9400
	0    1    1    0   
$EndComp
Wire Wire Line
	9050 9400 9300 9400
Connection ~ 9300 9400
Wire Wire Line
	9300 9400 9300 9550
Wire Wire Line
	7900 9225 7900 9400
Wire Wire Line
	7900 9400 8750 9400
$Comp
L Device:C C1
U 1 1 5EF743CF
P 7025 8875
F 0 "C1" H 7140 8921 50  0000 L CNN
F 1 "100nF" H 7140 8830 50  0000 L CNN
F 2 "local:C_0805_2012Metric_Pad1.15x1.40mm_widepads" H 7063 8725 50  0001 C CNN
F 3 "~" H 7025 8875 50  0001 C CNN
	1    7025 8875
	1    0    0    -1  
$EndComp
Connection ~ 7025 8725
Wire Wire Line
	7025 8600 7025 8725
Wire Wire Line
	7025 9125 7025 9025
$Comp
L Device:C C2
U 1 1 5EF8250E
P 6950 6025
F 0 "C2" V 6698 6025 50  0000 C CNN
F 1 "100nF" V 6789 6025 50  0000 C CNN
F 2 "local:C_0805_2012Metric_Pad1.15x1.40mm_widepads" H 6988 5875 50  0001 C CNN
F 3 "~" H 6950 6025 50  0001 C CNN
	1    6950 6025
	0    1    1    0   
$EndComp
Wire Wire Line
	6675 6025 6800 6025
Connection ~ 6675 6025
Wire Wire Line
	6575 5825 6675 5825
Wire Wire Line
	7100 5825 7100 6025
Wire Wire Line
	6675 5800 6675 5825
Connection ~ 6675 5825
Wire Wire Line
	6675 5825 7100 5825
$Comp
L Device:C C3
U 1 1 5EFA155D
P 6825 4325
F 0 "C3" V 6573 4325 50  0000 C CNN
F 1 "100nF" V 6664 4325 50  0000 C CNN
F 2 "local:C_0805_2012Metric_Pad1.15x1.40mm_widepads" H 6863 4175 50  0001 C CNN
F 3 "~" H 6825 4325 50  0001 C CNN
	1    6825 4325
	-1   0    0    1   
$EndComp
Wire Wire Line
	6675 4475 6825 4475
Connection ~ 6675 4475
Entry Wire Line
	10175 4625 10275 4725
Entry Wire Line
	10175 3425 10275 3525
Entry Wire Line
	10175 3825 10275 3925
Entry Wire Line
	10175 1425 10275 1525
Entry Wire Line
	10175 5425 10275 5525
Entry Wire Line
	10175 6225 10275 6325
Entry Wire Line
	10175 5025 10275 5125
Entry Wire Line
	10175 4225 10275 4325
Entry Wire Line
	10175 2225 10275 2325
Text Label 9625 4625 0    50   ~ 0
ROW9
Entry Wire Line
	10175 2625 10275 2725
Text Label 9625 5025 0    50   ~ 0
ROW10
Entry Wire Line
	10175 5825 10275 5925
Entry Wire Line
	10175 3025 10275 3125
Text Label 9625 5825 0    50   ~ 0
ROW12
Entry Wire Line
	10175 7425 10275 7525
Text Label 9625 6225 0    50   ~ 0
ROW13
Entry Wire Line
	10175 7025 10275 7125
Text Label 9625 6625 0    50   ~ 0
ROW14
Entry Wire Line
	10175 6625 10275 6725
Text Label 9625 7025 0    50   ~ 0
ROW15
Entry Wire Line
	10175 1825 10275 1925
Text Label 9625 7425 0    50   ~ 0
ROW16
$Comp
L power:GND #PWR019
U 1 1 5F217EB1
P 7025 9125
F 0 "#PWR019" H 7025 8875 50  0001 C CNN
F 1 "GND" H 7030 8952 50  0000 C CNN
F 2 "" H 7025 9125 50  0001 C CNN
F 3 "" H 7025 9125 50  0001 C CNN
	1    7025 9125
	1    0    0    -1  
$EndComp
NoConn ~ 8000 9225
$Comp
L Connector_Generic:Conn_01x08 J1
U 1 1 5EE0A62F
P 5950 10425
F 0 "J1" V 5822 10805 50  0000 L CNN
F 1 "Conn_01x08" V 5913 10805 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x08_P2.54mm_Horizontal" H 5950 10425 50  0001 C CNN
F 3 "~" H 5950 10425 50  0001 C CNN
	1    5950 10425
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR017
U 1 1 5EE44BE5
P 5275 9925
F 0 "#PWR017" H 5275 9675 50  0001 C CNN
F 1 "GND" H 5280 9752 50  0000 C CNN
F 2 "" H 5275 9925 50  0001 C CNN
F 3 "" H 5275 9925 50  0001 C CNN
	1    5275 9925
	0    1    1    0   
$EndComp
$Comp
L power:VDD #PWR016
U 1 1 5EE456DF
P 5275 9500
F 0 "#PWR016" H 5275 9350 50  0001 C CNN
F 1 "VDD" H 5292 9673 50  0000 C CNN
F 2 "" H 5275 9500 50  0001 C CNN
F 3 "" H 5275 9500 50  0001 C CNN
	1    5275 9500
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5275 9500 5375 9500
Wire Wire Line
	7600 9225 7600 9425
Wire Wire Line
	7700 9225 7700 9525
Wire Wire Line
	7800 9225 7800 9625
Wire Wire Line
	8100 9725 5950 9725
Wire Wire Line
	8100 9225 8100 9725
Wire Wire Line
	5950 6850 5950 9725
Connection ~ 5950 6850
$Comp
L power:VDD #PWR018
U 1 1 5EF45125
P 6125 5000
F 0 "#PWR018" H 6125 4850 50  0001 C CNN
F 1 "VDD" V 6143 5127 50  0000 L CNN
F 2 "" H 6125 5000 50  0001 C CNN
F 3 "" H 6125 5000 50  0001 C CNN
	1    6125 5000
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6125 6550 6125 5000
Wire Wire Line
	6125 5000 6275 5000
Wire Wire Line
	6125 6550 6275 6550
Connection ~ 6125 5000
Text Label 6050 10175 1    50   ~ 0
COLSDI
Text Label 6150 10175 1    50   ~ 0
COLCLK
Text Label 6250 10175 1    50   ~ 0
LE
Wire Wire Line
	6050 6750 6275 6750
Wire Wire Line
	6050 6750 6050 5200
Wire Wire Line
	6050 5200 6275 5200
Text Label 5850 10175 1    50   ~ 0
ROWSDI
Connection ~ 5750 6450
Text Label 5750 10175 1    50   ~ 0
ROWCLK
$Comp
L local:P-FET U4
U 1 1 5F09B5FB
P 9250 1425
F 0 "U4" H 9000 1625 50  0000 C CNN
F 1 "P-FET" V 9250 1425 50  0000 C CNN
F 2 "local:SOIC-8_3.9x4.9mm_P1.27mm_widepads" H 9450 1825 50  0001 C CNN
F 3 "https://www.diodes.com/assets/Datasheets/DMP3085LSD.pdf" H 9450 1825 50  0001 C CNN
	1    9250 1425
	1    0    0    -1  
$EndComp
Text Label 9625 5425 0    50   ~ 0
ROW11
Text Label 9625 4225 0    50   ~ 0
ROW8
Text Label 9625 3825 0    50   ~ 0
ROW7
Text Label 9625 3425 0    50   ~ 0
ROW6
Text Label 9625 3025 0    50   ~ 0
ROW5
Text Label 9625 2225 0    50   ~ 0
ROW3
Text Label 9625 2625 0    50   ~ 0
ROW4
Text Label 9625 1825 0    50   ~ 0
ROW2
Text Label 9625 1425 0    50   ~ 0
ROW1
$Comp
L local:P-FET U4
U 2 1 5F127DC7
P 9250 1825
F 0 "U4" H 9000 2025 50  0000 C CNN
F 1 "P-FET" V 9250 1825 50  0000 C CNN
F 2 "local:SOIC-8_3.9x4.9mm_P1.27mm_widepads" H 9450 2225 50  0001 C CNN
F 3 "https://www.diodes.com/assets/Datasheets/DMP3085LSD.pdf" H 9450 2225 50  0001 C CNN
	2    9250 1825
	1    0    0    -1  
$EndComp
$Comp
L local:P-FET U5
U 1 1 5F137EE0
P 9250 2225
F 0 "U5" H 9000 2425 50  0000 C CNN
F 1 "P-FET" V 9250 2225 50  0000 C CNN
F 2 "local:SOIC-8_3.9x4.9mm_P1.27mm_widepads" H 9450 2625 50  0001 C CNN
F 3 "https://www.diodes.com/assets/Datasheets/DMP3085LSD.pdf" H 9450 2625 50  0001 C CNN
	1    9250 2225
	1    0    0    -1  
$EndComp
$Comp
L local:P-FET U5
U 2 1 5F137EEA
P 9250 2625
F 0 "U5" H 9000 2825 50  0000 C CNN
F 1 "P-FET" V 9250 2625 50  0000 C CNN
F 2 "local:SOIC-8_3.9x4.9mm_P1.27mm_widepads" H 9450 3025 50  0001 C CNN
F 3 "https://www.diodes.com/assets/Datasheets/DMP3085LSD.pdf" H 9450 3025 50  0001 C CNN
	2    9250 2625
	1    0    0    -1  
$EndComp
$Comp
L local:P-FET U6
U 1 1 5F15A3EE
P 9250 3025
F 0 "U6" H 9000 3225 50  0000 C CNN
F 1 "P-FET" V 9250 3025 50  0000 C CNN
F 2 "local:SOIC-8_3.9x4.9mm_P1.27mm_widepads" H 9450 3425 50  0001 C CNN
F 3 "https://www.diodes.com/assets/Datasheets/DMP3085LSD.pdf" H 9450 3425 50  0001 C CNN
	1    9250 3025
	1    0    0    -1  
$EndComp
$Comp
L local:P-FET U6
U 2 1 5F15A3F8
P 9250 3425
F 0 "U6" H 9000 3625 50  0000 C CNN
F 1 "P-FET" V 9250 3425 50  0000 C CNN
F 2 "local:SOIC-8_3.9x4.9mm_P1.27mm_widepads" H 9450 3825 50  0001 C CNN
F 3 "https://www.diodes.com/assets/Datasheets/DMP3085LSD.pdf" H 9450 3825 50  0001 C CNN
	2    9250 3425
	1    0    0    -1  
$EndComp
$Comp
L local:P-FET U7
U 1 1 5F15A402
P 9250 3825
F 0 "U7" H 9000 4025 50  0000 C CNN
F 1 "P-FET" V 9250 3825 50  0000 C CNN
F 2 "local:SOIC-8_3.9x4.9mm_P1.27mm_widepads" H 9450 4225 50  0001 C CNN
F 3 "https://www.diodes.com/assets/Datasheets/DMP3085LSD.pdf" H 9450 4225 50  0001 C CNN
	1    9250 3825
	1    0    0    -1  
$EndComp
$Comp
L local:P-FET U7
U 2 1 5F15A40C
P 9250 4225
F 0 "U7" H 9000 4425 50  0000 C CNN
F 1 "P-FET" V 9250 4225 50  0000 C CNN
F 2 "local:SOIC-8_3.9x4.9mm_P1.27mm_widepads" H 9450 4625 50  0001 C CNN
F 3 "https://www.diodes.com/assets/Datasheets/DMP3085LSD.pdf" H 9450 4625 50  0001 C CNN
	2    9250 4225
	1    0    0    -1  
$EndComp
$Comp
L local:P-FET U8
U 1 1 5F17DC71
P 9250 4625
F 0 "U8" H 9000 4825 50  0000 C CNN
F 1 "P-FET" V 9250 4625 50  0000 C CNN
F 2 "local:SOIC-8_3.9x4.9mm_P1.27mm_widepads" H 9450 5025 50  0001 C CNN
F 3 "https://www.diodes.com/assets/Datasheets/DMP3085LSD.pdf" H 9450 5025 50  0001 C CNN
	1    9250 4625
	1    0    0    -1  
$EndComp
$Comp
L local:P-FET U8
U 2 1 5F17DC7B
P 9250 5025
F 0 "U8" H 9000 5225 50  0000 C CNN
F 1 "P-FET" V 9250 5025 50  0000 C CNN
F 2 "local:SOIC-8_3.9x4.9mm_P1.27mm_widepads" H 9450 5425 50  0001 C CNN
F 3 "https://www.diodes.com/assets/Datasheets/DMP3085LSD.pdf" H 9450 5425 50  0001 C CNN
	2    9250 5025
	1    0    0    -1  
$EndComp
$Comp
L local:P-FET U9
U 1 1 5F17DC85
P 9250 5425
F 0 "U9" H 9000 5625 50  0000 C CNN
F 1 "P-FET" V 9250 5425 50  0000 C CNN
F 2 "local:SOIC-8_3.9x4.9mm_P1.27mm_widepads" H 9450 5825 50  0001 C CNN
F 3 "https://www.diodes.com/assets/Datasheets/DMP3085LSD.pdf" H 9450 5825 50  0001 C CNN
	1    9250 5425
	1    0    0    -1  
$EndComp
$Comp
L local:P-FET U9
U 2 1 5F17DC8F
P 9250 5825
F 0 "U9" H 9000 6025 50  0000 C CNN
F 1 "P-FET" V 9250 5825 50  0000 C CNN
F 2 "local:SOIC-8_3.9x4.9mm_P1.27mm_widepads" H 9450 6225 50  0001 C CNN
F 3 "https://www.diodes.com/assets/Datasheets/DMP3085LSD.pdf" H 9450 6225 50  0001 C CNN
	2    9250 5825
	1    0    0    -1  
$EndComp
$Comp
L local:P-FET U10
U 1 1 5F17DC99
P 9250 6225
F 0 "U10" H 9000 6425 50  0000 C CNN
F 1 "P-FET" V 9250 6225 50  0000 C CNN
F 2 "local:SOIC-8_3.9x4.9mm_P1.27mm_widepads" H 9450 6625 50  0001 C CNN
F 3 "https://www.diodes.com/assets/Datasheets/DMP3085LSD.pdf" H 9450 6625 50  0001 C CNN
	1    9250 6225
	1    0    0    -1  
$EndComp
$Comp
L local:P-FET U10
U 2 1 5F17DCA3
P 9250 6625
F 0 "U10" H 9000 6825 50  0000 C CNN
F 1 "P-FET" V 9250 6625 50  0000 C CNN
F 2 "local:SOIC-8_3.9x4.9mm_P1.27mm_widepads" H 9450 7025 50  0001 C CNN
F 3 "https://www.diodes.com/assets/Datasheets/DMP3085LSD.pdf" H 9450 7025 50  0001 C CNN
	2    9250 6625
	1    0    0    -1  
$EndComp
$Comp
L local:P-FET U11
U 1 1 5F17DCAD
P 9250 7025
F 0 "U11" H 9000 7225 50  0000 C CNN
F 1 "P-FET" V 9250 7025 50  0000 C CNN
F 2 "local:SOIC-8_3.9x4.9mm_P1.27mm_widepads" H 9450 7425 50  0001 C CNN
F 3 "https://www.diodes.com/assets/Datasheets/DMP3085LSD.pdf" H 9450 7425 50  0001 C CNN
	1    9250 7025
	1    0    0    -1  
$EndComp
$Comp
L local:P-FET U11
U 2 1 5F17DCB7
P 9250 7425
F 0 "U11" H 9000 7625 50  0000 C CNN
F 1 "P-FET" V 9250 7425 50  0000 C CNN
F 2 "local:SOIC-8_3.9x4.9mm_P1.27mm_widepads" H 9450 7825 50  0001 C CNN
F 3 "https://www.diodes.com/assets/Datasheets/DMP3085LSD.pdf" H 9450 7825 50  0001 C CNN
	2    9250 7425
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC595 U2
U 1 1 5EE2FD5B
P 6675 5100
F 0 "U2" H 6850 5650 50  0000 R CNN
F 1 "74HC595" V 6675 5125 50  0000 R CNN
F 2 "local:SOIC-16_3.9x9.9mm_P1.27mm_widepads" H 6675 5100 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74hc595.pdf" H 6675 5100 50  0001 C CNN
	1    6675 5100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR07
U 1 1 5F1E6F61
P 6825 4175
F 0 "#PWR07" H 6825 3925 50  0001 C CNN
F 1 "GND" V 6830 4047 50  0000 R CNN
F 2 "" H 6825 4175 50  0001 C CNN
F 3 "" H 6825 4175 50  0001 C CNN
	1    6825 4175
	-1   0    0    1   
$EndComp
Wire Wire Line
	8950 1375 8900 1375
Wire Wire Line
	8900 7375 8950 7375
Wire Wire Line
	8950 6975 8900 6975
Connection ~ 8900 6975
Wire Wire Line
	8900 6975 8900 7375
Wire Wire Line
	8950 6575 8900 6575
Connection ~ 8900 6575
Wire Wire Line
	8900 6575 8900 6975
Wire Wire Line
	8950 6175 8900 6175
Connection ~ 8900 6175
Wire Wire Line
	8900 6175 8900 6575
Wire Wire Line
	8950 5775 8900 5775
Connection ~ 8900 5775
Wire Wire Line
	8900 5775 8900 6175
Wire Wire Line
	8950 5375 8900 5375
Connection ~ 8900 5375
Wire Wire Line
	8900 5375 8900 5775
Wire Wire Line
	8950 4975 8900 4975
Connection ~ 8900 4975
Wire Wire Line
	8900 4975 8900 5375
Wire Wire Line
	8950 4575 8900 4575
Wire Wire Line
	8900 1375 8900 1775
Connection ~ 8900 4575
Wire Wire Line
	8900 4575 8900 4975
Wire Wire Line
	8950 4175 8900 4175
Connection ~ 8900 4175
Wire Wire Line
	8900 4175 8900 4575
Wire Wire Line
	8950 3775 8900 3775
Connection ~ 8900 3775
Wire Wire Line
	8900 3775 8900 4175
Wire Wire Line
	8950 3375 8900 3375
Connection ~ 8900 3375
Wire Wire Line
	8900 3375 8900 3775
Wire Wire Line
	8950 2975 8900 2975
Connection ~ 8900 2975
Wire Wire Line
	8900 2975 8900 3375
Wire Wire Line
	8950 2575 8900 2575
Connection ~ 8900 2575
Wire Wire Line
	8900 2575 8900 2975
Wire Wire Line
	8950 2175 8900 2175
Connection ~ 8900 2175
Wire Wire Line
	8900 2175 8900 2575
Wire Wire Line
	8950 1775 8900 1775
Connection ~ 8900 1775
Wire Wire Line
	8900 1775 8900 2175
Wire Wire Line
	9550 1375 9550 1425
Wire Wire Line
	9550 1775 9550 1825
Wire Wire Line
	9550 2175 9550 2225
Wire Wire Line
	9550 2575 9550 2625
Wire Wire Line
	9550 2975 9550 3025
Wire Wire Line
	9550 3375 9550 3425
Wire Wire Line
	9550 3775 9550 3825
Wire Wire Line
	9550 4175 9550 4225
Wire Wire Line
	9550 4575 9550 4625
Wire Wire Line
	9550 4975 9550 5025
Wire Wire Line
	9550 5375 9550 5425
Wire Wire Line
	9550 5775 9550 5825
Wire Wire Line
	9550 6175 9550 6225
Wire Wire Line
	9550 6575 9550 6625
Wire Wire Line
	9550 6975 9550 7025
Wire Wire Line
	9550 7375 9550 7425
Wire Wire Line
	10175 1425 9550 1425
Connection ~ 9550 1425
Wire Wire Line
	9550 1425 9550 1475
Wire Wire Line
	9550 1825 10175 1825
Connection ~ 9550 1825
Wire Wire Line
	9550 1825 9550 1875
Wire Wire Line
	9550 2225 10175 2225
Connection ~ 9550 2225
Wire Wire Line
	9550 2225 9550 2275
Wire Wire Line
	9550 2625 10175 2625
Connection ~ 9550 2625
Wire Wire Line
	9550 2625 9550 2675
Wire Wire Line
	9550 3025 10175 3025
Connection ~ 9550 3025
Wire Wire Line
	9550 3025 9550 3075
Wire Wire Line
	9550 3425 10175 3425
Connection ~ 9550 3425
Wire Wire Line
	9550 3425 9550 3475
Wire Wire Line
	9550 3825 10175 3825
Connection ~ 9550 3825
Wire Wire Line
	9550 3825 9550 3875
Wire Wire Line
	9550 4225 10175 4225
Connection ~ 9550 4225
Wire Wire Line
	9550 4225 9550 4275
Wire Wire Line
	9550 4625 10175 4625
Connection ~ 9550 4625
Wire Wire Line
	9550 4625 9550 4675
Wire Wire Line
	9550 5025 10175 5025
Connection ~ 9550 5025
Wire Wire Line
	9550 5025 9550 5075
Wire Wire Line
	9550 5425 10175 5425
Connection ~ 9550 5425
Wire Wire Line
	9550 5425 9550 5475
Wire Wire Line
	9550 5825 10175 5825
Connection ~ 9550 5825
Wire Wire Line
	9550 5825 9550 5875
Wire Wire Line
	9550 6225 10175 6225
Connection ~ 9550 6225
Wire Wire Line
	9550 6225 9550 6275
Wire Wire Line
	9550 6625 10175 6625
Connection ~ 9550 6625
Wire Wire Line
	9550 6625 9550 6675
Wire Wire Line
	9550 7025 10175 7025
Connection ~ 9550 7025
Wire Wire Line
	9550 7025 9550 7075
Wire Wire Line
	9550 7425 10175 7425
Connection ~ 9550 7425
Wire Wire Line
	9550 7425 9550 7475
Wire Wire Line
	7075 6950 8700 6950
Wire Wire Line
	8700 6950 8700 7475
Wire Wire Line
	8700 7475 8950 7475
Wire Wire Line
	7075 6850 8800 6850
Wire Wire Line
	8800 6850 8800 7075
Wire Wire Line
	8800 7075 8950 7075
Wire Wire Line
	8950 4675 8200 4675
Wire Wire Line
	8200 4675 8200 6250
Wire Wire Line
	8200 6250 7075 6250
Wire Wire Line
	8950 5075 8325 5075
Wire Wire Line
	8325 5075 8325 6350
Wire Wire Line
	8325 6350 7075 6350
Wire Wire Line
	7075 6450 8450 6450
Wire Wire Line
	8450 6450 8450 5475
Wire Wire Line
	8450 5475 8950 5475
Wire Wire Line
	8950 5875 8575 5875
Wire Wire Line
	8575 5875 8575 6550
Wire Wire Line
	8575 6550 7075 6550
Wire Wire Line
	7075 6650 8700 6650
Wire Wire Line
	8700 6650 8700 6275
Wire Wire Line
	8700 6275 8950 6275
Wire Wire Line
	8950 6675 8800 6675
Wire Wire Line
	8800 6675 8800 6750
Wire Wire Line
	8800 6750 7075 6750
Wire Wire Line
	7075 5400 8075 5400
Wire Wire Line
	8075 5400 8075 4275
Wire Wire Line
	8075 4275 8950 4275
Wire Wire Line
	7075 5300 7950 5300
Wire Wire Line
	7950 5300 7950 3875
Wire Wire Line
	7950 3875 8950 3875
Wire Wire Line
	7075 5200 7825 5200
Wire Wire Line
	7825 5200 7825 3475
Wire Wire Line
	7825 3475 8950 3475
Wire Wire Line
	7075 5100 7700 5100
Wire Wire Line
	7700 5100 7700 3075
Wire Wire Line
	7700 3075 8950 3075
Wire Wire Line
	7075 5000 7575 5000
Wire Wire Line
	7575 5000 7575 2675
Wire Wire Line
	7575 2675 8950 2675
Wire Wire Line
	7075 4900 7450 4900
Wire Wire Line
	7450 4900 7450 2275
Wire Wire Line
	7450 2275 8950 2275
Wire Wire Line
	7075 4800 7325 4800
Wire Wire Line
	7325 4800 7325 1875
Wire Wire Line
	7325 1875 8950 1875
Wire Wire Line
	7075 4700 7200 4700
Wire Wire Line
	7200 4700 7200 1475
Wire Wire Line
	7200 1475 8950 1475
$Comp
L power:VDD #PWR0101
U 1 1 5F638642
P 8900 1375
F 0 "#PWR0101" H 8900 1225 50  0001 C CNN
F 1 "VDD" V 8918 1502 50  0000 L CNN
F 2 "" H 8900 1375 50  0001 C CNN
F 3 "" H 8900 1375 50  0001 C CNN
	1    8900 1375
	0    -1   -1   0   
$EndComp
Connection ~ 8900 1375
Wire Wire Line
	5750 6450 5750 10225
Wire Wire Line
	5850 4700 5850 10225
Wire Wire Line
	5850 4700 6275 4700
Wire Wire Line
	5950 9725 5950 10225
Connection ~ 5950 9725
Wire Wire Line
	6050 9425 6050 10225
Wire Wire Line
	6050 9425 7600 9425
Wire Wire Line
	6150 9525 6150 10225
Wire Wire Line
	6150 9525 7700 9525
Wire Wire Line
	7800 9625 6250 9625
Wire Wire Line
	6250 9625 6250 10225
Wire Wire Line
	6050 6750 6050 9325
Wire Wire Line
	6050 9325 6250 9325
Wire Wire Line
	6250 9325 6250 9625
Connection ~ 6050 6750
Connection ~ 6250 9625
Wire Wire Line
	5550 9925 5550 10225
$Comp
L power:PWR_FLAG #FLG0101
U 1 1 5F939576
P 5375 9500
F 0 "#FLG0101" H 5375 9575 50  0001 C CNN
F 1 "PWR_FLAG" H 5375 9673 50  0000 C CNN
F 2 "" H 5375 9500 50  0001 C CNN
F 3 "~" H 5375 9500 50  0001 C CNN
	1    5375 9500
	1    0    0    -1  
$EndComp
Wire Wire Line
	5650 10225 5650 9500
Wire Wire Line
	5650 9500 5375 9500
Connection ~ 5375 9500
Wire Wire Line
	5550 9925 5375 9925
$Comp
L power:PWR_FLAG #FLG0102
U 1 1 5F996FD8
P 5375 9925
F 0 "#FLG0102" H 5375 10000 50  0001 C CNN
F 1 "PWR_FLAG" H 5375 10098 50  0000 C CNN
F 2 "" H 5375 9925 50  0001 C CNN
F 3 "~" H 5375 9925 50  0001 C CNN
	1    5375 9925
	1    0    0    -1  
$EndComp
Connection ~ 5375 9925
Wire Wire Line
	5375 9925 5275 9925
Wire Bus Line
	10275 6825 10275 9125
Wire Bus Line
	13050 6825 13050 9125
Wire Bus Line
	13050 5875 13050 6825
Wire Bus Line
	15075 7850 15075 9125
Wire Bus Line
	15075 5875 15075 7850
Wire Bus Line
	12300 7850 12300 9125
Wire Bus Line
	12300 5875 12300 7850
Wire Bus Line
	7600 7850 12300 7850
Wire Bus Line
	10275 1525 10275 6825
$EndSCHEMATC
