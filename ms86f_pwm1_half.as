opt subtitle "HI-TECH Software Omniscient Code Generator (PRO mode) build 10920"

opt pagewidth 120

	opt pm

	processor	16F685
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
indf	equ	0
indf0	equ	0
pc	equ	2
pcl	equ	2
status	equ	3
fsr	equ	4
fsr0	equ	4
c	equ	1
z	equ	0
pclath	equ	10
	FNCALL	_main,_DEVICE_INIT
	FNCALL	_main,_PWM1_INIT
	FNCALL	_main,_SetWorking
	FNCALL	_main,_SetSleep
	FNCALL	_main,_DELAY_MS
	FNCALL	_SetWorking,_PWM1_INIT
	FNCALL	_DELAY_MS,_DELAY_125US
	FNROOT	_main
	global	_brigtness
psect	idataCOMMON,class=CODE,space=0,delta=2
global __pidataCOMMON
__pidataCOMMON:
	file	"MS86F_PWM1_HALF.C"
	line	44

;initializer for _brigtness
	retlw	05h
	retlw	0

	global	_working_timer
	global	_minute_cnt
	global	_ANSEL
_ANSEL	set	286
	DABS	1,286,1	;_ANSEL

	global	_ANSELH
_ANSELH	set	287
	DABS	1,287,1	;_ANSELH

	global	_CM1CON0
_CM1CON0	set	281
	DABS	1,281,1	;_CM1CON0

	global	_CM2CON0
_CM2CON0	set	282
	DABS	1,282,1	;_CM2CON0

	global	_CM2CON1
_CM2CON1	set	283
	DABS	1,283,1	;_CM2CON1

	global	_EEADRH
_EEADRH	set	271
	DABS	1,271,1	;_EEADRH

	global	_EEDATH
_EEDATH	set	270
	DABS	1,270,1	;_EEDATH

	global	_IOCB
_IOCB	set	278
	DABS	1,278,1	;_IOCB

	global	_PSTRCON
_PSTRCON	set	413
	DABS	1,413,1	;_PSTRCON

	global	_SRCON
_SRCON	set	414
	DABS	1,414,1	;_SRCON

	global	_VRCON
_VRCON	set	280
	DABS	1,280,1	;_VRCON

	global	_WPUB
_WPUB	set	277
	DABS	1,277,1	;_WPUB

	global	_ANS0
_ANS0	set	2288
	DABS	1,286,1	;_ANS0

	global	_ANS1
_ANS1	set	2289
	DABS	1,286,1	;_ANS1

	global	_ANS10
_ANS10	set	2298
	DABS	1,287,1	;_ANS10

	global	_ANS11
_ANS11	set	2299
	DABS	1,287,1	;_ANS11

	global	_ANS2
_ANS2	set	2290
	DABS	1,286,1	;_ANS2

	global	_ANS3
_ANS3	set	2291
	DABS	1,286,1	;_ANS3

	global	_ANS4
_ANS4	set	2292
	DABS	1,286,1	;_ANS4

	global	_ANS5
_ANS5	set	2293
	DABS	1,286,1	;_ANS5

	global	_ANS6
_ANS6	set	2294
	DABS	1,286,1	;_ANS6

	global	_ANS7
_ANS7	set	2295
	DABS	1,286,1	;_ANS7

	global	_ANS8
_ANS8	set	2296
	DABS	1,287,1	;_ANS8

	global	_ANS9
_ANS9	set	2297
	DABS	1,287,1	;_ANS9

	global	_C1CH0
_C1CH0	set	2248
	DABS	1,281,1	;_C1CH0

	global	_C1CH1
_C1CH1	set	2249
	DABS	1,281,1	;_C1CH1

	global	_C1OE
_C1OE	set	2253
	DABS	1,281,1	;_C1OE

	global	_C1ON
_C1ON	set	2255
	DABS	1,281,1	;_C1ON

	global	_C1OUT
_C1OUT	set	2254
	DABS	1,281,1	;_C1OUT

	global	_C1POL
_C1POL	set	2252
	DABS	1,281,1	;_C1POL

	global	_C1R
_C1R	set	2250
	DABS	1,281,1	;_C1R

	global	_C1SEN
_C1SEN	set	3317
	DABS	1,414,1	;_C1SEN

	global	_C1VREN
_C1VREN	set	2247
	DABS	1,280,1	;_C1VREN

	global	_C2CH0
