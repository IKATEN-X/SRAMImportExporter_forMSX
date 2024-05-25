10 'save"HL2SRAM.BAS"
20 SCREEN 0:WIDTH 80
30 CLEAR200,&HBFFF:DEFINTA-Z:L$=""
40 BLOAD"RDWTSLT.BIN"
50 DEFUSR=&HC000:DEFUSR1=&HC003
60 '---- Switching ASCII 16K SRAM Segment 0 to Page 2 (&b0001000)
70 POKE&HC006,16:A=USR1(&H7001)
80 INPUT"IMPORT or EXPORT [I/E]";M$
90 IF M$="I" OR M$="i" THEN 240 ELSE IF M$="E" OR M$="e" THEN 100 ELSE 80
100 PRINT "--- Export Mode ---"
110 PRINT "Start copy from SRAM to RAM"
120 FOR I=0 TO 2047
130 A=USR(&H8000+I)
140 AD=&HD000+I:POKE AD,A
150 D$=RIGHT$("0"+HEX$(A),2):IF (IAND15)=15 THEN PRINT HEX$(AD-15);":";L$;D$:L$="" ELSE L$=L$+D$+","
160 NEXT
170 PRINT "Copy done."
180 FILES"*.srm":PRINT
190 PRINT "Enter the name of the SRAM data to be saved."
200 INPUT"(No extention required.)";SV$:IF SV$="" THEN 200
210 BSAVE SV$+".srm",&HD000,&HD7FF
220 PRINT "Export done."
230 END
240 PRINT "--- Import Mode ---"
250 FILES"*.srm":PRINT
260 PRINT "Enter the name of the SRAM data to be loaded."
270 INPUT"(No extention required.)";LD$:IF LD$="" THEN 270
280 BLOAD LD$+".srm"
290 INPUT "Are you sure to start importing? [Y/N]";OK$
300 IF OK$="Y" OR OK$="y" THEN 310 ELSE 290
310 PRINT "Start copy from RAM to SRAM"
320 FOR I=0 TO 2047
330 AD=&HD000+I:A=PEEK(AD):POKE&HC006,A:B=USR1(&H8000+I)
340 D$=RIGHT$("0"+HEX$(A),2):IF (IAND15)=15 THEN PRINT HEX$(AD-15);":";L$;D$:L$="" ELSE L$=L$+D$+","
350 NEXT
360 PRINT "Import done."
