1000 PRINT CHR$(147)
1010 PRINT "xmas 2024"
1020 PRINT
1030 PRINT "laura and fabio wish you"
1040 PRINT "happy winter holidays"
1050 PRINT
1060 PRINT "sleigh ride"
1070 PRINT "by leroy anderson"

1080 REM **** PLAYER ****

1090 BPM = 240

1100 S = 54272
1110 FOR I = 0 TO 24 : POKE S + I, 0 : NEXT
1120 POKE S + 24, 15
1130 WF = 16
1140 A = 2 ^ (1 / 12)
1150 FOR I = 0 TO 2
1160 POKE S + 5 + 7 * I,  3 * 16 + 7
1170 POKE S + 6 + 7 * I, 10 * 16 + 9
1180 NEXT

1190 DIM PLAY(2)
1200 DIM FH(2)
1210 DIM FL(2)

1220 READ D, A$, B$, C$
1230 IF D = 0 THEN GOSUB 1630 : END
1240 V = 0
1250 X$ = A$
1260 GOSUB 1350
1270 V = 1
1280 X$ = B$
1290 GOSUB 1350
1300 V = 2
1310 X$ = C$
1320 GOSUB 1350
1330 GOSUB 1520
1340 GOTO 1220

1350 REM Init
1360 N$ = MID$(X$, 1, 1)
1370 S$ = MID$(X$, 2, 1)
1380 O = VAL(MID$(X$, 3, 1))
1390 N = 2 * (ASC(N$) - 65) - 1
1400 PLAY(V) = 1
1410 IF N$ = " " THEN RETURN
1420 IF N$ = "p" THEN PLAY(V) = 0 : RETURN
1430 IF N$ = "f" THEN N = N - 1 : GOTO 1470
1440 IF N$ = "g" THEN N = N - 1 : GOTO 1470
1450 IF N$ = "a" THEN N = 12 : GOTO 1470
1460 IF N$ = "b" THEN N = 14
1470 IF S$ = "#" THEN N = N + 1
1480 FS = INT((466 * A ^ N) * 2 ^ O)
1490 FH(V) = INT(FS / 256)
1500 FL(V) = FS - 256 * FH(V)
1510 RETURN

1520 REM Play or mute
1530 FOR I = 0 TO 2
1540 POKE S + 7 * I, FL(I)
1550 POKE S + 7 * I + 1, FH(I)
1560 POKE S + 7 * I + 4, WF + PLAY(I)
1570 NEXT
1580 C = 60 / (BPM * D)
1590 PRINT D, C
1600 B = TI
1610 IF TI - B < C THEN GOTO 1610
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

1800 DATA  8, "g 2", "   ", "d 4"
1810 DATA  8, "   ", "   ", "e 4"
1820 DATA  4, "e 2", "   ", "d 4"
1830 DATA  4, "   ", "   ", "b 3"
1840 DATA  8, "   ", "   ", "g 3"

1850 DATA  8, "a 2", "   ", "a 3"
1860 DATA  8, "   ", "   ", "b 3"
1870 DATA  4, "d 2", "   ", "a 3"
1880 DATA  4, "   ", "   ", "f#3"
1890 DATA  8, "   ", "   ", "e 3"

1900 DATA 16, "g 2", "   ", "d 3"
1910 DATA 16, "e 2", "   ", "   "

1920 DATA  8, "a 2", "   ", "p  "
1930 DATA  8, "   ", "   ", "e 3"
1940 DATA  8, "d 2", "   ", "f#3"
1950 DATA  8, "   ", "   ", "a 3"

1960 DATA  8, "g 2", "   ", "d 4"
1970 DATA  8, "   ", "   ", "e 4"
1980 DATA  4, "e 2", "   ", "d 4"
1990 DATA  4, "   ", "   ", "b 3"
2000 DATA  4, "   ", "   ", "a 3"
2010 DATA  4, "   ", "   ", "g 3"

2020 DATA  8, "a 2", "   ", "a 3"
2030 DATA  4, "   ", "   ", "a 3"
2040 DATA  4, "   ", "   ", "b 3"
2050 DATA  4, "d 2", "   ", "a 3"
2060 DATA  4, "   ", "   ", "g 3"
2070 DATA  8, "   ", "   ", "e 3"

2080 DATA 16, "g 2", "   ", "g 3"
2090 DATA 16, "e 2", "   ", "   "

2100 DATA  0, "   ", "   ", "   "

