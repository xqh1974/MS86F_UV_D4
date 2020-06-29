/**********************************************************
*文件名:MS86F_PWM1_HALF.c
*功能:MS86Fxx02的PWM1半桥互补输出功能演示
*器件型号:MS86F1602
*振荡器:内部RC 16MHz 2T
*引脚定义:
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
*说明:该例程是设置PWM1模块输出一个互补带死区,周期为10KHz,
*     占空比为75%PWM.
*注意:1.PWM1模块可以输出3路同周期,不同占空比的PWM,即P1A、P1B和P1C
*     2.这3路PWM可以有软件设置开启或者不开启.该例程没有开启P1B和
*       P1C,仅开启了P1A
*     3.每一路PWM都有映射到某几个引脚的功能,且可以由软件设置映射.
*       比如P1B可以映射到PA4脚或者PA5脚;又比如P1A可以映射到PC5、
*       PC3和PC1.
*     4.P1A是可以输出另一路与P1A互补的PWM,我们称之为:P1AN,体现在
*       引脚图上是:P1A0N、P1A1N和P1A2N.并且这个互补输出PWM也是跟
*       P1A一样具有映射到某几个管脚上(PC4、PC2和PC0)
*     5.P1A的各路波形逻辑如下:
*       a.P1A0=P1A1=P1A2,P1A0N=P1A2N=P1A2N
*       b.P1A0与P1A0N互补
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
*函数名:DEVICE_INIT
*功能:上电器件初始化
*输入参数:无
*返回参数:无
====================================================*/
void DEVICE_INIT(void)
{
	OSCCON = 0B01110001;	//Bit7,LFMOD=0,WDT振荡器频率=32KHz
							//Bit6:4,IRCF[2:0]=101,内部RC频率=4MHz
							//Bit0,SCS=1,系统时钟选择为内部振荡器
	INTCON = 0B00000000;	//暂禁止所有中断
	OPTION = 0B00001000;	//Bit4=1 WDT MODE,PS=000=1:1 WDT RATE
	PORTA = 0B00000000;
	TRISA = 0B11001011;		//PORTA口设置为输入
	WPUA = 0B11001011;		//开启PORTA口内部上拉
	PORTC = 0B00000000;
	TRISC = 0B11011111;		//RC5为输出,其他PORTC口为输入
	WPUC = 0B11011111;		//RC5不开启上拉,其他PORTC口开启上拉
    PSRCA  = 0B11111111;	//源电流设置最大
    PSRCC  = 0B11111111;
    PSINKA = 0B11111111;	//灌电流设置最大
    PSINKC = 0B11111111;
    MSCON  = 0B00110000;
    //BIT5:PSRCAH4和PSRCA[4]共同决定源电流.00:4mA; 11:33mA; 01、10:8mA
    //BIT4:PSRCAH3和PSRCA[3]共同决定源电流.00:4mA; 11:33mA; 01、10:8mA
    //BIT3:UCFG1<1:0>为01时此位有意义.0:禁止LVR; 1:打开LVR
    //BIT2:快时钟测量慢周期的平均模式.0:关闭平均模式; 1:打开平均模式
    //BIT1:0:关闭快时钟测量慢周期:1:打开快时钟测量慢周期
    //BIT0:0:睡眠时停止工作:1:睡眠时保持工作.当T2时钟不是选择指令时钟的时候
}
void DEVICE_INIT2(void)
{
	OSCCON = 0B01110001;	//Bit7,LFMOD=0,WDT振荡器频率=32KHz
							//Bit6:4,IRCF[2:0]=101,内部RC频率=4MHz
							//Bit0,SCS=1,系统时钟选择为内部振荡器
	INTCON = 0B00000000;	//暂禁止所有中断
	OPTION = 0B00001000;	//Bit4=1 WDT MODE,PS=000=1:1 WDT RATE
	PORTA = 0B00000000;
	TRISA = 0B11001011;		//RA2设置为输出,其他PORTA口设置为输入
	WPUA = 0B11001011;		//除了RA2,都开启内部上拉
	PORTC = 0B00000000;
	TRISC = 0B11011111;		//PORTC口设置为输入
	WPUC = 0B11011111;		//开启PORTC输入口的内部上拉
    PSRCA  = 0B11111111;	//源电流设置最大
    PSRCC  = 0B11111111;
    PSINKA = 0B11111111;	//灌电流设置最大
    PSINKC = 0B11111111;
    MSCON  = 0B00110000;
    //BIT5:PSRCAH4和PSRCA[4]共同决定源电流.00:4mA; 11:33mA; 01、10:8mA
    //BIT4:PSRCAH3和PSRCA[3]共同决定源电流.00:4mA; 11:33mA; 01、10:8mA
    //BIT3:UCFG1<1:0>为01时此位有意义.0:禁止LVR; 1:打开LVR
    //BIT2:快时钟测量慢周期的平均模式.0:关闭平均模式; 1:打开平均模式
    //BIT1:0:关闭快时钟测量慢周期:1:打开快时钟测量慢周期
    //BIT0:0:睡眠时停止工作:1:睡眠时保持工作.当T2时钟不是选择指令时钟的时候
}
/*====================================================
*函数名:PWM1_INIT
*功能:上电器件初始化
*输入参数:无
*返回参数:无
====================================================*/
void PWM1_INIT(void)
{
    #if 0
	TRISC |= 0B00000011;		//关闭RC0和RC1输出,设置为输入
    #else
    TRISA |= 0B00010000;		//关闭RA4输出,设置为输入
    TRISC |= 0B00100000;		//关闭RC5输出,设置为输入
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
	TMR2IF =	0;						//清Timer2匹配标志位
	TMR2ON = 1;					//开启Timer2
	while(TMR2IF==0) CLRWDT();	//等待一个新的TMR2周期来临
    #if 0
	TRISC &= 0B11111100;		//新的一个TMR2周期来临,开启RC0和RC1输出
    #else
    TRISA &= 0B11101111;		//关闭RA4输出,设置为输入
    TRISC &= 0B11011111;		//关闭RC5输出,设置为输入
    #endif
}
/******PWM1输出互补PWM功能说明******
A.周期=(PR2+1)*Tt2ck*TMR2预分频比
  1.(PR2+1)=((PR2H:PR2L)+1)=199+1=200
  2.计算Timer2时钟源时间(Tt2ck)=(1/时钟源频率)*机器周期=(1/16MHz)*2T=0.125us
  3.TMR2预分频比由T2CON0的bit1和bit0决定,此例程是1:4
  4.算出周期=200*0.125us*4=100us,因此频率=1/周期=10KHz
B.占空比=P1ADT/(PR2+1)
  1.P1ADT=(P1ADTH:P1ADTL)=150
  2.(PR2+1)由前面算出等于200
  3.算出占空比=150/200=75%
C.PWM1生成说明
  1.P1OE是决定各路PWM是否要输出的寄存器,例程中BIT5和BIT4被置1,也就是使能
    了P1A2和P1A2N输出;
  2.P1POL是设置各路PWM的电平有效情况,也就是PWM的极性
  3.P1CON在此例程中是设置死区,bit7再此例程无效,因为无用到故障刹车功能
    死区时间=Tt2ck*P1DC[6:0]=0.125us*0b0001000=1us
D.Tt2ck(即Timer2时钟周期)的值,由T2CON2的[bit2:bit0]决定
  1.=000,指令时钟=单周期指令周期=(1/系统频率)*机器周期
  2.=001,系统时钟=(1/系统频率)
  3.=010,HIRC的2倍频.这里不支持高速时钟2倍频
  4.=100,HIRC=(1/16MHz)=0.0625us
  5.=100,LIRC=(1/32KHz)=31.25us
******PWM1输出互补PWM功能说明******/


