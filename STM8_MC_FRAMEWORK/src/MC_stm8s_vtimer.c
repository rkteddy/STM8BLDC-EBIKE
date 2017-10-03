/******************** (C) COPYRIGHT 2008 STMicroelectronics ********************
* File Name          : MC_stm8s_vtimer.c
* Author             : IMS Systems Lab 
* Date First Issued  : mm/dd/yyy
* Description        : Low level virtual timer implementation module
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

/* Includes ------------------------------------------------------------------*/

#include "stm8s_lib.h"
#include "MC_vtimer.h"
#include "stm8s_tim6.h"

#include "MC_stm8s_clk_param.h"

#define DELTAT_MS 1 // ms

#define ARRVALUE ((DELTAT_MS * STM8_FREQ_MHZ * 1000) / 128) 

void dev_vtimerInit(void)
{
	TIM6_DeInit();
	
	/* Time base configuration */ 
	TIM6_TimeBaseInit(TIM6_PRESCALER_128,ARRVALUE); // Setting for 1ms Delta time
	//ITC_SetSoftwarC
	//ePriority(ITC_IRQ_TIM6_OVF, ITC_PRIORITYLEVEL_1);
	ITC->ISPR6 |= 0xC0;
	ITC->ISPR6 &= 0x7F;
	
	TIM6_ITConfig(TIM6_IT_UPDATE, ENABLE);
	enableInterrupts();
	
	TIM6_Cmd(ENABLE);
}

/**
  * @brief Timer4 Update/Overflow Interruption routine.
  * @par Parameters
  * None
  * @retval void None
  * @par Required preconditions:
  * None
  * @par Called functions:
  * None
  */
	@far @interrupt void TIM6_UPD_OVF_TRG_IRQHandler(void)
{
	TIM6_ClearITPendingBit(TIM6_IT_UPDATE);
	vtimer_UpdateHandler();
	return;
}/* 
@near @interrupt @svlreg void TIM6_UPD_OVF_IRQHandler (void)
{
	In order to detect unexpected events during development,
	 it is recommended to set a breakpoint on the following instruction.
	
	
}*/

/******************* (C) COPYRIGHT 2008 STMicroelectronics *****END OF FILE****/
