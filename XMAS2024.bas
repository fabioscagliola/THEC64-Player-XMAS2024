1000 PRINT CHR$(147)
1010 PRINT "xmas 2024"
1020 PRINT
1030 PRINT "laura and fabio wish you"
1040 PRINT "happy winter holidays"
1050 PRINT
1060 PRINT "have yourself a merry little christmas"
1070 PRINT "by hugh martin and ralph blane"

1080 REM **** PLAYER ****

1090 S = 54272
1100 FOR I = 0 TO 24 : POKE S + I, 0 : NEXT
1110 POKE S + 24, 15
1120 WF = 16
1130 A = 2 ^ (1 / 12)
1140 FOR I = 0 TO 2
1150 POKE S + 5 + 7 * I,  3 * 16 + 7
1160 POKE S + 6 + 7 * I, 10 * 16 + 9
1170 NEXT

1180 DIM PLAY(2)
1190 DIM FH(2)
1200 DIM FL(2)

1210 READ D, A$, B$, C$
1220 IF D = 0 THEN GOSUB 1630 : END
1230 V = 0
1240 X$ = A$
1250 GOSUB 1340
1260 V = 1
1270 X$ = B$
1280 GOSUB 1340
1290 V = 2
1300 X$ = C$
1310 GOSUB 1340
1320 GOSUB 1510
1330 GOTO 1210

1340 REM Init
1350 N$ = MID$(X$, 1, 1)
1360 S$ = MID$(X$, 2, 1)
1370 O = VAL(MID$(X$, 3, 1))
1380 N = 2 * (ASC(N$) - 65) - 1
1390 PLAY(V) = 1
1400 IF N$ = " " THEN RETURN
1410 IF N$ = "p" THEN FL(V) = 0 : FH(V) = 0 : PLAY(V) = 0 : RETURN
1420 IF N$ = "f" THEN N = N - 1 : GOTO 1460
1430 IF N$ = "g" THEN N = N - 1 : GOTO 1460
1440 IF N$ = "a" THEN N = 12 : GOTO 1460
1450 IF N$ = "b" THEN N = 14
1460 IF S$ = "#" THEN N = N + 1
1470 FS = INT((466 * A ^ N) * 2 ^ O)
1480 FH(V) = INT(FS / 256)
1490 FL(V) = FS - 256 * FH(V)
1500 RETURN

1510 REM Play or pause
1520 FOR I = 0 TO 2
1530 POKE S + 7 * I, FL(I)
1540 POKE S + 7 * I + 1, FH(I)
1550 POKE S + 7 * I + 4, WF + PLAY(I)
1560 NEXT
1570 IF D =  4 THEN C =    1 : GOTO 1600
1580 IF D =  8 THEN C =  300 : GOTO 1600
1590 IF D = 16 THEN C = 1100 : GOTO 1600
1600 PRINT A$, B$, C$
1610 FOR I = 0 TO C : NEXT
1620 RETURN

1630 REM Mute
1640 FOR I = 0 TO 2
1650 POKE S + 7 * I + 4, WF
1660 NEXT
1670 RETURN

1680 REM **** SONG DATA ****

1690 REM
1700 REM Duration
1710 REM
1720 REM  1     32
1730 REM  1/2.  24
1740 REM  1/2   16
1750 REM  1/4.  12
1760 REM  1/4    8
1770 REM  1/8.   6
1780 REM  1/8    4
1790 REM

1800 DATA  4, "c 2", "e 2", "p  "
1810 DATA  4, "   ", "   ", "   "
1820 DATA  4, "   ", "   ", "c 3"
1830 DATA  4, "   ", "   ", "e 3"
1840 DATA  4, "a 1", "p  ", "g 3"
1850 DATA  4, "   ", "   ", "   "
1860 DATA  4, "   ", "   ", "   "
1870 DATA  4, "   ", "   ", "c 4"

1880 DATA  4, "d 2", "   ", "g 3"
1890 DATA  4, "   ", "   ", "f 3"
1900 DATA  4, "   ", "   ", "e 3"
1910 DATA  4, "   ", "   ", "d 3"
1920 DATA  4, "g 1", "   ", "c 3"
1930 DATA  4, "   ", "   ", "   "
1940 DATA  4, "   ", "b 2", "d 3"
1950 DATA  4, "   ", "   ", "   "

1960 DATA  4, "c 2", "e 2", "p  "
1970 DATA  4, "   ", "   ", "   "
1980 DATA  4, "   ", "   ", "c 3"
1990 DATA  4, "   ", "   ", "e 3"
2000 DATA  4, "a 1", "p  ", "g 3"
2010 DATA  4, "   ", "   ", "   "
2020 DATA  4, "   ", "   ", "   "
2030 DATA  4, "   ", "   ", "c 4"

2040 DATA  4, "d 2", "   ", "g 3"
2050 DATA  4, "   ", "   ", "   "
2060 DATA  4, "a 1", "   ", "   "
2070 DATA  4, "   ", "   ", "   "
2080 DATA  4, "g 1", "   ", "   "
2090 DATA  4, "   ", "   ", "   "
2100 DATA  4, "   ", "   ", "f 3"
2110 DATA  4, "   ", "   ", "   "

2120 DATA  4, "c 2", "   ", "e 3"
2130 DATA  4, "   ", "   ", "   "
2140 DATA  4, "b 1", "   ", "g 3"
2150 DATA  4, "   ", "   ", "   "
2160 DATA  4, "a 1", "   ", "c 4"
2170 DATA  4, "   ", "   ", "   "
2180 DATA  4, "   ", "   ", "e 4"
2190 DATA  4, "   ", "   ", "   "