/*====================================================
*函数名:interrupt ISR
*功能:中断服务函数
*输入参数:无
*返回参数:无
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
*函数名:TIMER0_INIT
*功能:Timer0初始化
*输入参数:无
*返回参数:无
====================================================*/
void TIMER0_INIT(void)
{
	T0CON0 = 0B00000000;
	OPTION = 0B00000111;           //Bit4=0 TIMER0 MODE,PS=011=1:256 TIMER0 RATE
													
}

/*====================================================
*函数名:ENABLE_INTERRUPT
*功能:开启所需中断
*输入参数:无
*返回参数:无
====================================================*/
void ENABLE_INTERRUPT(void)
{
	T0IF = 0;                       //清TIMER0中断标志位
	T0IE = 1;                       //使能TIMER0中断
	T0ON = 1;						//开启Timer0
	GIE = 1;                        //开启总中断
}
/*====================================================
*函数名称:DELAY_1MS
*功能:短延时函数(4MHz2T)
*输入参数:Time延时时间长度,延时时长Time1Ms
*返回参数:无 
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
*函数名称:DELAY_MS
*功能:短延时函数
*输入参数:Time延时时间长度,延时时长Time ms
*返回参数:无 
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
*函数名:main
*功能:主函数
*输入参数:无
*返回参数:无
====================================================*/
#define STEP_TIME 30
#define VOLUME_LOW 5
#define VOLUME_HIGH 10
void main(void)
{
    char i;
    volatile unsigned short volume=0;
    
	DEVICE_INIT();	   //器件初始化
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

