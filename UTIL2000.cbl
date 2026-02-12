000100 IDENTIFICATION DIVISION.                                         00010000
000200 PROGRAM-ID. UTIL2000.                                            00020003
000300***************************************************************** 00030000
000400*  Programmer.:Gabriel Dilley                                     00040003
000500*  Date.......:February 10, 2026                                  00050003
000600*  GitHub URL.:                                                   00060000
000700*  Description:                                                   00070000
000800***************************************************************** 00080000
000900 DATA DIVISION.                                                   00090000
001000 WORKING-STORAGE SECTION.                                         00100000
001100                                                                  00110000
001200***************************************************************** 00120000
001300* CONSTANTS                                                       00130000
001400***************************************************************** 00140000
001500 01  WS-RATE-TIER1            PIC V99      VALUE .12.             00150000
001600 01  WS-RATE-TIER2            PIC V99      VALUE .15.             00160000
001700 01  WS-RATE-TIER3            PIC V99      VALUE .18.             00170000
001800 01  WS-TIER1-LIMIT           PIC 9(4)     VALUE 500.             00180000
001900 01  WS-TIER2-LIMIT           PIC 9(4)     VALUE 500.             00190000
002000                                                                  00200000
002100***************************************************************** 00210000
002200* 3 PREDEFINED CUSTOMERS (NO TABLES)                              00220000
002300***************************************************************** 00230000
002400 01  WS-CUST1.                                                    00240000
002500     05  WS-C1-NAME           PIC X(12)   VALUE 'CUST-ALPHA  '.   00250000
002600     05  WS-C1-KWH            PIC 9(5)    VALUE 350.              00260000
002700     05  WS-C1-FEE            PIC 9(3)V99 VALUE 14.95.            00270000
002800                                                                  00280000
002810 01  WS-CUST2.                                                    00281003
002820     05  WS-C2-NAME           PIC X(12)   VALUE 'CUST-BRAVO  '.   00282003
002830     05  WS-C2-KWH            PIC 9(5)    VALUE 925.              00283003
002840     05  WS-C2-FEE            PIC 9(3)V99 VALUE 14.95.            00284003
002850                                                                  00285003
002860 01  WS-CUST3.                                                    00286003
002870     05  WS-C3-NAME           PIC X(12)   VALUE 'CUST-CHARLIE'.   00287003
002880     05  WS-C3-KWH            PIC 9(5)    VALUE 1350.             00288003
002890     05  WS-C3-FEE            PIC 9(3)V99 VALUE 14.95.            00289003
002891                                                                  00289103
002900***************************************************************** 00290000
003000* CURRENT "INPUT" FIELDS (LOADED PER CUSTOMER)                    00300000
003100***************************************************************** 00310000
003200 01  WS-CUST-NAME             PIC X(12)   VALUE SPACES.           00320000
003300 01  WS-KWH-USED              PIC 9(5)    VALUE 0.                00330000
003400 01  WS-SERVICE-FEE           PIC 9(3)V99 VALUE 0.                00340000
003500                                                                  00350000
003600***************************************************************** 00360000
003700* WORK AREAS                                                      00370000
003800***************************************************************** 00380000
003900 01  WS-TIER1-KWH             PIC 9(5)     VALUE 0.               00390000
004000 01  WS-TIER2-KWH             PIC 9(5)     VALUE 0.               00400000
004100 01  WS-TIER3-KWH             PIC 9(5)     VALUE 0.               00410000
004200                                                                  00420000
004300 01  WS-TIER1-CHARGE          PIC 9(5)V99  VALUE 0.               00430000
004400 01  WS-TIER2-CHARGE          PIC 9(5)V99  VALUE 0.               00440000
004500 01  WS-TIER3-CHARGE          PIC 9(5)V99  VALUE 0.               00450000
004600                                                                  00460000
004700 01  WS-SUBTOTAL              PIC 9(6)V99  VALUE 0.               00470000
004800 01  WS-TOTAL-BILL            PIC 9(6)V99  VALUE 0.               00480000
004900                                                                  00490000
005000***************************************************************** 00500000
005100* EDITED FIELDS FOR DISPLAY                                       00510000
005200***************************************************************** 00520000
005300 01  WS-KWH-USED-ED           PIC Z,ZZZ,ZZZ,ZZ9.                  00530000
005400 01  WS-MONEY-ED              PIC $$,$$$,$$9.99.                  00540000
005500 01  WS-MONEY-ED2             PIC $$,$$$,$$9.99.                  00550000
005600                                                                  00560000
005700***************************************************************** 00570000
005800* IT'S GO TIME!                                                   00580000
005900***************************************************************** 00590000
006000 PROCEDURE DIVISION.                                              00600000
006100                                                                  00610000
006200***************************************************************** 00620000
006300* MAINLINE - DISPLAY HEADING, LOAD CUSTOMER, RUN BILL, STOP       00630000
006400***************************************************************** 00640000
006500 000-MAIN.                                                        00650000
006600     DISPLAY '********************************'.                  00660000
006700     DISPLAY '*** UTIL2000 - CUSTOMER BILL ***'.                  00670003
006800     DISPLAY '********************************'.                  00680000
006900     DISPLAY ' '.                                                 00690000
007000                                                                  00700000
007100     PERFORM 500-LOAD-CUST.                                       00710000
007300                                                                  00730000
007400     STOP RUN.                                                    00740000
007500                                                                  00750000
007600***************************************************************** 00760000
007700* MOVE name/kwh/fee from CUST into current fields.                00770000
007800***************************************************************** 00780000
007900 500-LOAD-CUST.                                                   00790000
008000     MOVE WS-C1-NAME TO WS-CUST-NAME.                             00800000
008100     MOVE WS-C1-KWH  TO WS-KWH-USED.                              00810000
008200     MOVE WS-C1-FEE  TO WS-SERVICE-FEE.                           00820000
008300     PERFORM 600-RUN-BILL.                                        00830003
008301                                                                  00830103
008310     MOVE WS-C2-NAME TO WS-CUST-NAME.                             00831003
008320     MOVE WS-C2-KWH  TO WS-KWH-USED.                              00832003
008330     MOVE WS-C2-FEE  TO WS-SERVICE-FEE.                           00833003
008331     PERFORM 600-RUN-BILL.                                        00833103
008340                                                                  00834003
008350     MOVE WS-C3-NAME TO WS-CUST-NAME.                             00835003
008360     MOVE WS-C3-KWH  TO WS-KWH-USED.                              00836003
008370     MOVE WS-C3-FEE  TO WS-SERVICE-FEE.                           00837003
008371     PERFORM 600-RUN-BILL.                                        00837103
008380                                                                  00838003
008400***************************************************************** 00840000
008500* BILL ROUTINE                                                    00850000
008600***************************************************************** 00860000
008700 600-RUN-BILL.                                                    00870000
008800     PERFORM 100-INITIALIZE.                                      00880000
008900     PERFORM 200-CALC-TIERS.                                      00890000
009000     PERFORM 300-CALC-CHARGES.                                    00900000
009100     PERFORM 400-DISPLAY-RESULTS.                                 00910000
009200     DISPLAY ' '.                                                 00920000
009300                                                                  00930000
009400***************************************************************** 00940000
009500* Zero tier kWh, charges, subtotal, total                         00950000
009600***************************************************************** 00960000
009700 100-INITIALIZE.                                                  00970000
009800     MOVE 0 TO WS-TIER1-KWH                                       00980000
009900              WS-TIER2-KWH                                        00990000
010000              WS-TIER3-KWH                                        01000000
010100              WS-TIER1-CHARGE                                     01010000
010200              WS-TIER2-CHARGE                                     01020000
010300              WS-TIER3-CHARGE                                     01030000
010400              WS-SUBTOTAL                                         01040000
010500              WS-TOTAL-BILL.                                      01050000
010600                                                                  01060000
010700***************************************************************** 01070000
010800* Determine WS-TIER1-KWH, WS-TIER2-KWH, WS-TIER3-KWH              01080000
010900* based on WS-KWH-USED                                            01090000
011000*                                                                 01100000
011100* These are the per-kWh rates:                                    01110000
011200* - Tier 1: first 500 kWh at $0.12/kWh                            01120000
011400* - Tier 2: next 500 kWh (kWh 501 1000) at $0.15/kWh              01140000
011500* - Tier 3: any kWh above 1000 at $0.18/kWh                       01150000
011600***************************************************************** 01160000
011700 200-CALC-TIERS.                                                  01170000
011800     *> If amount used is less than 500 kWh, all goes in tier 1   01180000
011900     IF WS-KWH-USED <= WS-TIER1-LIMIT                             01190000
012000         MOVE WS-KWH-USED TO WS-TIER1-KWH                         01200000
012100         MOVE 0 TO WS-TIER2-KWH WS-TIER3-KWH                      01210000
012200     ELSE                                                         01220000
012300         MOVE WS-TIER1-LIMIT TO WS-TIER1-KWH                      01230000
012400                                                                  01240000
012500         *> If amount used is between 501 and 1000 kWh,           01250000
012600         *> tier 1 is full, remainder goes in tier 2              01260000
012700         IF WS-KWH-USED <= (WS-TIER1-LIMIT + WS-TIER2-LIMIT)      01270000
012800             COMPUTE WS-TIER2-KWH =                               01280000
012900                 WS-KWH-USED - WS-TIER1-LIMIT                     01290000
013000             MOVE 0 TO WS-TIER3-KWH                               01300000
013100                                                                  01310000
013200         *> If amount used is between 1001 and above,             01320000
013300         *> tier 1 and tier 2 are full, remainder goes in tier 3  01330000
013400         ELSE                                                     01340000
013500             MOVE WS-TIER2-LIMIT TO WS-TIER2-KWH                  01350000
013600             COMPUTE WS-TIER3-KWH =                               01360000
013700                 WS-KWH-USED - WS-TIER1-LIMIT - WS-TIER2-LIMIT    01370000
013800         END-IF                                                   01380000
013900     END-IF.                                                      01390000
014000                                                                  01400000
014100***************************************************************** 01410000
014200* COMPUTE charges using ROUNDED and compute totals.               01420000
014300***************************************************************** 01430000
014400 300-CALC-CHARGES.                                                01440000
014500     COMPUTE WS-TIER1-CHARGE ROUNDED =                            01450000
014600         WS-TIER1-KWH * WS-RATE-TIER1.                            01460000
014700                                                                  01470000
014910     COMPUTE WS-TIER2-CHARGE ROUNDED =                            01491003
014920         WS-TIER2-KWH * WS-RATE-TIER2.                            01492003
014930                                                                  01493003
014960     COMPUTE WS-TIER3-CHARGE ROUNDED =                            01496003
014970         WS-TIER3-KWH * WS-RATE-TIER3.                            01497003
014980                                                                  01498003
014990     COMPUTE WS-SUBTOTAL =                                        01499003
014991         WS-TIER1-CHARGE + WS-TIER2-CHARGE + WS-TIER3-CHARGE.     01499103
014992                                                                  01499203
015000     COMPUTE WS-TOTAL-BILL =                                      01500000
015100         WS-SUBTOTAL + WS-SERVICE-FEE.                            01510000
015200                                                                  01520000
015300***************************************************************** 01530000
015400* Display report including customer name.                         01540000
015500***************************************************************** 01550000
015600 400-DISPLAY-RESULTS.                                             01560000
015700     MOVE WS-KWH-USED TO WS-KWH-USED-ED.                          01570000
015800                                                                  01580000
015900     DISPLAY '--------------------------------'.                  01590000
016000     DISPLAY 'CUSTOMER: ' WS-CUST-NAME.                           01600000
016100     DISPLAY '--------------------------------'.                  01610000
016200     DISPLAY 'KWH USED       : ' WS-KWH-USED-ED.                  01620000
016300                                                                  01630000
016400     MOVE WS-SERVICE-FEE TO WS-MONEY-ED.                          01640000
016500     DISPLAY 'SERVICE FEE    : ' WS-MONEY-ED.                     01650000
016600                                                                  01660000
016700     MOVE WS-TIER1-CHARGE TO WS-MONEY-ED.                         01670000
016800     DISPLAY 'TIER 1 CHARGE  : ' WS-MONEY-ED.                     01680000
016900                                                                  01690000
017000     MOVE WS-TIER2-CHARGE TO WS-MONEY-ED.                         01700000
017100     DISPLAY 'TIER 2 CHARGE  : ' WS-MONEY-ED.                     01710000
017200                                                                  01720000
017300     MOVE WS-TIER3-CHARGE TO WS-MONEY-ED.                         01730000
017400     DISPLAY 'TIER 3 CHARGE  : ' WS-MONEY-ED.                     01740000
017500                                                                  01750000
017600     MOVE WS-TOTAL-BILL TO WS-MONEY-ED2.                          01760000
017700     DISPLAY '--------------------------------'.                  01770000
017800     DISPLAY 'TOTAL BILL     : ' WS-MONEY-ED2.                    01780000
017900     DISPLAY '--------------------------------'.                  01790000