2200 DATA  4, "d 2", "f 2", "d 4"
2210 DATA  4, "   ", "   ", "c 4"
2220 DATA  4, "   ", "   ", "b 3"
2230 DATA  4, "   ", "   ", "a 3"
2240 DATA  4, "g 1", "p  ", "g 3"
2250 DATA  4, "   ", "   ", "   "
2260 DATA  4, "   ", "   ", "f 3"
2270 DATA  4, "   ", "   ", "   "

2280 DATA  4, "g#1", "e 2", "e 3"
2290 DATA  4, "   ", "   ", "   "
2300 DATA  4, "   ", "   ", "   "
2310 DATA  4, "   ", "   ", "   "
2320 DATA  4, "a 1", "c#2", "   "
2330 DATA  4, "   ", "   ", "   "
2340 DATA  4, "   ", "   ", "   "
2350 DATA  4, "   ", "   ", "   "

2360 DATA  4, "d 2", "p  ", "   "
2370 DATA  4, "   ", "   ", "   "
2380 DATA  4, "a 1", "   ", "   "
2390 DATA  4, "   ", "   ", "p  "
2400 DATA  4, "g 1", "   ", "   "
2410 DATA  4, "   ", "   ", "   "
2420 DATA  4, "   ", "g#2", "b 2"
2430 DATA  4, "   ", "   ", "   "

2440 DATA  4, "c 2", "e 2", "p  "
2450 DATA  4, "   ", "   ", "   "
2460 DATA  4, "   ", "   ", "c 3"
2470 DATA  4, "   ", "   ", "e 3"
2480 DATA  4, "a 1", "p  ", "g 3"
2490 DATA  4, "   ", "   ", "   "
2500 DATA  4, "   ", "   ", "   "
2510 DATA  4, "   ", "   ", "c 4"

2520 DATA  4, "d 2", "   ", "g 3"
2530 DATA  4, "   ", "   ", "f 3"
2540 DATA  4, "   ", "   ", "e 3"
2550 DATA  4, "   ", "   ", "d 3"
2560 DATA  4, "g 1", "   ", "c 3"
2570 DATA  4, "   ", "   ", "   "
2580 DATA  4, "   ", "b 2", "d 3"
2590 DATA  4, "   ", "   ", "   "

2600 DATA  4, "c 2", "e 2", "p  "
2610 DATA  4, "   ", "   ", "   "
2620 DATA  4, "   ", "   ", "c 3"
2630 DATA  4, "   ", "   ", "e 3"
2640 DATA  4, "a 1", "p  ", "g 3"
2650 DATA  4, "   ", "   ", "   "
2660 DATA  4, "   ", "   ", "   "
2670 DATA  4, "   ", "   ", "c 4"

2680 DATA  4, "d 2", "   ", "g 3"
2690 DATA  4, "   ", "   ", "   "
2700 DATA  4, "g#1", "   ", "   "
2710 DATA  4, "   ", "   ", "   "
2720 DATA  4, "g 1", "   ", "   "
2730 DATA  4, "   ", "   ", "   "
2740 DATA  4, "b 1", "   ", "   "
2750 DATA  4, "   ", "   ", "   "

2760 DATA  4, "c 2", "   ", "e 3"
2770 DATA  4, "   ", "   ", "   "
2780 DATA  4, "b 1", "d 2", "g 3"
2790 DATA  4, "   ", "   ", "   "
2800 DATA  4, "a 1", "e 2", "c 4"
2810 DATA  4, "   ", "   ", "   "
2820 DATA  4, "   ", "   ", "e 4"
2830 DATA  4, "   ", "   ", "   "

2840 DATA  4, "d 2", "f 2", "d 4"
2850 DATA  4, "   ", "   ", "c 4"
2860 DATA  4, "   ", "   ", "b 3"
2870 DATA  4, "   ", "   ", "a 3"
2880 DATA  4, "e 2", "p  ", "g#3"
2890 DATA  4, "   ", "   ", "   "
2900 DATA  4, "   ", "   ", "b 3"
2910 DATA  4, "   ", "   ", "   "

2920 DATA  4, "a 1", "   ", "c 4"
2930 DATA  4, "   ", "   ", "   "
2940 DATA  4, "e 2", "   ", "   "
2950 DATA  4, "   ", "   ", "   "
2960 DATA  4, "b 2", "   ", "   "
2970 DATA  4, "   ", "   ", "   "
2980 DATA  4, "a 2", "   ", "   "
2990 DATA  4, "   ", "   ", "   "

3000 DATA  4, "e 2", "g#2", "   "
3010 DATA  4, "   ", "   ", "   "
3020 DATA  4, "   ", "   ", "   "
3030 DATA  4, "   ", "   ", "   "
3040 DATA  4, "a 2", "p  ", "   "
3050 DATA  4, "   ", "   ", "   "
3060 DATA  4, "b 2", "   ", "   "
3070 DATA  4, "   ", "   ", "   "

3080 DATA  0, "   ", "   ", "   "

3090 DATA  4, "   ", "   ", "   "
3100 DATA  4, "   ", "   ", "   "
3110 DATA  4, "   ", "   ", "   "
3120 DATA  4, "   ", "   ", "   "
3130 DATA  4, "   ", "   ", "   "
3140 DATA  4, "   ", "   ", "   "
3150 DATA  4, "   ", "   ", "   "
3160 DATA  4, "   ", "   ", "   "

