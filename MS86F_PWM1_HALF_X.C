/**********************************************************
*�ļ���:MS86F_PWM1_HALF.c
*����:MS86Fxx02��PWM1���Ż������������ʾ
*�����ͺ�:MS86F1602
*����:�ڲ�RC 16MHz 2T
*���Ŷ���:
*                 ----------------
*  VDD-----------|1(VDD)   (GND)16|------------GND
*  NC------------|2(RA7)   (PA0)15|-------------NC
*  NC------------|3(PA6)   (PA1)14|-------------NC
*  NC------------|4(PA5)   (PA2)13|-------------NC
*  NC------------|5(PA4)   (PA3)12|-------------NC
*  NC------------|6(PC5)   (PC0)11|----------P1A2N
*  NC------------|7(PC4)   (PC1)10|-----------P1A2
*  NC------------|8(PC3)   (PC2)09|-------------NC
*                 ----------------
*                 MS86F1602 SOP16
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

#if 0
#define PIN_LED0			RA0
#define PIN_BUZZER0 	RA1
#define PIN_LED1		 	RA4
#define PIN_BUZZER1 	RC5
#else
#define PIN_BUZZER0	RA2//RA0
#define PIN_BUZZER1 	RA5//RA1
#define PIN_LED0		 	RA4	//P1B
#define PIN_LED1		 	RC5	//P1A0
#endif

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
	PORTA = 0B00000000;
	TRISA = 0B11001011;		//PORTA������Ϊ����
	WPUA = 0B11001011;		//����PORTA���ڲ�����
	PORTC = 0B00000000;
	TRISC = 0B11011111;		//RC5Ϊ���,����PORTC��Ϊ����
	WPUC = 0B11011111;		//RC5����������,����PORTC�ڿ�������
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
void DEVICE_INIT2(void)
{
	OSCCON = 0B01110001;	//Bit7,LFMOD=0,WDT����Ƶ��=32KHz
							//Bit6:4,IRCF[2:0]=101,�ڲ�RCƵ��=4MHz
							//Bit0,SCS=1,ϵͳʱ��ѡ��Ϊ�ڲ�����
	INTCON = 0B00000000;	//�ݽ�ֹ�����ж�
	OPTION = 0B00001000;	//Bit4=1 WDT MODE,PS=000=1:1 WDT RATE
	PORTA = 0B00000000;
	TRISA = 0B11001011;		//RA2����Ϊ���,����PORTA������Ϊ����
	WPUA = 0B11001011;		//����RA2,�������ڲ�����
	PORTC = 0B00000000;
	TRISC = 0B11011111;		//PORTC������Ϊ����
	WPUC = 0B11011111;		//����PORTC����ڵ��ڲ�����
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
void PWM1_INIT(void)
{
    #if 0
	TRISC |= 0B00000011;		//�ر�RC0��RC1���,����Ϊ����
    #else
    TRISA |= 0B00010000;		//�ر�RA4���,����Ϊ����
    TRISC |= 0B00100000;		//�ر�RC5���,����Ϊ����
    #endif
	T2CON0 = 0B00000001;
	T2CON1 = 0B00000000;
	PR2H = 0;
	PR2L = 199;
	P1ADTH = 0;
	P1ADTL = 150;
    P1BDTH = 0;
	P1BDTL = 150;
	P1OE =		0B01000001;	//P1B P1A0
	P1POL =	0B00000000;
	P1CON =	0B00001000;
	TMR2H =	0;
	TMR2L =	0;
	TMR2IF =	0;						//��Timer2ƥ���־λ
	TMR2ON = 1;					//����Timer2
	while(TMR2IF==0) CLRWDT();	//�ȴ�һ���µ�TMR2��������
    #if 0
	TRISC &= 0B11111100;		//�µ�һ��TMR2��������,����RC0��RC1���
    #else
    TRISA &= 0B11101111;		//�ر�RA4���,����Ϊ����
    TRISC &= 0B11011111;		//�ر�RC5���,����Ϊ����
    #endif
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
*������:interrupt ISR
*����:�жϷ�����
*�������:��
*���ز���:��
====================================================*/
volatile unsigned short T0_seconds=0;
volatile unsigned char T0_cnt=0;
volatile  unsigned char brightness=0;
volatile  char delay=0;
volatile  char dir=1;
volatile  char LED_SPEED=8;
#define BRIGHTNESS_MAX	120
#define BRIGHTNESS_MIN		4
void interrupt ISR(void)
{
	if(T0IE&&T0IF)
	{
		T0IF = 0;
		TMR0 = 6;
        T0_cnt++;
        if(T0_cnt>=125)
        {
            if(T0_seconds)T0_seconds--;
            T0_cnt=0;
        }
        
		delay++;
        if(delay>LED_SPEED)
        {
            delay=0;
           
            if(dir) 
            {            
                if(brightness<BRIGHTNESS_MAX)brightness++;
                else  dir=0;
			}
            else
            {
                if(brightness>0)brightness--;
                else  dir=1;
            }
            		
            if(brightness<(BRIGHTNESS_MAX/6))LED_SPEED=10;
            else if(brightness<(BRIGHTNESS_MAX/4))LED_SPEED=5;
            else if(brightness<(BRIGHTNESS_MAX/2))LED_SPEED=3;
            else LED_SPEED=1;

            if(brightness<BRIGHTNESS_MIN)P1ADTL = P1BDTL = BRIGHTNESS_MIN;
            else P1ADTL = P1BDTL = brightness;
            
            
        }
	}
}

