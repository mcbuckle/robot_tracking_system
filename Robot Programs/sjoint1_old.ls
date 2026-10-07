/PROG  SJOINT1
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 935;
CREATE		= DATE 25-10-08  TIME 07:01:48;
MODIFIED	= DATE 26-03-17  TIME 09:16:42;
FILE_NAME	= THREE;
VERSION		= 0;
LINE_COUNT	= 31;
MEMORY_SIZE	= 1191;
PROTECT		= READ_WRITE;
TCD:  STACK_SIZE	= 0,
      TASK_PRIORITY	= 50,
      TIME_SLICE	= 0,
      BUSY_LAMP_OFF	= 0,
      ABORT_REQUEST	= 0,
      PAUSE_REQUEST	= 0;
DEFAULT_GROUP	= 1,*,*,*,*;
CONTROL_CODE	= 00000000 00000000;
/APPL
/MN
  1:  UFRAME_NUM=0 ;
  2:  UTOOL_NUM=4 ;
  3:  PAYLOAD[6] ;
  4:  ;
  5:  R[25:STREAM_STOP]=0    ;
  6:  ;
  7:  DO[29:RPI_START]=ON; 
  8:  ;
  9:  ; 
  10: DO[25:Data_START]=ON ;
  11: WAIT  1.00(sec) ;
  12: DO[25:Data_START]=OFF ;
  13: ;
  14: RUN STREAM_POS ;
  15: ;
  16: J P[1] 15% FINE    ;
  17: J P[3] 25% CNT100    ;
  18: J P[1] 25% FINE    ;
  19: ;
  20: WAIT  1.00(sec) ;
  21: DO[23:TARE]=ON ;
  22: WAIT  1.00(sec) ;
  23: DO[23:TARE]=OFF ;
  24: WAIT  3.00(sec) ; 
  25: ;
  26: J P[1] 100% FINE    ;
  27: J P[2] 15% FINE    ;
  28: J P[1] 15% FINE    ;
  29: ;
  30: WAIT   5.00(sec) ;
  31: ;
  32: ;
  33: ;
  34: DO[29:RPi_START]=OFF ; 
  35: ;
  36: R[25:STREAM_STOP]=1  ;
  37: ;
  38: ;
  39:  DO[24:Data_Stop]=ON ;
  40:  WAIT  1.00(sec) ;
  41:  DO[24:Data_Stop]=OFF ;
  42:  WAIT 0.5(sec);
/POS
P[1]{
   GP1:
	UF : 0, UT : 4,		CONFIG : 'N U T, 0, 0, 0',
	X =  1592.017  mm,	Y =      .036  mm,	Z =   913.994  mm,
	W =   179.999 deg,	P =      .000 deg,	R =      .001 deg
};
P[2]{
   GP1:
	UF : 0, UT : 4,		CONFIG : 'N U T, 0, 0, 0',
	X =  1378.759  mm,	Y =   796.000  mm,	Z =   913.917  mm,
	W =   179.998 deg,	P =      .004 deg,	R =    29.999 deg
};
P[3]{
   GP1:
	UF : 0, UT : 4,		CONFIG : 'N U T, 0, 0, 0',
	X =  1591.846  mm,	Y =   -24.849  mm,	Z =   913.938  mm,
	W =   179.998 deg,	P =      .003 deg,	R =     -.894 deg
};
/END
