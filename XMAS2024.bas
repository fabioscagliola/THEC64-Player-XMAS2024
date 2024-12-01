1000 PRINT CHR$(147)
1010 PRINT "xmas 2024"
1020 PRINT
1030 PRINT "laura and fabio wish you"
1040 PRINT "happy winter holidays"
1050 PRINT
1060 PRINT "close encounters of the third kind"
1070 PRINT "by john williams"

1080 REM **** PLAYER ****

1090 S = 54272
1100 FOR T = 0 TO 24 : POKE S + T, 0 : NEXT
1110 POKE S + 24, 15
1120 TM = 100
1130 WF = 16
1140 A = 2 ^ (1 / 12)
1150 FOR V = 0 TO 2
1160 POKE S + 5 + 7 * V,  3 * 16 + 7
1170 POKE S + 6 + 7 * V, 10 * 16 + 9
1180 NEXT
1190 READ D, A$, B$, C$
1200 IF D = 0 THEN GOSUB 1490 : END
1210 V = 0
1220 GOSUB 1300
1230 A$ = B$
1240 V = 1
1250 GOSUB 1300
1260 A$ = C$
1270 V = 2
1280 GOSUB 1300
1290 GOTO 1190

1300 N$ = MID$(A$, 1, 1)
1310 S$ = MID$(A$, 2, 1)
1320 O = VAL(MID$(A$, 3, 1))
1330 N = 2 * (ASC(N$) - 65) - 1
1340 IF N$ = " " THEN GOTO 1500
1350 IF N$ = "p" THEN GOTO 1490
1360 IF N$ = "f" THEN N = N - 1 : GOTO 1400
1370 IF N$ = "g" THEN N = N - 1 : GOTO 1400
1380 IF N$ = "a" THEN N = 12 : GOTO 1400
1390 IF N$ = "b" THEN N = 14
1400 IF S$ = "#" THEN N = N + 1
1420 FS = INT((466 * A ^ N) * 2 ^ O)
1430 FH = INT(FS / 256)
1440 FL = FS - 256 * FH
1450 POKE S + 7 * V, FL
1460 POKE S + 7 * V + 1, FH
1470 POKE S + 7 * V + 4, WF + 1
1480 RETURN
1490 POKE S + 7 * V + 4, WF
1500 FOR T = 1 TO INT(TM * D) : NEXT
1510 RETURN

1520 REM **** SONG DATA ****

1530 REM
1540 REM Duration
1550 REM
1560 REM  1     16
1570 REM  1/2.  12
1580 REM  1/2    8
1590 REM  1/4.   6
1600 REM  1/4    4
1610 REM  1/8.   3
1620 REM  1/8    2
1630 REM

1640 DATA  8, "d#1", "   ", "   "
1650 DATA  4, "   ", "a#3", "   "
1660 DATA  4, "   ", "c 4", "   "
1670 DATA  4, "   ", "g#3", "   "
1680 DATA  4, "   ", "g#2", "   "
1690 DATA  8, "d#2", "d#3", "   "

1700 DATA  0, "   ", "   ", "   "

