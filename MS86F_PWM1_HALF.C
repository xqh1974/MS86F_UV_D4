/**********************************************************
*�ļ���:MS86F_PWM1_HALF.c
*����:MS86Fxx02��PWM1���Ż������������ʾ
*�����ͺ�:MS86F1602
*����:�ڲ�RC 16MHz 2T
*���Ŷ���:
*                 ----------------
*  VDD			|1(VDD)			(GND)				8|------------GND
*  O3			|2(RA5)			(PA0/ICSPCLK)	7|-------------NC
*  LED			|3(P1B/PA4)		(PA1/ICSPDAT)	6|-------------NC
*  NC			|4(P1A0/PC5)	(PA2/INT/P1C)	5|-------------UV
*  
*                 ----------------
*                 MS86F0801 SOP8
*˵��:������������PWM1ģ�����һ������������,����Ϊ10KHz,
*     ռ�ձ�Ϊ75%PWM.
*ע��:1.PWM1ģ��������3·ͬ����,��ͬռ�ձȵ�PWM,��P1A��P1B��P1C
*     2.��3·PWM�������������ÿ������߲�����.������û�п���P1B��
*       P1C,��������P1A
*     3.ÿһ·PWM����ӳ�䵽ĳ�������ŵĹ���,�ҿ�������������ӳ��.
*       ����P1B����ӳ�䵽PA4�Ż���PA5��;�ֱ���P1A����ӳ�䵽PC5��
*       PC3��PC1.
*     4.P1A�ǿ��������һ·��P1A������PWM,���ǳ�֮Ϊ:P1AN,������
*       ����ͼ����:P1A0N��P1A1N��P1A2N.��������������PWMҲ�Ǹ�
*       P1Aһ������ӳ�䵽ĳ�����ܽ���(PC4��PC2��PC0)
*     5.P1A�ĸ�·�����߼�����:
*       a.P1A0=P1A1=P1A2,P1A0N=P1A2N=P1A2N
*       b.P1A0��P1A0N����
**********************************************************/
#include "SYSCFG.h";
#include "MS86Fxx01.h";

#define PIN_O3_EN	 			RA5
#define PIN_LED_BLUE		 	RA4//P1B	//
#define PIN_LED_UV				RA2