_C2CH0	set	2256
	DABS	1,282,1	;_C2CH0

	global	_C2CH1
_C2CH1	set	2257
	DABS	1,282,1	;_C2CH1

	global	_C2OE
_C2OE	set	2261
	DABS	1,282,1	;_C2OE

	global	_C2ON
_C2ON	set	2263
	DABS	1,282,1	;_C2ON

	global	_C2OUT
_C2OUT	set	2262
	DABS	1,282,1	;_C2OUT

	global	_C2POL
_C2POL	set	2260
	DABS	1,282,1	;_C2POL

	global	_C2R
_C2R	set	2258
	DABS	1,282,1	;_C2R

	global	_C2REN
_C2REN	set	3316
	DABS	1,414,1	;_C2REN

	global	_C2SYNC
_C2SYNC	set	2264
	DABS	1,283,1	;_C2SYNC

	global	_C2VREN
_C2VREN	set	2246
	DABS	1,280,1	;_C2VREN

	global	_EEPGD
_EEPGD	set	3175
	DABS	1,396,1	;_EEPGD

	global	_IOCB4
_IOCB4	set	2228
	DABS	1,278,1	;_IOCB4

	global	_IOCB5
_IOCB5	set	2229
	DABS	1,278,1	;_IOCB5

	global	_IOCB6
_IOCB6	set	2230
	DABS	1,278,1	;_IOCB6

	global	_IOCB7
_IOCB7	set	2231
	DABS	1,278,1	;_IOCB7

	global	_MC1OUT
_MC1OUT	set	2271
	DABS	1,283,1	;_MC1OUT

	global	_MC2OUT
_MC2OUT	set	2270
	DABS	1,283,1	;_MC2OUT

	global	_PULSR
_PULSR	set	3314
	DABS	1,414,1	;_PULSR

	global	_PULSS
_PULSS	set	3315
	DABS	1,414,1	;_PULSS

	global	_SR0
_SR0	set	3318
	DABS	1,414,1	;_SR0

	global	_SR1
_SR1	set	3319
	DABS	1,414,1	;_SR1

	global	_STRA
_STRA	set	3304
	DABS	1,413,1	;_STRA

	global	_STRB
_STRB	set	3305
	DABS	1,413,1	;_STRB

	global	_STRC
_STRC	set	3306
	DABS	1,413,1	;_STRC

	global	_STRD
_STRD	set	3307
	DABS	1,413,1	;_STRD

	global	_STRSYNC
_STRSYNC	set	3308
	DABS	1,413,1	;_STRSYNC

	global	_T1GSS
_T1GSS	set	2265
	DABS	1,283,1	;_T1GSS

	global	_VP6EN
_VP6EN	set	2244
	DABS	1,280,1	;_VP6EN

	global	_VR0
_VR0	set	2240
	DABS	1,280,1	;_VR0

	global	_VR1
_VR1	set	2241
	DABS	1,280,1	;_VR1

	global	_VR2
_VR2	set	2242
	DABS	1,280,1	;_VR2

	global	_VR3
_VR3	set	2243
	DABS	1,280,1	;_VR3

	global	_VRR
_VRR	set	2245
	DABS	1,280,1	;_VRR

	global	_WPUB4
_WPUB4	set	2220
	DABS	1,277,1	;_WPUB4

	global	_WPUB5
_WPUB5	set	2221
	DABS	1,277,1	;_WPUB5

	global	_WPUB6
_WPUB6	set	2222
	DABS	1,277,1	;_WPUB6

	global	_WPUB7
_WPUB7	set	2223
	DABS	1,277,1	;_WPUB7

	global	_WREN
_WREN	set	3170
	DABS	1,396,1	;_WREN

	global	_INTCON
_INTCON	set	11
	global	_MSCON
_MSCON	set	27
	global	_P1BDTH
_P1BDTH	set	21
	global	_P1BDTL
_P1BDTL	set	15
	global	_P1CON
_P1CON	set	22
	global	_PORTA
_PORTA	set	5
	global	_PORTC
_PORTC	set	7
	global	_T2CON0
_T2CON0	set	18
	global	_TMR2H
_TMR2H	set	19
	global	_TMR2L
_TMR2L	set	17
	global	_P1BALT
_P1BALT	set	202
	global	_RA2
_RA2	set	42
	global	_RA4
