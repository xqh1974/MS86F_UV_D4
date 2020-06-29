//Deviec:MS86Fxx01
//-----------------------Variable---------------------------------
		_working_timer		EQU		75H
		_minute_cnt		EQU		77H
		_brigtness		EQU		78H
//-----------------------Variable END---------------------------------
		ORG		0000H
		LJUMP 	35FH 			//0000 	3B5F
		ORG		0348H
		LDWI 	5H 			//0348 	2A05

		//;MS86F_PWM1_HALF.C: 167: RA2=0;
		BCR 	STATUS,5 		//0349 	1283
		BCR 	5H,2 			//034A 	1105

		//;MS86F_PWM1_HALF.C: 168: RA5=0;
		BCR 	5H,5 			//034B 	1285

		//;MS86F_PWM1_HALF.C: 169: brigtness=5;
		STR 	78H 			//034C 	01F8
		CLRR 	79H 			//034D 	0179

		//;MS86F_PWM1_HALF.C: 170: PWM1_INIT();
		LJUMP 	39AH 			//034E 	3B9A

		//;MS86F_PWM1_HALF.C: 146: unsigned char a;
		//;MS86F_PWM1_HALF.C: 148: for(a=0;a<125;a++)
		CLRR 	70H 			//034F 	0170
		ORG		0350H
		CLRWDT	 			//0350 	0001
		LDWI 	7DH 			//0351 	2A7D
		INCR	70H,1 			//0352 	09F0
		SUBWR 	70H,0 			//0353 	0C70
		BTSC 	STATUS,0 		//0354 	1403
		RET		 					//0355 	0004
		LJUMP 	350H 			//0356 	3B50

		//;MS86F_PWM1_HALF.C: 174: P1OE=0;
		BSR 	STATUS,5 		//0357 	1A83
		ORG		0358H
		CLRR 	10H 			//0358 	0110

		//;MS86F_PWM1_HALF.C: 175: RA2=1;
		BCR 	STATUS,5 		//0359 	1283
		BSR 	5H,2 			//035A 	1905

		//;MS86F_PWM1_HALF.C: 176: RA5=1;
		BSR 	5H,5 			//035B 	1A85

		//;MS86F_PWM1_HALF.C: 177: P1BALT=0;
		BCR 	19H,2 			//035C 	1119

		//;MS86F_PWM1_HALF.C: 178: RA4=1;
		BSR 	5H,4 			//035D 	1A05
		RET		 					//035E 	0004
		LDWI 	5H 			//035F 	2A05
		ORG		0360H
		CLRR 	75H 			//0360 	0175
		CLRR 	76H 			//0361 	0176
		CLRR 	77H 			//0362 	0177
		STR 	78H 			//0363 	01F8
		CLRR 	79H 			//0364 	0179
		CLRR 	STATUS 			//0365 	0103
		LJUMP 	3BBH 			//0366 	3BBB

		//;MS86F_PWM1_HALF.C: 155: unsigned short a;
		//;MS86F_PWM1_HALF.C: 157: Time<<=3;
		BCR 	STATUS,0 		//0367 	1003
		ORG		0368H
		RLR 	71H,1 			//0368 	05F1
		RLR 	72H,1 			//0369 	05F2
		BCR 	STATUS,0 		//036A 	1003
		RLR 	71H,1 			//036B 	05F1
		RLR 	72H,1 			//036C 	05F2
		BCR 	STATUS,0 		//036D 	1003
		RLR 	71H,1 			//036E 	05F1
		RLR 	72H,1 			//036F 	05F2
		ORG		0370H

		//;MS86F_PWM1_HALF.C: 159: for(a=0;a<Time;a++)
		CLRR 	73H 			//0370 	0173
		CLRR 	74H 			//0371 	0174
		LDR 	72H,0 			//0372 	0872
		SUBWR 	74H,0 			//0373 	0C74
		BTSS 	STATUS,2 		//0374 	1D03
		LJUMP 	378H 			//0375 	3B78
		LDR 	71H,0 			//0376 	0871
		SUBWR 	73H,0 			//0377 	0C73
		ORG		0378H
		BTSC 	STATUS,0 		//0378 	1403
		RET		 					//0379 	0004

		//;MS86F_PWM1_HALF.C: 160: {
		//;MS86F_PWM1_HALF.C: 161: DELAY_125US();
		LCALL 	34FH 			//037A 	334F
		INCR	73H,1 			//037B 	09F3
		BTSC 	STATUS,2 		//037C 	1503
		INCR	74H,1 			//037D 	09F4
		LJUMP 	372H 			//037E 	3B72

		//;MS86F_PWM1_HALF.C: 53: OSCCON = 0B01110001;
		LDWI 	71H 			//037F 	2A71
		ORG		0380H
		BSR 	STATUS,5 		//0380 	1A83
		STR 	FH 			//0381 	018F

		//;MS86F_PWM1_HALF.C: 56: INTCON = 0B00000000;
		CLRR 	INTCON 			//0382 	010B

		//;MS86F_PWM1_HALF.C: 57: OPTION = 0B00001000;
		LDWI 	8H 			//0383 	2A08
		STR 	1H 			//0384 	0181

		//;MS86F_PWM1_HALF.C: 59: PORTA = 0B00110000;
		LDWI 	30H 			//0385 	2A30
		BCR 	STATUS,5 		//0386 	1283
		STR 	5H 			//0387 	0185
		ORG		0388H

		//;MS86F_PWM1_HALF.C: 60: TRISA = 0B11001011;
		LDWI 	CBH 			//0388 	2ACB
		BSR 	STATUS,5 		//0389 	1A83
		STR 	5H 			//038A 	0185

		//;MS86F_PWM1_HALF.C: 61: WPUA = 0B11001011;
		STR 	15H 			//038B 	0195

		//;MS86F_PWM1_HALF.C: 63: PORTC = 0B00000000;
		BCR 	STATUS,5 		//038C 	1283
		CLRR 	7H 			//038D 	0107

		//;MS86F_PWM1_HALF.C: 64: TRISC = 0B11111111;
		LDWI 	FFH 			//038E 	2AFF
		BSR 	STATUS,5 		//038F 	1A83
		ORG		0390H
		STR 	7H 			//0390 	0187

		//;MS86F_PWM1_HALF.C: 65: WPUC = 0B11111111;
		STR 	13H 			//0391 	0193

		//;MS86F_PWM1_HALF.C: 67: PSRCA = 0B11111111;
		STR 	8H 			//0392 	0188

		//;MS86F_PWM1_HALF.C: 68: PSRCC = 0B11111111;
		STR 	14H 			//0393 	0194

		//;MS86F_PWM1_HALF.C: 69: PSINKA = 0B11111111;
		STR 	17H 			//0394 	0197

		//;MS86F_PWM1_HALF.C: 70: PSINKC = 0B11111111;
		STR 	1FH 			//0395 	019F

		//;MS86F_PWM1_HALF.C: 71: MSCON = 0B00110000;
		LDWI 	30H 			//0396 	2A30
		BCR 	STATUS,5 		//0397 	1283
		ORG		0398H
		STR 	1BH 			//0398 	019B
		RET		 					//0399 	0004

		//;MS86F_PWM1_HALF.C: 88: TRISA |= 0B00010000;
		BSR 	STATUS,5 		//039A 	1A83
		BSR 	5H,4 			//039B 	1A05

		//;MS86F_PWM1_HALF.C: 91: T2CON0 = 0B00000001;
		LDWI 	1H 			//039C 	2A01
		BCR 	STATUS,5 		//039D 	1283
		STR 	12H 			//039E 	0192

		//;MS86F_PWM1_HALF.C: 92: T2CON1 = 0B00000000;
		BSR 	STATUS,5 		//039F 	1A83
		ORG		03A0H
		CLRR 	1EH 			//03A0 	011E

		//;MS86F_PWM1_HALF.C: 93: PR2H = 0;
		CLRR 	12H 			//03A1 	0112

		//;MS86F_PWM1_HALF.C: 94: PR2L = 200-1;
		LDWI 	C7H 			//03A2 	2AC7
		STR 	11H 			//03A3 	0191

		//;MS86F_PWM1_HALF.C: 96: P1BDTH = 0;
		BCR 	STATUS,5 		//03A4 	1283
		CLRR 	15H 			//03A5 	0115

		//;MS86F_PWM1_HALF.C: 97: P1BDTL = 200-5;
		LDWI 	C3H 			//03A6 	2AC3
		STR 	FH 			//03A7 	018F
		ORG		03A8H

		//;MS86F_PWM1_HALF.C: 101: P1OE = 0B01000000;
		LDWI 	40H 			//03A8 	2A40
		BSR 	STATUS,5 		//03A9 	1A83
		STR 	10H 			//03AA 	0190

		//;MS86F_PWM1_HALF.C: 104: P1POL = 0B00000000;
		CLRR 	19H 			//03AB 	0119

		//;MS86F_PWM1_HALF.C: 105: P1CON = 0B00001000;
		LDWI 	8H 			//03AC 	2A08
		BCR 	STATUS,5 		//03AD 	1283
		STR 	16H 			//03AE 	0196

		//;MS86F_PWM1_HALF.C: 106: TMR2H = 0;
		CLRR 	13H 			//03AF 	0113
		ORG		03B0H

		//;MS86F_PWM1_HALF.C: 107: TMR2L = 0;
		CLRR 	11H 			//03B0 	0111

		//;MS86F_PWM1_HALF.C: 108: TMR2IF = 0;
		BCR 	CH,1 			//03B1 	108C

		//;MS86F_PWM1_HALF.C: 109: TMR2ON = 1;
		BSR 	12H,2 			//03B2 	1912

		//;MS86F_PWM1_HALF.C: 110: while(TMR2IF==0) asm("clrwdt");
		BCR 	STATUS,5 		//03B3 	1283
		BTSC 	CH,1 			//03B4 	148C
		LJUMP 	3B8H 			//03B5 	3BB8
		CLRWDT	 			//03B6 	0001
		LJUMP 	3B3H 			//03B7 	3BB3
		ORG		03B8H

		//;MS86F_PWM1_HALF.C: 111: TRISA &= 0B11101111;
		BSR 	STATUS,5 		//03B8 	1A83
		BCR 	5H,4 			//03B9 	1205
		RET		 					//03BA 	0004

		//;MS86F_PWM1_HALF.C: 188: DEVICE_INIT();
		LCALL 	37FH 			//03BB 	337F

		//;MS86F_PWM1_HALF.C: 189: PWM1_INIT();
		LCALL 	39AH 			//03BC 	339A

		//;MS86F_PWM1_HALF.C: 191: working_timer=0;
		CLRR 	75H 			//03BD 	0175
		CLRR 	76H 			//03BE 	0176

		//;MS86F_PWM1_HALF.C: 192: minute_cnt=0;
		CLRR 	77H 			//03BF 	0177
		ORG		03C0H

		//;MS86F_PWM1_HALF.C: 193: brigtness=0;
		CLRR 	78H 			//03C0 	0178
		CLRR 	79H 			//03C1 	0179

		//;MS86F_PWM1_HALF.C: 194: SetWorking();
		LCALL 	348H 			//03C2 	3348

		//;MS86F_PWM1_HALF.C: 196: {
		//;MS86F_PWM1_HALF.C: 197: if(minute_cnt<10)
		LDWI 	AH 			//03C3 	2A0A
		SUBWR 	77H,0 			//03C4 	0C77
		BTSC 	STATUS,0 		//03C5 	1403
		LJUMP 	3E4H 			//03C6 	3BE4

		//;MS86F_PWM1_HALF.C: 198: {
		//;MS86F_PWM1_HALF.C: 199: brigtness++;
		INCR	78H,1 			//03C7 	09F8
		ORG		03C8H
		BTSC 	STATUS,2 		//03C8 	1503
		INCR	79H,1 			//03C9 	09F9

		//;MS86F_PWM1_HALF.C: 200: if(brigtness<=200)P1BDTL=(unsigned char)(200-brigtness);
		LDWI 	0H 			//03CA 	2A00
		SUBWR 	79H,0 			//03CB 	0C79
		LDWI 	C9H 			//03CC 	2AC9
		BTSC 	STATUS,2 		//03CD 	1503
		SUBWR 	78H,0 			//03CE 	0C78
		BTSC 	STATUS,0 		//03CF 	1403
		ORG		03D0H
		LJUMP 	3D4H 			//03D0 	3BD4
		LDR 	78H,0 			//03D1 	0878
		SUBWI 	C8H 			//03D2 	28C8
		LJUMP 	3DDH 			//03D3 	3BDD

		//;MS86F_PWM1_HALF.C: 201: else if(brigtness<(200*2))P1BDTL=(unsigned char)(brigtness-200);
		LDWI 	1H 			//03D4 	2A01
		SUBWR 	79H,0 			//03D5 	0C79
		LDWI 	90H 			//03D6 	2A90
		BTSC 	STATUS,2 		//03D7 	1503
		ORG		03D8H
		SUBWR 	78H,0 			//03D8 	0C78
		BTSC 	STATUS,0 		//03D9 	1403
		LJUMP 	3E0H 			//03DA 	3BE0
		LDR 	78H,0 			//03DB 	0878
		ADDWI 	38H 			//03DC 	2738
		BCR 	STATUS,5 		//03DD 	1283
		STR 	FH 			//03DE 	018F
		LJUMP 	3EEH 			//03DF 	3BEE
		ORG		03E0H

		//;MS86F_PWM1_HALF.C: 202: else brigtness=5;
		LDWI 	5H 			//03E0 	2A05
		STR 	78H 			//03E1 	01F8
		CLRR 	79H 			//03E2 	0179
		LJUMP 	3EEH 			//03E3 	3BEE

		//;MS86F_PWM1_HALF.C: 204: else if(minute_cnt<(10+20))
		LDWI 	1EH 			//03E4 	2A1E
		SUBWR 	77H,0 			//03E5 	0C77
		BTSC 	STATUS,0 		//03E6 	1403
		LJUMP 	3EAH 			//03E7 	3BEA
		ORG		03E8H

		//;MS86F_PWM1_HALF.C: 205: {
		//;MS86F_PWM1_HALF.C: 206: SetSleep();
		LCALL 	357H 			//03E8 	3357

		//;MS86F_PWM1_HALF.C: 207: }
		LJUMP 	3EEH 			//03E9 	3BEE

		//;MS86F_PWM1_HALF.C: 208: else
		//;MS86F_PWM1_HALF.C: 209: {
		//;MS86F_PWM1_HALF.C: 210: SetWorking();
		LCALL 	348H 			//03EA 	3348

		//;MS86F_PWM1_HALF.C: 211: working_timer=0;
		CLRR 	75H 			//03EB 	0175
		CLRR 	76H 			//03EC 	0176

		//;MS86F_PWM1_HALF.C: 212: minute_cnt=0;
		CLRR 	77H 			//03ED 	0177

		//;MS86F_PWM1_HALF.C: 213: }
		//;MS86F_PWM1_HALF.C: 215: working_timer++;
		INCR	75H,1 			//03EE 	09F5
		BTSC 	STATUS,2 		//03EF 	1503
		ORG		03F0H
		INCR	76H,1 			//03F0 	09F6

		//;MS86F_PWM1_HALF.C: 216: if(working_timer>=(100*59))
		LDWI 	17H 			//03F1 	2A17
		SUBWR 	76H,0 			//03F2 	0C76
		LDWI 	CH 			//03F3 	2A0C
		BTSC 	STATUS,2 		//03F4 	1503
		SUBWR 	75H,0 			//03F5 	0C75
		BTSS 	STATUS,0 		//03F6 	1C03
		LJUMP 	3FBH 			//03F7 	3BFB
		ORG		03F8H

		//;MS86F_PWM1_HALF.C: 217: {
		//;MS86F_PWM1_HALF.C: 218: minute_cnt++;
		INCR	77H,1 			//03F8 	09F7

		//;MS86F_PWM1_HALF.C: 219: working_timer=0;
		CLRR 	75H 			//03F9 	0175
		CLRR 	76H 			//03FA 	0176

		//;MS86F_PWM1_HALF.C: 220: }
		//;MS86F_PWM1_HALF.C: 221: DELAY_MS(10);
		LDWI 	AH 			//03FB 	2A0A
		STR 	71H 			//03FC 	01F1
		CLRR 	72H 			//03FD 	0172
		LCALL 	367H 			//03FE 	3367
		LJUMP 	3C3H 			//03FF 	3BC3
			END