#define BRIGHTNESS_MIN 5
#define BRIGHTNESS_MAX 200
#define WORING_TIME 10//25
#define SLEEP_TIME 20//10
#define MINUTE_TIME (100*59)
unsigned short working_timer=0;
unsigned char minute_cnt=0;
unsigned short brigtness = BRIGHTNESS_MIN;
/*====================================================
*������:DEVICE_INIT
*����:�ϵ�������ʼ��
*�������:��
*���ز���:��
====================================================*/
void DEVICE_INIT(void)
{
	OSCCON = 0B01110001;	//Bit7,LFMOD=0,WDT����Ƶ��=32KHz
							//Bit6:4,IRCF[2:0]=101,�ڲ�RCƵ��=4MHz
							//Bit0,SCS=1,ϵͳʱ��ѡ��Ϊ�ڲ�����
	INTCON = 0B00000000;	//�ݽ�ֹ�����ж�
	OPTION = 0B00001000;	//Bit4=1 WDT MODE,PS=000=1:1 WDT RATE
    
	PORTA = 0B00110000;
	TRISA  = 0B11001011;		//PORTA��RA5,RA4,RA2Ϊ��������PORTA��Ϊ����
    WPUA  = 0B11001011;		//����PORTA���ڲ�����
    
	PORTC = 0B00000000;
	TRISC = 0B11111111;		//PORTC��Ϊ����
	WPUC = 0B11111111;		//PORTC�ڿ�������
    
    PSRCA  = 0B11111111;	//Դ�����������
    PSRCC  = 0B11111111;
    PSINKA = 0B11111111;	//������������
    PSINKC = 0B11111111;
    MSCON  = 0B00110000;
    
    //BIT5:PSRCAH4��PSRCA[4]��ͬ����Դ����.00:4mA; 11:33mA; 01��10:8mA
    //BIT4:PSRCAH3��PSRCA[3]��ͬ����Դ����.00:4mA; 11:33mA; 01��10:8mA
    //BIT3:UCFG1<1:0>Ϊ01ʱ��λ������.0:��ֹLVR; 1:��LVR
    //BIT2:��ʱ�Ӳ��������ڵ�ƽ��ģʽ.0:�ر�ƽ��ģʽ; 1:��ƽ��ģʽ
    //BIT1:0:�رտ�ʱ�Ӳ���������:1:�򿪿�ʱ�Ӳ���������
    //BIT0:0:˯��ʱֹͣ����:1:˯��ʱ���ֹ���.��T2ʱ�Ӳ���ѡ��ָ��ʱ�ӵ�ʱ��
}
/*====================================================
*������:PWM1_INIT
*����:�ϵ�������ʼ��
*�������:��
*���ز���:��
====================================================*/
void PWM1_INIT( )
{
    TRISA |= 0B00010000;		//�ر�RA4���,����Ϊ����
    //TRISC |= 0B00100000;		//�ر�RC5���,����Ϊ����

	T2CON0 = 0B00000001;
	T2CON1 = 0B00000000;
	PR2H = 0;
	PR2L = BRIGHTNESS_MAX-1;
	
    P1BDTH = 0;
	P1BDTL = BRIGHTNESS_MAX-BRIGHTNESS_MIN;
    //P1ADTH = 0;
	//P1ADTL = 150;
    
	P1OE  =	0B01000000;	//P1B
  	//P1OE |=   0B00000001;	//P1A0
    
	P1POL =	0B00000000;
	P1CON =	0B00001000;
	TMR2H =	0;
	TMR2L =	0;
	TMR2IF =	0;						//��Timer2ƥ���־λ
	TMR2ON = 1;					//����Timer2
	while(TMR2IF==0) CLRWDT();	//�ȴ�һ���µ�TMR2��������
    TRISA &= 0B11101111;		//�ر�RA4���,����Ϊ����
    //TRISC &= 0B11011111;		//�ر�RC5���,����Ϊ����
}
/******PWM1�������PWM����˵��******
A.����=(PR2+1)*Tt2ck*TMR2Ԥ��Ƶ��
  1.(PR2+1)=((PR2H:PR2L)+1)=199+1=200
  2.����Timer2ʱ��Դʱ��(Tt2ck)=(1/ʱ��ԴƵ��)*��������=(1/16MHz)*2T=0.125us
  3.TMR2Ԥ��Ƶ����T2CON0��bit1��bit0����,��������1:4
  4.�������=200*0.125us*4=100us,���Ƶ��=1/����=10KHz
B.ռ�ձ�=P1ADT/(PR2+1)
  1.P1ADT=(P1ADTH:P1ADTL)=150
  2.(PR2+1)��ǰ���������200
  3.���ռ�ձ�=150/200=75%
C.PWM1����˵��
  1.P1OE�Ǿ�����·PWM�Ƿ�Ҫ����ļĴ���,������BIT5��BIT4����1,Ҳ����ʹ��
    ��P1A2��P1A2N���;
  2.P1POL�����ø�·PWM�ĵ�ƽ��Ч���,Ҳ����PWM�ļ���
  3.P1CON�ڴ�����������������,bit7�ٴ�������Ч,��Ϊ���õ�����ɲ������
    ����ʱ��=Tt2ck*P1DC[6:0]=0.125us*0b0001000=1us
D.Tt2ck(��Timer2ʱ������)��ֵ,��T2CON2��[bit2:bit0]����
  1.=000,ָ��ʱ��=������ָ������=(1/ϵͳƵ��)*��������
  2.=001,ϵͳʱ��=(1/ϵͳƵ��)
  3.=010,HIRC��2��Ƶ.���ﲻ֧�ָ���ʱ��2��Ƶ
  4.=100,HIRC=(1/16MHz)=0.0625us
  5.=100,LIRC=(1/32KHz)=31.25us
******PWM1�������PWM����˵��******/

/*====================================================
*��������:DELAY_MS
*����:����ʱ����
*�������:Time��ʱʱ�䳤��,��ʱʱ��Time ms
*���ز���:�� 
====================================================*/
void DELAY_125US(void)
{
	unsigned char a;

	for(a=0;a<125;a++)
	{
		CLRWDT();
	}
}
void DELAY_MS(unsigned short Time)
{
	unsigned short a;
    
	Time<<=3;

	for(a=0;a<Time;a++)
	{
		DELAY_125US();
	}
}

void SetWorking(void)
{  
	PIN_LED_UV=0;
    PIN_O3_EN=0;//PIN_O3_EN=1;
    brigtness=BRIGHTNESS_MIN;
	PWM1_INIT();
}
void SetSleep(void)
{
    P1OE=0;
	PIN_LED_UV=1;
    PIN_O3_EN=1;//PIN_O3_EN=0;
    P1BALT=0;
	PIN_LED_BLUE=1;
}
/*====================================================
*������:main
*����:������
*�������:��
*���ز���:��
====================================================*/
void main(void)
{ 
	DEVICE_INIT();	   //������ʼ��
	PWM1_INIT(); 
          
    working_timer=0;   
    minute_cnt=0;
    brigtness=0;      
    SetWorking(); 
	while(1)
	{
		if(minute_cnt<WORING_TIME)
		{          
			brigtness++;
            if(brigtness<=BRIGHTNESS_MAX)P1BDTL=(unsigned char)(BRIGHTNESS_MAX-brigtness);
            else if(brigtness<(BRIGHTNESS_MAX*2))P1BDTL=(unsigned char)(brigtness-BRIGHTNESS_MAX);
            else brigtness=BRIGHTNESS_MIN;
		}
		else if(minute_cnt<(WORING_TIME+SLEEP_TIME))
        {
            SetSleep();
        }
        else
        {
            SetWorking();
            working_timer=0;
            minute_cnt=0;
        }
        
        working_timer++;     
        if(working_timer>=MINUTE_TIME) 
        {
            minute_cnt++;
            working_timer=0;
        }
		DELAY_MS(10);
    }
}
