/******************** (C) COPYRIGHT 2008 STMicroelectronics ********************
* File Name          : MC_stm8s_port.c
* Author             : IMS Systems Lab 
* Date First Issued  : mm/dd/yyy
* Description        : Low level port management module
********************************************************************************
* History:
* mm/dd/yyyy ver. x.y.z
********************************************************************************
* THE PRESENT SOFTWARE WHICH IS FOR GUIDANCE ONLY AIMS AT PROVIDING CUSTOMERS
* WITH CODING INFORMATION REGARDING THEIR PRODUCTS IN ORDER FOR THEM TO SAVE TIME.
* AS A RESULT, STMICROELECTRONICS SHALL NOT BE HELD LIABLE FOR ANY DIRECT,
* INDIRECT OR CONSEQUENTIAL DAMAGES WITH RESPECT TO ANY CLAIMS ARISING FROM THE
* CONTENT OF SUCH SOFTWARE AND/OR THE USE MADE BY CUSTOMERS OF THE CODING
* INFORMATION CONTAINED HEREIN IN CONNECTION WITH THEIR PRODUCTS.
*
* THIS SOURCE CODE IS PROTECTED BY A LICENSE.
* FOR MORE INFORMATION PLEASE CAREFULLY READ THE LICENSE AGREEMENT FILE LOCATED
* IN THE ROOT DIRECTORY OF THIS FIRMWARE PACKAGE.
*******************************************************************************/

/******************************************************************************/
#include "stm8s_lib.h"
#include "MC_dev_port.h"

#include "MC_stm8s_port_param.h"
#include "MC_PowerStage_Param.h"


/* Private prototypes *********************************************************/
void Init_MC_Port( void );
void Init_DissipativeBreak_Port(void);

void Init_MC_Port(void)//电机控制IO初始化,6个管子IO初始化无效
{
#ifdef PWM_LOWSIDE_OUTPUT_ENABLE	
	#if (PWM_U_LOW_SIDE_POLARITY == ACTIVE_HIGH)
		GPIO_Init(MCO0_PORT, MCO0_PIN,GPIO_MODE_OUT_PP_LOW_FAST);
	#else
		GPIO_Init(MCO0_PORT, MCO0_PIN,GPIO_MODE_OUT_PP_HIGH_FAST);
	#endif
#endif

	#if (PWM_U_HIGH_SIDE_POLARITY == ACTIVE_HIGH)
		GPIO_Init(MCO1_PORT, MCO1_PIN,GPIO_MODE_OUT_PP_LOW_FAST);
	#else
		GPIO_Init(MCO1_PORT, MCO1_PIN,GPIO_MODE_OUT_PP_HIGH_FAST);
	#endif
	
#ifdef PWM_LOWSIDE_OUTPUT_ENABLE	
	#if (PWM_V_LOW_SIDE_POLARITY == ACTIVE_HIGH)
		GPIO_Init(MCO2_PORT, MCO2_PIN,GPIO_MODE_OUT_PP_LOW_FAST);
	#else
		GPIO_Init(MCO2_PORT, MCO2_PIN,GPIO_MODE_OUT_PP_HIGH_FAST);
	#endif
#endif

	#if (PWM_V_HIGH_SIDE_POLARITY == ACTIVE_HIGH)
		GPIO_Init(MCO3_PORT, MCO3_PIN,GPIO_MODE_OUT_PP_LOW_FAST);
	#else
		GPIO_Init(MCO3_PORT, MCO3_PIN,GPIO_MODE_OUT_PP_HIGH_FAST);
	#endif
	
#ifdef PWM_LOWSIDE_OUTPUT_ENABLE	
	#if (PWM_W_LOW_SIDE_POLARITY == ACTIVE_HIGH)
		GPIO_Init(MCO4_PORT, MCO4_PIN,GPIO_MODE_OUT_PP_LOW_FAST);
	#else
		GPIO_Init(MCO4_PORT, MCO4_PIN,GPIO_MODE_OUT_PP_HIGH_FAST);
	#endif
#endif	

	#if (PWM_W_HIGH_SIDE_POLARITY == ACTIVE_HIGH)
		GPIO_Init(MCO5_PORT, MCO5_PIN,GPIO_MODE_OUT_PP_LOW_FAST);
	#else
		GPIO_Init(MCO5_PORT, MCO5_PIN,GPIO_MODE_OUT_PP_HIGH_FAST);
	#endif	
}

#ifdef DISSIPATIVE_BRAKE
	void Init_DissipativeBreak_Port(void)
	{
		#if (DISSIPATIVE_BRAKE_POL == DISSIPATIVE_BRAKE_ACTIVE_HIGH)
			GPIO_Init(DISSIPATIVE_BRAKE_PORT, DISSIPATIVE_BRAKE_BIT,GPIO_MODE_OUT_PP_LOW_FAST);
		#else
			GPIO_Init(DISSIPATIVE_BRAKE_PORT, DISSIPATIVE_BRAKE_BIT,GPIO_MODE_OUT_PP_HIGH_FAST);
		#endif
	}
#endif

void dev_portInit(void)
{
	Init_MC_Port();
	#ifdef DISSIPATIVE_BRAKE
		Init_DissipativeBreak_Port();
	#endif
}

/******************* (C) COPYRIGHT 2008 STMicroelectronics *****END OF FILE****/
