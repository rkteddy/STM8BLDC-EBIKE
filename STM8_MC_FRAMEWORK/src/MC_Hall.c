#include "stm8s_lib.h"
#include "mc_stm8s_hall_param.h"
#include "mc_stm8s_clk_param.h"
#include "mc_bldc_drive_param.h"
#include "mc_vtimer.h"
#include <debug.h>

const unsigned char STEP_TAB[6]={1,3,2,5,0,4};//{4,0,5,2,3,1};//一为正一为负
const unsigned char PWM_EN1_TAB[6]={0xDD,0x0D,0xD0,0xDD,0x0D,0xD0};
const unsigned char PWM_EN2_TAB[6]={0x0,0x0D,0x0D,0x0,0xD,0xD};

extern unsigned int OUTPWM;
//百分比

/* Private vars and define */
#define BIT0 0x01
#define BIT1 0x02
#define BIT2 0x04
#define BIT3 0x08
#define BIT4 0x10
#define BIT5 0x20
#define BIT6 0x40
#define BIT7 0x80


#define ToCMPxH(CMP,Value)         ( CMP = (u8)((Value >> 8 ) & 0xFF))
#define ToCMPxL(CMP,Value)         ( CMP = (u8)(Value & 0xFF) )


// BRK settings
#ifdef BKIN  
	#define DEV_BKIN TIM1_BREAK_ENABLE
#else
	#define DEV_BKIN TIM1_BREAK_DISABLE
#endif


#if (BKIN_POLARITY == ACTIVE_HIGH) //刹车电平设置 
	#define DEV_BKIN_POLARITY            TIM1_BREAKPOLARITY_HIGH
#else
	#define DEV_BKIN_POLARITY            TIM1_BREAKPOLARITY_LOW
#endif

#ifdef ETR_INPUT
	#define OCxCE_ENABLE BIT7
#else
	#define OCxCE_ENABLE 0
#endif

//select PWM mode 1, OC1 preload enabled, OCxCE enabled.
#define CCMR_PWM (OCxCE_ENABLE|BIT6|BIT5)//PWM工作在模式1

//select PWM mode 2, OC1 preload enabled, OCxCE enabled. Low Side
#define CCMR_PWM_LS (OCxCE_ENABLE|BIT6|BIT5|BIT3)

//select OCREF - Forced Inactive, OC1 preload enabled (LS Off, HS On) X_COMP mode
#define CCMR_LOWSIDE (BIT6|BIT3)//强制无效电平

//select OCREF - Forced Active, OC1 preload enabled (LS ON, HS Off) X_COMP mode
#define CCMR_HIGHSIDE  (BIT6|BIT4|BIT3) //强制有效电平


//static const 
u16 hArrPwmVal = ((u16)((STM8_FREQ_MHZ * (u32)1000000)/ PWM_FREQUENCY));
//static const 
//u16 hMaxDutyCnt = hArrPwmVal - (((u32)STM8_FREQ_MHZ * MINIMUM_OFF_TIME)/1000);

u16 hCntDeadDtime=hDeadTime * STM8_FREQ_MHZ /1000;


void Commutation(unsigned char step,unsigned int OutPwmValue,unsigned char PWM_ON_flag);

#ifdef HALLTEST_TIMER
void  Init_HallBaseTimer(void)
{
	// Configure the TIM2 to manage the Hall sensorssignals
	// Set channel 1,2 and 3 as input capture

	//counter disabled, ARR preload register disabled, up counting, edge aligned mode
	TIM5->CR1 = BIT2;

	//disable all interrupts
	TIM5->IER = 0;

	TIM5->CCER1 = 0;
	TIM5->CCER2 = 0;

	//select channel 1,2 and 3 as input, channel prescaler 0
	TIM5->CCMR1 = BIT0;
	TIM5->CCMR2 = BIT0;
	TIM5->CCMR3 = BIT0;

	#define IC_FILTER (u8)(HALL_FILTER << 4)

	TIM5->CCMR1 |= IC_FILTER;
	TIM5->CCMR2 |= IC_FILTER;
	TIM5->CCMR3 |= IC_FILTER;

	//prescale = div3 @ 16MHz -> 0.5us/count * 24MHz -> 0.33us/count
	TIM5->PSCR = 0; 

	ToCMPxH( TIM5->ARRH, 0xFFFF );
	ToCMPxL( TIM5->ARRL, 0xFFFF );

	//Enable capture
	TIM5->CCER1 |= BIT0;
	TIM5->CCER1 |= BIT4;
	TIM5->CCER2 |= BIT0;

	//counter enabled
	TIM5->CR1 |= BIT0;
}