/*====================================================
*������:TIMER0_INIT
*����:Timer0��ʼ��
*�������:��
*���ز���:��
====================================================*/
void TIMER0_INIT(void)
{
	T0CON0 = 0B00000000;
	OPTION = 0B00000111;           //Bit4=0 TIMER0 MODE,PS=011=1:256 TIMER0 RATE
													
}

/*====================================================
*������:ENABLE_INTERRUPT
*����:���������ж�
*�������:��
*���ز���:��
====================================================*/
void ENABLE_INTERRUPT(void)
{
	T0IF = 0;                       //��TIMER0�жϱ�־λ
	T0IE = 1;                       //ʹ��TIMER0�ж�
	T0ON = 1;						//����Timer0
	GIE = 1;                        //�������ж�
}
/*====================================================
*��������:DELAY_1MS
*����:����ʱ����(4MHz2T)
*�������:Time��ʱʱ�䳤��,��ʱʱ��Time1Ms
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

void DELAY_1US(void)
{
	//CLRWDT();
	//CLRWDT();
	//CLRWDT();
	//CLRWDT();
    CLRWDT();
	CLRWDT();
	CLRWDT();
	CLRWDT();
}

/*====================================================
*��������:DELAY_MS
*����:����ʱ����
*�������:Time��ʱʱ�䳤��,��ʱʱ��Time ms
*���ز���:�� 
====================================================*/
void DELAY_MS(unsigned short Time)
{
	unsigned short a;
    
	Time<<=3;

	for(a=0;a<Time;a++)
	{
		DELAY_125US();
	}
}