_RA4	set	44
	global	_RA5
_RA5	set	45
	global	_TMR2IF
_TMR2IF	set	97
	global	_TMR2ON
_TMR2ON	set	146
	global	_OPTION
_OPTION	set	129
	global	_OSCCON
_OSCCON	set	143
	global	_P1OE
_P1OE	set	144
	global	_P1POL
_P1POL	set	153
	global	_PR2H
_PR2H	set	146
	global	_PR2L
_PR2L	set	145
	global	_PSINKA
_PSINKA	set	151
	global	_PSINKC
_PSINKC	set	159
	global	_PSRCA
_PSRCA	set	136
	global	_PSRCC
_PSRCC	set	148
	global	_T2CON1
_T2CON1	set	158
	global	_TRISA
_TRISA	set	133
	global	_TRISC
_TRISC	set	135
	global	_WPUA
_WPUA	set	149
	global	_WPUC
_WPUC	set	147
	file	"ms86f_pwm1_half.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bssCOMMON,class=COMMON,space=1
global __pbssCOMMON
__pbssCOMMON:
_working_timer:
       ds      2

_minute_cnt:
       ds      1

psect	dataCOMMON,class=COMMON,space=1
global __pdataCOMMON
__pdataCOMMON:
	file	"MS86F_PWM1_HALF.C"
_brigtness:
       ds      2

; Clear objects allocated to COMMON
psect cinit,class=CODE,delta=2
	clrf	((__pbssCOMMON)+0)&07Fh
	clrf	((__pbssCOMMON)+1)&07Fh
	clrf	((__pbssCOMMON)+2)&07Fh
; Initialize objects allocated to COMMON
	global __pidataCOMMON
psect cinit,class=CODE,delta=2
	fcall	__pidataCOMMON+0		;fetch initializer
	movwf	__pdataCOMMON+0&07fh		
	fcall	__pidataCOMMON+1		;fetch initializer
	movwf	__pdataCOMMON+1&07fh		
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_DEVICE_INIT
?_DEVICE_INIT:	; 0 bytes @ 0x0
	global	??_DEVICE_INIT
??_DEVICE_INIT:	; 0 bytes @ 0x0
	global	?_PWM1_INIT
?_PWM1_INIT:	; 0 bytes @ 0x0
	global	??_PWM1_INIT
??_PWM1_INIT:	; 0 bytes @ 0x0
	global	?_DELAY_125US
?_DELAY_125US:	; 0 bytes @ 0x0
	global	??_DELAY_125US
??_DELAY_125US:	; 0 bytes @ 0x0
	global	?_SetWorking
?_SetWorking:	; 0 bytes @ 0x0
	global	??_SetWorking
??_SetWorking:	; 0 bytes @ 0x0
	global	?_SetSleep
?_SetSleep:	; 0 bytes @ 0x0
	global	??_SetSleep
??_SetSleep:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	DELAY_125US@a
DELAY_125US@a:	; 1 bytes @ 0x0
	ds	1
	global	?_DELAY_MS
?_DELAY_MS:	; 0 bytes @ 0x1
	global	DELAY_MS@Time
DELAY_MS@Time:	; 2 bytes @ 0x1
	ds	2
	global	??_DELAY_MS
??_DELAY_MS:	; 0 bytes @ 0x3
	global	DELAY_MS@a
DELAY_MS@a:	; 2 bytes @ 0x3
	ds	2
	global	??_main
??_main:	; 0 bytes @ 0x5
;;Data sizes: Strings 0, constant 0, data 2, bss 3, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      5      10
;; BANK0           48      0       0

;;
;; Pointer list with targets:



;;
;; Critical Paths under _main in COMMON
;;
;;   _main->_DELAY_MS
;;   _DELAY_MS->_DELAY_125US
;;
;; Critical Paths under _main in BANK0
;;
;;   None.