void HallTimer_InitCapturePolarity(void)//HALL
	//捕获输入配置
	{
		u8 bHStatus = 0;
		GPIOD->DDR &= (u8)(~(BIT3|BIT2|BIT4));
		
		// Read status of H1 and set the expected polarity
		if (H1_PORT & H1_PIN)
		{
			TIM5->CCER1 |= BIT1;
			bHStatus |= BIT2;
		}
		else
		{
			TIM5->CCER1 &= (u8)(~(BIT1));
		}
		
		// Read status of H2 and set the expected polarity
		if (H2_PORT & H2_PIN)
		{
			TIM5->CCER1 |= BIT5;
			bHStatus |= BIT1;
		}
		else
		{
			TIM5->CCER1 &= (u8)(~(BIT5));
		}
		
		// Read status of H3 and set the expected polarity
		if (H3_PORT & H3_PIN)
		{
			TIM5->CCER2 |= BIT1;
			bHStatus |= BIT0;
		}
		else
		{
			TIM5->CCER2 &= (u8)(~(BIT1));
		}

	  bHStatus=STEP_TAB[bHStatus-1];
	  //Commutation(bHStatus,hArrPwmVal*OUTPWM/100,1);
		
	  Commutation(bHStatus,OUTPWM,1);
		TIM5_ClearITPendingBit(TIM5_IT_CC1);
		TIM5_ClearITPendingBit(TIM5_IT_CC2);
		TIM5_ClearITPendingBit(TIM5_IT_CC3);
		
		// Enable Input Capture Interrupt
		TIM5->IER = BIT1|BIT2|BIT3;
	}
#endif	
	
#ifdef _COSMIC_
@far @interrupt void TIM5_CAP_COM_IRQHandler(void)
#else /* _RAISONANCE_ */
void TIM5_CAP_COM_IRQHandler(void) interrupt 14
#endif /* _COSMIC_ */
{
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
	#ifdef HALLTEST_TIMER
	u8 bHStatus = 0;


	// Read status of H1 and set the expected polarity
	if (H1_PORT & H1_PIN)
	{
		TIM5->CCER1 |= BIT1;
		bHStatus |= BIT2;
	}
	else
	{
		TIM5->CCER1 &= (u8)(~(BIT1));
	}
	
	// Read status of H2 and set the expected polarity
	if (H2_PORT & H2_PIN)
	{
		TIM5->CCER1 |= BIT5;
		bHStatus |= BIT1;
	}
	else
	{
		TIM5->CCER1 &= (u8)(~(BIT5));
	}
	
	// Read status of H3 and set the expected polarity
	if (H3_PORT & H3_PIN)
	{
		TIM5->CCER2 |= BIT1;
		bHStatus |= BIT0;
	}
	else
	{
		TIM5->CCER2 &= (u8)(~(BIT1));
	}
	bHStatus=STEP_TAB[bHStatus-1];
	//Commutation(bHStatus,hArrPwmVal/10*OUTPWM/10,1);
	  Commutation(bHStatus,OUTPWM,1);
	TIM5_ClearITPendingBit(TIM5_IT_CC1);
	TIM5_ClearITPendingBit(TIM5_IT_CC2);
	TIM5_ClearITPendingBit(TIM5_IT_CC3);
	
	return;
	
	#endif
}