void DELAY_US(unsigned short Time)
{
    Time>>=2;
	while(Time--)
    {
        CLRWDT();
		CLRWDT();
		CLRWDT();
		CLRWDT();
		CLRWDT();
		CLRWDT();
		CLRWDT();
		CLRWDT();
		CLRWDT();
		CLRWDT();
		CLRWDT();
		CLRWDT();
		CLRWDT();
		CLRWDT();
		CLRWDT();
		CLRWDT();
        CLRWDT();
        CLRWDT();
    }
}
/*====================================================
*������:main
*����:������
*�������:��
*���ز���:��
====================================================*/
#define STEP_TIME 30
#define VOLUME_LOW 5
#define VOLUME_HIGH 10
void main(void)
{
    char i;
    volatile unsigned short volume=0;
    
	DEVICE_INIT();	   //������ʼ��
	PWM1_INIT();
    TIMER0_INIT();
    ENABLE_INTERRUPT();
               
	while(1)
	{
        if(volume==VOLUME_LOW)volume=VOLUME_HIGH;
        else volume=VOLUME_LOW;
        
        //25Hz
        T0_seconds= STEP_TIME;
        while(T0_seconds>0)
        {
            PIN_BUZZER0=PIN_BUZZER1=1;
            DELAY_US(volume);
			PIN_BUZZER0=PIN_BUZZER1=0;
            DELAY_MS(39);
            DELAY_US(920);
        }
        
		//35Hz
        T0_seconds= STEP_TIME;
        while(T0_seconds>0)
        {
            PIN_BUZZER0=PIN_BUZZER1=1;
            DELAY_US(volume);
            PIN_BUZZER0=PIN_BUZZER1=0;
            DELAY_MS(28);
            DELAY_US(500);
        }
        
		//45Hz
        T0_seconds= STEP_TIME;
        while(T0_seconds>0)
        {
            PIN_BUZZER0=PIN_BUZZER1=1;
            DELAY_US(volume);
            PIN_BUZZER0=PIN_BUZZER1=0;
            DELAY_MS(22);
            DELAY_US(220);
        }
        
		//55Hz
        T0_seconds= STEP_TIME;
        while(T0_seconds>0)
        {
            PIN_BUZZER0=PIN_BUZZER1=1;
            DELAY_US(volume);
            PIN_BUZZER0=PIN_BUZZER1=0;
            DELAY_MS(18);
            DELAY_US(100);
        }
        
		//65Hz
        T0_seconds= STEP_TIME;
        while(T0_seconds>0)
        {
            PIN_BUZZER0=PIN_BUZZER1=1;
            DELAY_US(volume);
            PIN_BUZZER0=PIN_BUZZER1=0;
            DELAY_MS(15);
            DELAY_US(300);
        }
        
		//85Hz
        T0_seconds= STEP_TIME;
        while(T0_seconds>0)
        {
            PIN_BUZZER0=PIN_BUZZER1=1;
            DELAY_US(volume);
            PIN_BUZZER0=PIN_BUZZER1=0;
            DELAY_MS(11);
            DELAY_US(700);
        }
  #if 0      
        //400Hz
        T0_seconds= STEP_TIME;
        while(T0_seconds>0)
        {
            PIN_BUZZER0=0;
            PIN_BUZZER1=0;
            DELAY_US(80);
            PIN_BUZZER0=1;
            PIN_BUZZER1=1;
            DELAY_US(2420);
        }
        
		//1000Hz
        T0_seconds= STEP_TIME;
        while(T0_seconds>0)
        {
            PIN_BUZZER0=0;
            PIN_BUZZER1=0;
            DELAY_US(80);
            PIN_BUZZER0=1;
            PIN_BUZZER1=1;
            DELAY_US(920);
        }
        
		//5KHz
        T0_seconds= STEP_TIME;
        while(T0_seconds>0)
        {
            PIN_BUZZER0=0;
            PIN_BUZZER1=0;
            DELAY_US(80);
            PIN_BUZZER0=0;
            PIN_BUZZER1=0;
            DELAY_US(120);
        }
        
		//20KHz
        T0_seconds= STEP_TIME;
        while(T0_seconds>0)
        {
            PIN_BUZZER0=1;
            PIN_BUZZER1=1;
            DELAY_US(20);
            DELAY_1US();
            PIN_BUZZER0=0;
            PIN_BUZZER1=0;
            DELAY_US(20);
            DELAY_1US();
        }
 #endif   
 
		for(i=0;i<3;i++)
        {
			//25KHz
			T0_seconds= 2;
			while(T0_seconds>0)
			{
				PIN_BUZZER0=PIN_BUZZER1=1;
				DELAY_US(8);
				CLRWDT();
				PIN_BUZZER0=0;
				PIN_BUZZER1=0;
				DELAY_US(32);
				CLRWDT();
			}
			
			//40KHz
			T0_seconds= 2;
			while(T0_seconds>0)
			{
				PIN_BUZZER0=PIN_BUZZER1=1;
				DELAY_US(8);
				CLRWDT();
				PIN_BUZZER0=0;
				PIN_BUZZER1=0;
				DELAY_US(17);
				CLRWDT();
			}
			
			//60KHz
			T0_seconds= 2;
			while(T0_seconds>0)
			{
				PIN_BUZZER0=1;
				PIN_BUZZER1=1;
				DELAY_US(4);
				DELAY_1US();
				DELAY_1US();
				PIN_BUZZER0=0;
				PIN_BUZZER1=0;
				DELAY_US(4);
				DELAY_1US();
				CLRWDT();
				CLRWDT();
				CLRWDT();
				CLRWDT();
			}
				
			//80KHz
			T0_seconds= 2;
			while(T0_seconds>0)
			{
				PIN_BUZZER0=1;
				PIN_BUZZER1=1;
				DELAY_1US();
				DELAY_1US();
				DELAY_1US();
				DELAY_1US();
				DELAY_1US();
				PIN_BUZZER0=0;
				PIN_BUZZER1=0;
				DELAY_1US();
				DELAY_1US();
				DELAY_1US();
				DELAY_1US();
				DELAY_1US();
				
				CLRWDT();
				CLRWDT();
				CLRWDT();
				CLRWDT();
			}
			
			//100KHz
			T0_seconds= 2;
			while(T0_seconds>0)
			{
				PIN_BUZZER0=1;
				PIN_BUZZER1=1;
				DELAY_1US();
				DELAY_1US();
				DELAY_1US();
				DELAY_1US();
				CLRWDT();
				CLRWDT();
				PIN_BUZZER0=0;
				PIN_BUZZER1=0;
				DELAY_1US();
				DELAY_1US();
				DELAY_1US();
				DELAY_1US();
				CLRWDT();
				CLRWDT();
				CLRWDT();
				CLRWDT();
			}
			
			//120KHz
			T0_seconds= 2;
			while(T0_seconds>0)
			{
				PIN_BUZZER0=1;
				PIN_BUZZER1=1;
				//DELAY_1US();
				DELAY_1US();
				DELAY_1US();
				DELAY_1US();
				PIN_BUZZER0=0;
				PIN_BUZZER1=0;
				DELAY_1US();
				DELAY_1US();
				DELAY_1US();
				DELAY_1US();
			}
        }
	}
}