;;
;;Main: autosize = 0, tempsize = 0, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 0     0      0      60
;;                        _DEVICE_INIT
;;                          _PWM1_INIT
;;                         _SetWorking
;;                           _SetSleep
;;                           _DELAY_MS
;; ---------------------------------------------------------------------------------
;; (1) _SetWorking                                           0     0      0       0
;;                          _PWM1_INIT
;; ---------------------------------------------------------------------------------
;; (1) _DELAY_MS                                             4     2      2      60
;;                                              1 COMMON     4     2      2
;;                        _DELAY_125US
;; ---------------------------------------------------------------------------------
;; (1) _SetSleep                                             0     0      0       0
;; ---------------------------------------------------------------------------------
;; (2) _DELAY_125US                                          1     1      0      30
;;                                              0 COMMON     1     1      0
;; ---------------------------------------------------------------------------------
;; (2) _PWM1_INIT                                            0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _DEVICE_INIT                                          0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 2
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _DEVICE_INIT
;;   _PWM1_INIT
;;   _SetWorking
;;     _PWM1_INIT
;;   _SetSleep
;;   _DELAY_MS
;;     _DELAY_125US
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;SFR1                 0      0       0       2        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;CODE                 0      0       0       0        0.0%
;;DATA                 0      0       C       3        0.0%
;;ABS                  0      0       A       6        0.0%
;;NULL                 0      0       0       0        0.0%
;;STACK                0      0       2       2        0.0%
;;BANK0               30      0       0       5        0.0%
;;BITBANK0            30      0       0       4        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR0              0      0       0       1        0.0%
;;COMMON               E      5       A       1       71.4%
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 187 in file "MS86F_PWM1_HALF.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0
;;      Params:         0       0
;;      Locals:         0       0
;;      Temps:          0       0
;;      Totals:         0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_DEVICE_INIT
;;		_PWM1_INIT
;;		_SetWorking
;;		_SetSleep
;;		_DELAY_MS
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"MS86F_PWM1_HALF.C"
	line	187
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 6
; Regs used in _main: [wreg+status,2+status,0+pclath+cstack]
	line	188
	
l1936:	
;MS86F_PWM1_HALF.C: 188: DEVICE_INIT();
	fcall	_DEVICE_INIT
	line	189
;MS86F_PWM1_HALF.C: 189: PWM1_INIT();
	fcall	_PWM1_INIT
	line	191
	
l1938:	
;MS86F_PWM1_HALF.C: 191: working_timer=0;
	clrf	(_working_timer)
	clrf	(_working_timer+1)
	line	192
	
l1940:	
;MS86F_PWM1_HALF.C: 192: minute_cnt=0;
	clrf	(_minute_cnt)
	line	193
	
l1942:	
;MS86F_PWM1_HALF.C: 193: brigtness=0;
	clrf	(_brigtness)
	clrf	(_brigtness+1)
	line	194
	
l1944:	
;MS86F_PWM1_HALF.C: 194: SetWorking();
	fcall	_SetWorking
	line	197
	
