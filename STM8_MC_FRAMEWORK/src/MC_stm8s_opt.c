/******************** (C) COPYRIGHT 2008 STMicroelectronics ********************
* File Name          : MC_stm8s_opt.c
* Author             : IMS Systems Lab 
* Date First Issued  : mm/dd/yyy
* Description        : Low level option byte managament module
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
#include "MC_dev_opt.h"
#include "MC_stm8s_clk_param.h"

#include "mc_stm8s_hall_param.h"

void dev_optInit(void)
{
	u8 Opt;
	u16 OptComp;
	u16 i;	
	
	// Wait 10ms after reset to avoid bad option byte programming
	for (i=0;i<5000;i++);
		
	/* Define FLASH programming time */
	FLASH_SetProgrammingTime(FLASH_PROGRAMTIME_STANDARD);
	
	/* Unlock Data memory */
	FLASH_Unlock(FLASH_MEMTYPE_DATA);
	
	#if (STM8_FREQ_MHZ > 16)
		if (FLASH_ReadOptionByte(0x480D) != 0x01FE)
		{
			FLASH_ProgramOptionByte(0x480D, 0x01); // Set 1 Wait State
		}
	#else
		if (FLASH_ReadOptionByte(0x480D) != 0x00FF)
		{
			FLASH_ProgramOptionByte(0x480D, 0x00); // Set 0 Wait State
		}
	#endif
	
	Opt =0;//  FLASH_ReadOptionByte(0x4803);
	
	
	#ifdef TIM5_CH3_REMAP
		Opt |= 0x02;
	#else
		Opt &= (u8)(~0x02);
	#endif
	
	#ifdef TIM5_CH1_REMAP
		Opt |= 0x01;
	#else
		Opt &= (u8)(~0x01);
	#endif
	
	OptComp = (u8)(~Opt) | (Opt << 8);
	
	if (OptComp != FLASH_ReadOptionByte(0x4803))
	{
		FLASH_ProgramOptionByte(0x4803, Opt );
	}
		
	/* Lock Data memory */	
	FLASH_Lock(FLASH_MEMTYPE_DATA);
}
/******************* (C) COPYRIGHT 2008 STMicroelectronics *****END OF FILE****/
