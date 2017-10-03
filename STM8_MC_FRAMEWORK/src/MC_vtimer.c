/******************** (C) COPYRIGHT 2008 STMicroelectronics ********************
* File Name          : MC_vtimer.c
* Author             : IMS Systems Lab 
* Date First Issued  : mm/dd/yyy
* Description        : This file handles virtual timers
* Software package   : 
********************************************************************************
* History:
* 
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
/* Includes ------------------------------------------------------------------*/
#include "MC_vtimer.h"

/* Private define ------------------------------------------------------------*/
/* Private typedef -----------------------------------------------------------*/
/* Private function-----------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/
@near static Vtimer_t sVtimer[VTIMER_NUM];

void vtimer_init()
{
	u8 i;
	for (i = 0; i < VTIMER_NUM; i++)
	{
		sVtimer[i].msec = 0;
		sVtimer[i].pCallback = 0;
	}
}

void vtimer_SetTimer(VtimerName_t name,timer_res_t  msec,void* pCallback)
{
	sVtimer[name].msec = msec;
	sVtimer[name].pCallback = pCallback;
}

void vtimer_KillTimer(VtimerName_t name)
{
	sVtimer[name].msec = 0;
	sVtimer[name].pCallback = 0;
}

u8 vtimer_TimerElapsed(VtimerName_t name)
{
	if (sVtimer[name].msec == 0)
		return TRUE;
	else
		return FALSE;
}

typedef void(*PFN_Callback_t)(void);

void vtimer_UpdateHandler(void)
{
	//Enter each DELTAT_MS ms
	u8 i;
	
	for (i = 0; i < VTIMER_NUM; i++)
	{
		if (sVtimer[i].msec != 0)
		{
			sVtimer[i].msec--;
			if (sVtimer[i].pCallback != 0)
			{
				if (sVtimer[i].msec == 0) 
				{
					((PFN_Callback_t)sVtimer[i].pCallback)();
				}
			}
		}
	}
}

/******************* (C) COPYRIGHT 2008 STMicroelectronics *****END OF FILE****/
