/* MAIN.C file
 * GPIO: 50%占空比输出换相
    ，控制电机转动，开环，上电运行,带HALL
		HALL可使用外部中断或定时器捕获功能两种方法均可
		使用定时器时，TIMER5的CH1通道要用PC5作为HALL输入之一
		使用外部中断时，要用PD4作为HALL输入之一
   Author: Cache.Lee  from UET
	 Date: 2011-01-3
   http://www.shop35591312.taobao.com
 * Copyright (c) UET
 */
#include "stm8s_lib.h"
#include "functions.h"

#include "mc_dev_clk.h"
#include "mc_vtimer.h" 
#include "mc_dev_vtimer.h"
#include "MC_HALL.H"
#include "MC_dev_port.h"
#include "MC_stm8s_port_param.h"
#include "mc_stm8s_hall_param.h"
#include <debug.h>

extern u16 hArrPwmVal;

#define MINPWMPERCENT 10
#define MAXPWMPERCENT 80
#define MINVALUE MINPWMPERCENT/10*hArrPwmVal/10
#define MAXVALUE MAXPWMPERCENT/10*hArrPwmVal/10
#define CURRENT_PARA_A 1.272727
#define CURRENT_PARA_B -258.4035

unsigned int OUTPWM;	

u16 Conversion_Val;

void fun(void)
{
	static int cnt=0;
	static float curave=0;
	unsigned char i;
	//GPIO_WriteReverse(GPIOD,GPIO_PIN_7);
	vtimer_SetTimer(VTIM0,1,fun);
	 
	if(5==cnt)
	{
		 ////霍尔转把/电位器
		ADC1_ConversionConfig(ADC1_CONVERSIONMODE_SINGLE, ADC1_CHANNEL_3, ADC1_ALIGN_RIGHT);
		ADC1_Cmd(ENABLE);
		ADC1_StartConversion();
		while(!ADC1_GetFlagStatus(ADC1_FLAG_EOC));
		ADC1_ClearFlag(ADC1_FLAG_EOC);
		Conversion_Val = ADC1_GetConversionValue();
		if(Conversion_Val<MINVALUE)
			Conversion_Val=MINVALUE;
		else if(Conversion_Val>MAXVALUE)
			Conversion_Val=MAXVALUE;
		if(OUTPWM!=Conversion_Val)
		{
			OUTPWM=Conversion_Val;
		//	SendString("\r\nnew PWM duty:");
		//	SendUInt(Conversion_Val);
		}
	}
	
	//sample current
		
	ADC1_ConversionConfig(ADC1_CONVERSIONMODE_SINGLE, ADC1_CHANNEL_1, ADC1_ALIGN_RIGHT);
	ADC1_Cmd(ENABLE);
	ADC1_StartConversion();
	while(!ADC1_GetFlagStatus(ADC1_FLAG_EOC));
	ADC1_ClearFlag(ADC1_FLAG_EOC);
	//Conversion_Val = ADC1_GetConversionValue();
	curave+=(float)ADC1_GetConversionValue()/100.0;
	++cnt;
	if(100==cnt)
	{
		cnt=0;
		curave=CURRENT_PARA_A*curave+CURRENT_PARA_B;//y=12.72727x-2529.035
		SendChar((unsigned char)curave);
		curave=0;
	}
	//SendString("\r\nadc resault \tcurrent aveage(mA):");
	
	//SendChar('\t');
	//curave=Conversion_Val*8.60227954409118-1.68099580083983;//(Conversion_Val*5.0/1023-1)*1000000/19.0;
	//SendUInt((unsigned int) curave);
}

void ADC_Init(void)
{
		
		GPIO_Init(GPIOB,GPIO_PIN_1,GPIO_MODE_IN_FL_NO_IT); //current average,AIN1
		GPIO_Init(GPIOB,GPIO_PIN_3,GPIO_MODE_IN_FL_NO_IT); //speed_set,AIN3
		ADC1_DeInit();
		ADC1_SchmittTriggerConfig(ADC1_SCHMITTTRIG_CHANNEL1, DISABLE);
		ADC1_SchmittTriggerConfig(ADC1_SCHMITTTRIG_CHANNEL3, DISABLE);
    ADC1_ITConfig(ADC1_IT_EOCIE, DISABLE);
}

void delay(unsigned int i)
{
	unsigned int k;
	while(i--)
		for(k=20000;k>0;--k);
}


main()
{
	  u16 i;
		//FlagStatus EOC_Flag;
		for(i=0;i<60000;i++);
		OUTPWM=MINVALUE;		
    dev_clkInit();
		DebugInit();
		//SendString("booting,please wait.....");
		InitLed_GPIO();  //LED灯初始化
		dev_portInit();//PWMio初始化
		dev_vtimerInit(); //TIM5软件定时器配置 
		ADC_Init();
		vtimer_SetTimer(VTIM0,1,fun);	

     GPIO_WriteHigh(GPIOD,GPIO_PIN_6);
		
		#ifdef HALLTEST_TIMER
		Init_HallBaseTimer();//HALL 时钟相关配置	
		Init_TIM1();
		HallTimer_InitCapturePolarity();//HALL 捕获配置
		#else
    EXTI_HALL_Init();
		Init_TIM1();
    HallEXTI_Init();
    #endif		
	  while (1)
		{
			CheckBreak();
		
		/*
		  EOC_Flag = ADC1_GetFlagStatus(ADC1_FLAG_EOC);
			if(EOC_Flag)
			{
				ADC1_ClearFlag(ADC1_FLAG_EOC);
				EOC_Flag = 0;

				Conversion_Val = ADC1_GetConversionValue();
				if(Conversion_Val<MINVALUE)Conversion_Val=MINVALUE;
				else if(Conversion_Val>MAXVALUE)Conversion_Val=MAXVALUE;
				
				OUTPWM=Conversion_Val;
				//SendString("\r\nPWM duty:");
				//SendUInt(Conversion_Val);
				//SendChar((unsigned char)Conversion_Val);
			}*//*
			OUTPWM=MINVALUE;
			SendString("\r\nPWM duty:");
			SendUInt(OUTPWM);
			delay(1000);
			OUTPWM=MAXVALUE;
			SendString("\r\nPWM duty:");
			SendUInt(OUTPWM);
			delay(1000);*/
	  }
}