l1946:	
;MS86F_PWM1_HALF.C: 196: {
;MS86F_PWM1_HALF.C: 197: if(minute_cnt<10)
	movlw	(0Ah)
	subwf	(_minute_cnt),w
	skipnc
	goto	u41
	goto	u40
u41:
	goto	l1960
u40:
	line	199
	
l1948:	
;MS86F_PWM1_HALF.C: 198: {
;MS86F_PWM1_HALF.C: 199: brigtness++;
	incf	(_brigtness),f
	skipnz
	incf	(_brigtness+1),f
	line	200
	
l1950:	
;MS86F_PWM1_HALF.C: 200: if(brigtness<=200)P1BDTL=(unsigned char)(200-brigtness);
	movlw	high(0C9h)
	subwf	(_brigtness+1),w
	movlw	low(0C9h)
	skipnz
	subwf	(_brigtness),w
	skipnc
	goto	u51
	goto	u50
u51:
	goto	l1954
u50:
	
l1952:	
	movf	(_brigtness),w
	sublw	0C8h
	bcf	status, 5	;RP0=0, select bank0
	movwf	(15)	;volatile
	goto	l1970
	line	201
	
l1954:	
;MS86F_PWM1_HALF.C: 201: else if(brigtness<(200*2))P1BDTL=(unsigned char)(brigtness-200);
	movlw	high(0190h)
	subwf	(_brigtness+1),w
	movlw	low(0190h)
	skipnz
	subwf	(_brigtness),w
	skipnc
	goto	u61
	goto	u60
u61:
	goto	l1958
u60:
	
l1956:	
	movf	(_brigtness),w
	addlw	038h
	bcf	status, 5	;RP0=0, select bank0
	movwf	(15)	;volatile
	goto	l1970
	line	202
	
l1958:	
;MS86F_PWM1_HALF.C: 202: else brigtness=5;
	movlw	05h
	movwf	(_brigtness)
	clrf	(_brigtness+1)
	goto	l1970
	line	204
	
l1960:	
;MS86F_PWM1_HALF.C: 204: else if(minute_cnt<(10+20))
	movlw	(01Eh)
	subwf	(_minute_cnt),w
	skipnc
	goto	u71
	goto	u70
u71:
	goto	l1964
u70:
	line	206
	
l1962:	
;MS86F_PWM1_HALF.C: 205: {
;MS86F_PWM1_HALF.C: 206: SetSleep();
	fcall	_SetSleep
	line	207
;MS86F_PWM1_HALF.C: 207: }
	goto	l1970
	line	210
	
l1964:	
;MS86F_PWM1_HALF.C: 208: else
;MS86F_PWM1_HALF.C: 209: {
;MS86F_PWM1_HALF.C: 210: SetWorking();
	fcall	_SetWorking
	line	211
	
l1966:	
;MS86F_PWM1_HALF.C: 211: working_timer=0;
	clrf	(_working_timer)
	clrf	(_working_timer+1)
	line	212
	
l1968:	
;MS86F_PWM1_HALF.C: 212: minute_cnt=0;
	clrf	(_minute_cnt)
	line	215
	
l1970:	
;MS86F_PWM1_HALF.C: 213: }
;MS86F_PWM1_HALF.C: 215: working_timer++;
	incf	(_working_timer),f
	skipnz
	incf	(_working_timer+1),f
	line	216
	
l1972:	
;MS86F_PWM1_HALF.C: 216: if(working_timer>=(100*59))
	movlw	high(0170Ch)
	subwf	(_working_timer+1),w
	movlw	low(0170Ch)
	skipnz
	subwf	(_working_timer),w
	skipc
	goto	u81
	goto	u80
u81:
	goto	l1978
u80:
	line	218
	
l1974:	
;MS86F_PWM1_HALF.C: 217: {
;MS86F_PWM1_HALF.C: 218: minute_cnt++;
	incf	(_minute_cnt),f
	line	219
	
l1976:	
;MS86F_PWM1_HALF.C: 219: working_timer=0;
	clrf	(_working_timer)
	clrf	(_working_timer+1)
	line	221
	
l1978:	
;MS86F_PWM1_HALF.C: 220: }
;MS86F_PWM1_HALF.C: 221: DELAY_MS(10);
	movlw	0Ah
	movwf	(?_DELAY_MS)
	clrf	(?_DELAY_MS+1)
	fcall	_DELAY_MS
	goto	l1946
	global	start
	ljmp	start
	opt stack 0
psect	maintext
	line	223
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_SetWorking
psect	text73,local,class=CODE,delta=2
global __ptext73
__ptext73:

;; *************** function _SetWorking *****************
;; Defined at:
;;		line 166 in file "MS86F_PWM1_HALF.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/20
;;		On exit  : 20/20
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0
;;      Params:         0       0
;;      Locals:         0       0
;;      Temps:          0       0
;;      Totals:         0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_PWM1_INIT
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text73
	file	"MS86F_PWM1_HALF.C"
	line	166
	global	__size_of_SetWorking
	__size_of_SetWorking	equ	__end_of_SetWorking-_SetWorking
	
_SetWorking:	
	opt	stack 6
; Regs used in _SetWorking: [wreg+status,2+status,0+pclath+cstack]
	line	167
	
l1930:	
;MS86F_PWM1_HALF.C: 167: RA2=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(42/8),(42)&7
	line	168
;MS86F_PWM1_HALF.C: 168: RA5=0;
	bcf	(45/8),(45)&7
	line	169
	
l1932:	
;MS86F_PWM1_HALF.C: 169: brigtness=5;
	movlw	05h
	movwf	(_brigtness)
	clrf	(_brigtness+1)
	line	170
	
l1934:	
;MS86F_PWM1_HALF.C: 170: PWM1_INIT();
	fcall	_PWM1_INIT
	line	171
	
l811:	
	return
	opt stack 0
GLOBAL	__end_of_SetWorking
	__end_of_SetWorking:
;; =============== function _SetWorking ends ============

	signat	_SetWorking,88
	global	_DELAY_MS
psect	text74,local,class=CODE,delta=2
global __ptext74
__ptext74:

;; *************** function _DELAY_MS *****************
;; Defined at:
;;		line 154 in file "MS86F_PWM1_HALF.C"
;; Parameters:    Size  Location     Type
;;  Time            2    1[COMMON] unsigned short 
;; Auto vars:     Size  Location     Type
;;  a               2    3[COMMON] unsigned short 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0
;;      Params:         2       0
;;      Locals:         2       0
;;      Temps:          0       0
;;      Totals:         4       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_DELAY_125US
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text74
	file	"MS86F_PWM1_HALF.C"
	line	154
	global	__size_of_DELAY_MS
	__size_of_DELAY_MS	equ	__end_of_DELAY_MS-_DELAY_MS
	
_DELAY_MS:	
	opt	stack 6
; Regs used in _DELAY_MS: [wreg+status,2+status,0+pclath+cstack]
	line	157
	
l1920:	
;MS86F_PWM1_HALF.C: 155: unsigned short a;
;MS86F_PWM1_HALF.C: 157: Time<<=3;
	clrc
	rlf	(DELAY_MS@Time),f
	rlf	(DELAY_MS@Time+1),f
	clrc
	rlf	(DELAY_MS@Time),f
	rlf	(DELAY_MS@Time+1),f
	clrc
	rlf	(DELAY_MS@Time),f
	rlf	(DELAY_MS@Time+1),f
	line	159
	
l1922:	
;MS86F_PWM1_HALF.C: 159: for(a=0;a<Time;a++)
	clrf	(DELAY_MS@a)
	clrf	(DELAY_MS@a+1)
	goto	l1928
	line	161
	
l1924:	
;MS86F_PWM1_HALF.C: 160: {
;MS86F_PWM1_HALF.C: 161: DELAY_125US();
	fcall	_DELAY_125US
	line	159
	
l1926:	
	incf	(DELAY_MS@a),f
	skipnz
	incf	(DELAY_MS@a+1),f
	
l1928:	
	movf	(DELAY_MS@Time+1),w
	subwf	(DELAY_MS@a+1),w
	skipz
	goto	u35
	movf	(DELAY_MS@Time),w
	subwf	(DELAY_MS@a),w
u35:
	skipc
	goto	u31
	goto	u30
u31:
	goto	l1924
u30:
	line	163
	
l808:	
	return
	opt stack 0
GLOBAL	__end_of_DELAY_MS
	__end_of_DELAY_MS:
;; =============== function _DELAY_MS ends ============

	signat	_DELAY_MS,4216
	global	_SetSleep
psect	text75,local,class=CODE,delta=2
global __ptext75
__ptext75:

;; *************** function _SetSleep *****************
;; Defined at:
;;		line 173 in file "MS86F_PWM1_HALF.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		status,2
;; Tracked objects:
;;		On entry : 0/20
;;		On exit  : 20/0
;;		Unchanged: FFFDF/0
;; Data sizes:     COMMON   BANK0
;;      Params:         0       0
;;      Locals:         0       0
;;      Temps:          0       0
;;      Totals:         0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text75
	file	"MS86F_PWM1_HALF.C"
	line	173
	global	__size_of_SetSleep
	__size_of_SetSleep	equ	__end_of_SetSleep-_SetSleep
	
_SetSleep:	
	opt	stack 7
; Regs used in _SetSleep: [status,2]
	line	174
	
l1910:	
;MS86F_PWM1_HALF.C: 174: P1OE=0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(144)^080h	;volatile
	line	175
	
l1912:	
;MS86F_PWM1_HALF.C: 175: RA2=1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(42/8),(42)&7
	line	176
	
l1914:	
;MS86F_PWM1_HALF.C: 176: RA5=1;
	bsf	(45/8),(45)&7
	line	177
	
l1916:	
;MS86F_PWM1_HALF.C: 177: P1BALT=0;
	bcf	(202/8),(202)&7
	line	178
	
l1918:	
;MS86F_PWM1_HALF.C: 178: RA4=1;
	bsf	(44/8),(44)&7
	line	179
	
l814:	
	return
	opt stack 0
GLOBAL	__end_of_SetSleep
	__end_of_SetSleep:
;; =============== function _SetSleep ends ============

	signat	_SetSleep,88
	global	_DELAY_125US
psect	text76,local,class=CODE,delta=2
global __ptext76
__ptext76:

;; *************** function _DELAY_125US *****************
;; Defined at:
;;		line 145 in file "MS86F_PWM1_HALF.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  a               1    0[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0
;;      Params:         0       0
;;      Locals:         1       0
;;      Temps:          0       0
;;      Totals:         1       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_DELAY_MS
;; This function uses a non-reentrant model
;;
psect	text76
	file	"MS86F_PWM1_HALF.C"
	line	145
	global	__size_of_DELAY_125US
	__size_of_DELAY_125US	equ	__end_of_DELAY_125US-_DELAY_125US
	
_DELAY_125US:	
	opt	stack 6
; Regs used in _DELAY_125US: [wreg+status,2+status,0]
	line	148
	
l1900:	
;MS86F_PWM1_HALF.C: 146: unsigned char a;
;MS86F_PWM1_HALF.C: 148: for(a=0;a<125;a++)
	clrf	(DELAY_125US@a)
	line	149
	
l800:	
	line	150
# 150 "MS86F_PWM1_HALF.C"
clrwdt ;#
psect	text76
	line	148
	
l1906:	
	incf	(DELAY_125US@a),f
	
l1908:	
	movlw	(07Dh)
	subwf	(DELAY_125US@a),w
	skipc
	goto	u21
	goto	u20
u21:
	goto	l800
u20:
	line	152
	
l802:	
	return
	opt stack 0
GLOBAL	__end_of_DELAY_125US
	__end_of_DELAY_125US:
;; =============== function _DELAY_125US ends ============

	signat	_DELAY_125US,88
	global	_PWM1_INIT
psect	text77,local,class=CODE,delta=2
global __ptext77
__ptext77:

;; *************** function _PWM1_INIT *****************
;; Defined at:
;;		line 87 in file "MS86F_PWM1_HALF.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 20/0
;;		On exit  : 20/20
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0
;;      Params:         0       0
;;      Locals:         0       0
;;      Temps:          0       0
;;      Totals:         0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_SetWorking
;;		_main
;; This function uses a non-reentrant model
;;
psect	text77
	file	"MS86F_PWM1_HALF.C"
	line	87
	global	__size_of_PWM1_INIT
	__size_of_PWM1_INIT	equ	__end_of_PWM1_INIT-_PWM1_INIT
	
_PWM1_INIT:	
	opt	stack 6
; Regs used in _PWM1_INIT: [wreg+status,2]
	line	88
	
l1876:	
;MS86F_PWM1_HALF.C: 88: TRISA |= 0B00010000;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(133)^080h+(4/8),(4)&7	;volatile
	line	91
	
l1878:	
;MS86F_PWM1_HALF.C: 91: T2CON0 = 0B00000001;
	movlw	(01h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(18)	;volatile
	line	92
	
l1880:	
;MS86F_PWM1_HALF.C: 92: T2CON1 = 0B00000000;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(158)^080h	;volatile
	line	93
	
l1882:	
;MS86F_PWM1_HALF.C: 93: PR2H = 0;
	clrf	(146)^080h	;volatile
	line	94
;MS86F_PWM1_HALF.C: 94: PR2L = 200-1;
	movlw	(0C7h)
	movwf	(145)^080h	;volatile
	line	96
	
l1884:	
;MS86F_PWM1_HALF.C: 96: P1BDTH = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(21)	;volatile
	line	97
	
l1886:	
;MS86F_PWM1_HALF.C: 97: P1BDTL = 200-5;
	movlw	(0C3h)
	movwf	(15)	;volatile
	line	101
	
l1888:	
;MS86F_PWM1_HALF.C: 101: P1OE = 0B01000000;
	movlw	(040h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(144)^080h	;volatile
	line	104
	
l1890:	
;MS86F_PWM1_HALF.C: 104: P1POL = 0B00000000;
	clrf	(153)^080h	;volatile
	line	105
;MS86F_PWM1_HALF.C: 105: P1CON = 0B00001000;
	movlw	(08h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(22)	;volatile
	line	106
	
l1892:	
;MS86F_PWM1_HALF.C: 106: TMR2H = 0;
	clrf	(19)	;volatile
	line	107
	
l1894:	
;MS86F_PWM1_HALF.C: 107: TMR2L = 0;
	clrf	(17)	;volatile
	line	108
	
l1896:	
;MS86F_PWM1_HALF.C: 108: TMR2IF = 0;
	bcf	(97/8),(97)&7
	line	109
	
l1898:	
;MS86F_PWM1_HALF.C: 109: TMR2ON = 1;
	bsf	(146/8),(146)&7
	line	110
;MS86F_PWM1_HALF.C: 110: while(TMR2IF==0) asm("clrwdt");
	goto	l794
	
l795:	
# 110 "MS86F_PWM1_HALF.C"
clrwdt ;#
psect	text77
	
l794:	
	bcf	status, 5	;RP0=0, select bank0
	btfss	(97/8),(97)&7
	goto	u11
	goto	u10
u11:
	goto	l795
u10:
	
l796:	
	line	111
;MS86F_PWM1_HALF.C: 111: TRISA &= 0B11101111;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(133)^080h+(4/8),(4)&7	;volatile
	line	113
	
l797:	
	return
	opt stack 0
GLOBAL	__end_of_PWM1_INIT
	__end_of_PWM1_INIT:
;; =============== function _PWM1_INIT ends ============

	signat	_PWM1_INIT,88
	global	_DEVICE_INIT
psect	text78,local,class=CODE,delta=2
global __ptext78
__ptext78:

;; *************** function _DEVICE_INIT *****************
;; Defined at:
;;		line 52 in file "MS86F_PWM1_HALF.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 17F/0
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0
;;      Params:         0       0
;;      Locals:         0       0
;;      Temps:          0       0
;;      Totals:         0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text78
	file	"MS86F_PWM1_HALF.C"
	line	52
	global	__size_of_DEVICE_INIT
	__size_of_DEVICE_INIT	equ	__end_of_DEVICE_INIT-_DEVICE_INIT
	
_DEVICE_INIT:	
	opt	stack 7
; Regs used in _DEVICE_INIT: [wreg+status,2]
	line	53
	
l1862:	
;MS86F_PWM1_HALF.C: 53: OSCCON = 0B01110001;
	movlw	(071h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(143)^080h	;volatile
	line	56
	
l1864:	
;MS86F_PWM1_HALF.C: 56: INTCON = 0B00000000;
	clrf	(11)	;volatile
	line	57
	
l1866:	
;MS86F_PWM1_HALF.C: 57: OPTION = 0B00001000;
	movlw	(08h)
	movwf	(129)^080h	;volatile
	line	59
	
l1868:	
;MS86F_PWM1_HALF.C: 59: PORTA = 0B00110000;
	movlw	(030h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(5)	;volatile
	line	60
	
l1870:	
;MS86F_PWM1_HALF.C: 60: TRISA = 0B11001011;
	movlw	(0CBh)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(133)^080h	;volatile
	line	61
	
l1872:	
;MS86F_PWM1_HALF.C: 61: WPUA = 0B11001011;
	movlw	(0CBh)
	movwf	(149)^080h	;volatile
	line	63
	
l1874:	
;MS86F_PWM1_HALF.C: 63: PORTC = 0B00000000;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(7)	;volatile
	line	64
;MS86F_PWM1_HALF.C: 64: TRISC = 0B11111111;
	movlw	(0FFh)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(135)^080h	;volatile
	line	65
;MS86F_PWM1_HALF.C: 65: WPUC = 0B11111111;
	movlw	(0FFh)
	movwf	(147)^080h	;volatile
	line	67
;MS86F_PWM1_HALF.C: 67: PSRCA = 0B11111111;
	movlw	(0FFh)
	movwf	(136)^080h	;volatile
	line	68
;MS86F_PWM1_HALF.C: 68: PSRCC = 0B11111111;
	movlw	(0FFh)
	movwf	(148)^080h	;volatile
	line	69
;MS86F_PWM1_HALF.C: 69: PSINKA = 0B11111111;
	movlw	(0FFh)
	movwf	(151)^080h	;volatile
	line	70
;MS86F_PWM1_HALF.C: 70: PSINKC = 0B11111111;
	movlw	(0FFh)
	movwf	(159)^080h	;volatile
	line	71
;MS86F_PWM1_HALF.C: 71: MSCON = 0B00110000;
	movlw	(030h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(27)	;volatile
	line	79
	
l791:	
	return
	opt stack 0
GLOBAL	__end_of_DEVICE_INIT
	__end_of_DEVICE_INIT:
;; =============== function _DEVICE_INIT ends ============

	signat	_DEVICE_INIT,88
psect	text79,local,class=CODE,delta=2
global __ptext79
__ptext79:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
