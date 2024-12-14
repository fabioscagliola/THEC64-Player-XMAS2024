1000 PRINT CHR$(147)
1010 PRINT "xmas 2024"
1020 PRINT
1030 PRINT "laura and fabio wish you"
1040 PRINT "happy winter holidays"
1050 PRINT
1060 PRINT "sleigh ride"
1070 PRINT "by leroy anderson"

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
1410 IF N$ = "p" THEN PLAY(V) = 0 : RETURN
1420 IF N$ = "f" THEN N = N - 1 : GOTO 1460
1430 IF N$ = "g" THEN N = N - 1 : GOTO 1460
1440 IF N$ = "a" THEN N = 12 : GOTO 1460
1450 IF N$ = "b" THEN N = 14
1460 IF S$ = "#" THEN N = N + 1
1470 FS = INT((466 * A ^ N) * 2 ^ O)
1480 FH(V) = INT(FS / 256)
1490 FL(V) = FS - 256 * FH(V)
1500 RETURN

1510 REM Play or mute
1520 FOR I = 0 TO 2
1530 POKE S + 7 * I, FL(I)
1540 POKE S + 7 * I + 1, FH(I)
1550 POKE S + 7 * I + 4, WF + PLAY(I)
1560 NEXT
1570 IF D =  4 THEN C =    1 : GOTO 1600
1580 IF D =  8 THEN C =  300 : GOTO 1600
1590 IF D = 16 THEN C = 1100 : GOTO 1600
1600 PRINT D, C
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

1800 DATA  4, "p  ", "   ", "d 4"
1810 DATA  4, "p  ", "   ", "p  "
1820 DATA  4, "p  ", "   ", "d 4"
1830 DATA  4, "p  ", "   ", "p  "
1840 DATA  4, "p  ", "   ", "d 4"
1850 DATA  4, "p  ", "   ", "p  "

1860 DATA  8, "g 2", "   ", "d 4"
1870 DATA  8, "   ", "   ", "e 4"
1880 DATA  4, "e 2", "   ", "d 4"
1890 DATA  4, "   ", "   ", "b 3"
1900 DATA  8, "   ", "   ", "g 3"

1910 DATA  8, "a 2", "   ", "a 3"
1920 DATA  8, "   ", "   ", "b 3"
1930 DATA  4, "d 2", "   ", "a 3"
1940 DATA  4, "   ", "   ", "f#3"
1950 DATA  8, "   ", "   ", "e 3"

1960 DATA 16, "g 2", "   ", "d 3"
1970 DATA 16, "e 2", "   ", "   "

1980 DATA  8, "a 2", "   ", "p  "
1990 DATA  8, "   ", "   ", "e 3"
2000 DATA  8, "d 2", "   ", "f#3"
2010 DATA  8, "   ", "   ", "a 3"

2020 DATA  8, "g 2", "   ", "d 4"
2030 DATA  8, "   ", "   ", "e 4"
2040 DATA  4, "e 2", "   ", "d 4"
2050 DATA  4, "   ", "   ", "b 3"
2060 DATA  4, "   ", "   ", "a 3"
2070 DATA  4, "   ", "   ", "g 3"

2080 DATA  8, "a 2", "   ", "a 3"
2090 DATA  4, "   ", "   ", "a 3"
2100 DATA  4, "   ", "   ", "b 3"
2110 DATA  4, "d 2", "   ", "a 3"
2120 DATA  4, "   ", "   ", "g 3"
2130 DATA  8, "   ", "   ", "e 3"

2140 DATA 16, "g 2", "   ", "g 3"
2150 DATA 16, "e 2", "   ", "   "

2160 DATA  0, "   ", "   ", "   "

