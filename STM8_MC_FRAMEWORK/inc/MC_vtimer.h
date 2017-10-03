/******************** (C) COPYRIGHT 2008 STMicroelectronics ********************
* File Name          : MC_vtimer.h
* Author             : IMS Systems Lab
* Date First Issued  : mm/dd/yyy
* Description        : Prototype definition for MC_vtimer.c
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
/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __MC_VTIMER_H
#define __MC_VTIMER_H

#include "dev_type.h"

/* Exported typedef ----------------------------------------------------------*/
typedef enum {VTIM0,VTIM1,VTIM2,VTIM3,VTIM4,VTIM5,VTIM6,VTIM7,VTIM8,VTIM9,VTIM10,VTIMER_NUM} VtimerName_t;

typedef u16 timer_res_t ;

typedef struct
{
	timer_res_t msec;
	void* pCallback;
} Vtimer_t,*PVtimer;

/* Exported define -----------------------------------------------------------*/
// Common
#define VTIM_KEY 											VTIM0
#define VTIM_DISPLAY_BLINK 						VTIM1
#define VTIM_DISPLAY_REFRESH					VTIM2
#define VTIM_USER_INTERFACE_REFRESH                             VTIM3

/* Prototypes ----------------------------------------------------------------*/
void vtimer_init(void);
void vtimer_SetTimer(VtimerName_t name,timer_res_t  msec,void* pCallback);
void vtimer_KillTimer(VtimerName_t name);
u8 vtimer_TimerElapsed(VtimerName_t name);
void vtimer_UpdateHandler(void);

#endif //__MC_VTIMER_H

/******************* (C) COPYRIGHT 2008 STMicroelectronics *****END OF FILE****/

