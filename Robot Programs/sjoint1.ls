/PROG  SJOINT1
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 1061;
CREATE		= DATE 25-10-08  TIME 07:01:48;
MODIFIED	= DATE 26-10-07  TIME 08:48:50;
FILE_NAME	= THREE;
VERSION		= 0;
LINE_COUNT	= 42;
MEMORY_SIZE	= 1401;
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
   4:   ;
   5:  R[25:STREAM_STOP]=0    ;
   6:   ;
   7:  DO[29:RPi_START]=ON ;
   8:   ;
   9:   ;
  10:  DO[25:DATA_START]=ON ;
  11:  WAIT   1.00(sec) ;
  12:  DO[25:DATA_START]=OFF ;
  13:   ;
  14:  RUN STREAM_POS_3 ;
  15:   ;
  16:J P[1] 15% FINE    ;
  17:J P[3] 25% CNT100    ;
  18:J P[1] 25% FINE    ;
  19:   ;
  20:  WAIT   1.00(sec) ;
  21:  DO[23:TARE]=ON ;
  22:  WAIT   1.00(sec) ;
  23:  DO[23:TARE]=OFF ;
  24:  WAIT   3.00(sec) ;
  25:   ;
  26:J P[1] 100% FINE    ;
  27:J P[2] 15% FINE    ;
  28:J P[1] 15% FINE    ;
  29:   ;
  30:  WAIT   5.00(sec) ;
  31:   ;
  32:  R[25:STREAM_STOP]=1    ;
  33:   ;
  34:  WAIT   1.00(sec) ;
  35:   ;
  36:  DO[29:RPi_START]=OFF ;
  37:   ;
  38:   ;
  39:  DO[24:DATA_STOP]=ON ;
  40:  WAIT   1.00(sec) ;
  41:  DO[24:DATA_STOP]=OFF ;
  42:   ;
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
	X =  1999.942  mm,	Y =   710.650  mm,	Z =   514.922  mm,
	W =    85.001 deg,	P =    30.000 deg,	R =    30.000 deg
};
P[3]{
   GP1:
	UF : 0, UT : 4,		CONFIG : 'N U T, 0, 0, 0',
	X =  1591.789  mm,	Y =    27.898  mm,	Z =   913.911  mm,
	W =   180.000 deg,	P =      .004 deg,	R =     1.003 deg
};
/END