//Timer1 used for main motor PWM outputs and for triggering the ADC sample
//channels 1,2, and 3 are used.  Channel 4 is available
void Init_TIM1(void)
{
	 /* TIM1 Peripheral Configuration */ 
  TIM1_DeInit();

  TIM1_TimeBaseInit(0, TIM1_COUNTERMODE_UP, hArrPwmVal, 0);

  TIM1_OC1Init(TIM1_OCMODE_PWM1, TIM1_OUTPUTSTATE_ENABLE, TIM1_OUTPUTNSTATE_ENABLE, hArrPwmVal*0, TIM1_OCPOLARITY_HIGH, TIM1_OCNPOLARITY_LOW, TIM1_OCIDLESTATE_RESET, TIM1_OCNIDLESTATE_SET); 

  TIM1_OC2Init(TIM1_OCMODE_PWM1, TIM1_OUTPUTSTATE_ENABLE, TIM1_OUTPUTNSTATE_ENABLE, hArrPwmVal*0, TIM1_OCPOLARITY_HIGH, TIM1_OCNPOLARITY_LOW, TIM1_OCIDLESTATE_RESET, TIM1_OCNIDLESTATE_SET); 

  TIM1_OC3Init(TIM1_OCMODE_PWM1, TIM1_OUTPUTSTATE_ENABLE, TIM1_OUTPUTNSTATE_ENABLE, hArrPwmVal*0, TIM1_OCPOLARITY_HIGH, TIM1_OCNPOLARITY_LOW, TIM1_OCIDLESTATE_RESET, TIM1_OCNIDLESTATE_SET); 

	TIM1_BDTRConfig( TIM1_OSSISTATE_ENABLE,  TIM1_LOCKLEVEL_1, hDeadTime , TIM1_BREAK_ENABLE,TIM1_BREAKPOLARITY_LOW, TIM1_AUTOMATICOUTPUT_ENABLE);//break

		
  TIM1_CCPreloadControl(DISABLE);

	TIM1_Cmd(ENABLE);
  TIM1_CtrlPWMOutputs(ENABLE);
}

//换向输出PWM值，
//steP,为当前步，OutPwmValue 输出PWM值，PWM_ON_flag=1时打开PWM输出
void Commutation(unsigned char step,unsigned int OutPwmValue,unsigned char PWM_ON_flag)
{	
   TIM1_CtrlPWMOutputs(DISABLE);
	 if(PWM_ON_flag==0)return;
 
	if(step<=1)	
	{
	TIM1_SetCompare1(OutPwmValue);
	TIM1_SetCompare2(0);
	TIM1_SetCompare3(0);
	}
	else if(step<=3)
	{		
	TIM1_SetCompare1(0);
	TIM1_SetCompare2(OutPwmValue);
	TIM1_SetCompare3(0);
	}
	else 	
	{		
	TIM1_SetCompare1(0);
	TIM1_SetCompare2(0);
	TIM1_SetCompare3(OutPwmValue);
	}
	
	TIM1->CCER1=PWM_EN1_TAB[step];
	TIM1->CCER2=PWM_EN2_TAB[step];	
  TIM1_CtrlPWMOutputs(ENABLE);
}

#ifndef HALLTEST_TIMER
void EXTI_HALL_Init(void)//反电压比较设置
{	
	GPIOD->DDR &= (u8)(~(BIT3|BIT2|BIT4));
	GPIOD->CR1|=BIT3|BIT2|BIT4;//上位输入
	GPIOD->CR2=0;
}

void HallEXTI_Init(void)//HALL
	//捕获输入配置
	{
		u8 bHStatus = 0;	
		
		bHStatus=(GPIO_ReadInputData(GPIOD)>>2)&0x07;
	  bHStatus=STEP_TAB[bHStatus-1];
	  //Commutation(bHStatus,hArrPwmVal*OUTPWM/100,1);
		
	  Commutation(bHStatus,OUTPWM,1);
				
		GPIOD->CR2|=BIT3|BIT2|BIT4;
		enableInterrupts();
		EXTI->CR1|=BIT6|BIT7;
	}
#endif

void CheckBreak(void)
{
	if((TIM1->BKR&0X80)==0)
		GPIO_WriteHigh(GPIOD,GPIO_PIN_7);
	else
		GPIO_WriteLow(GPIOD,GPIO_PIN_7);
}

#ifdef _COSMIC_
@far @interrupt void EXTI_PORTD_IRQHandler(void)
#else /* _RAISONANCE_ */
void EXTI_PORTD_IRQHandler(void) interrupt 6
#endif /* _COSMIC_ */
{
	//static unsigned char LastStatus=0;
	u8 bHStatus = 0;
	u8 i;
	
	//if(LastStatus==0)	LastStatus=(GPIO_ReadInputData(GPIOD)>>2)&0x07;
	
	bHStatus=(GPIO_ReadInputData(GPIOD)>>2)&0x07;
	for(i=0;i<250;i++);//滤波时间
	i=(GPIO_ReadInputData(GPIOD)>>2)&0x07;
	if(bHStatus!=i)return;
	if(bHStatus==0||bHStatus==7)return;
	
	//LastStatus=bHStatus;			
	
	bHStatus=STEP_TAB[bHStatus-1];
	//Commutation(bHStatus,hArrPwmVal/10*OUTPWM/10,1);
	
	Commutation(bHStatus,OUTPWM,1);
	EXTI->CR1|=BIT6|BIT7;
	//SendChar(bHStatus);
	return;
}

