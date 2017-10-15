/******************** (C) COPYRIGHT 2008 STMicroelectronics ********************
* File Name          : MC_PowerStage_Param.h
* Author             : IMS Systems Lab 
* Date First Issued  : mm/dd/yyy
* Description        : Power Stage parameters
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
#ifndef __POWER_STAGE_PARAM_H
#define __POWER_STAGE_PARAM_H

//#define DISSIPATIVE_BRAKE // Uncomment to enable

#define DISSIPATIVE_BRAKE_ACTIVE_HIGH 0
#define DISSIPATIVE_BRAKE_ACTIVE_LOW  1

#define DISSIPATIVE_BRAKE_POL DISSIPATIVE_BRAKE_ACTIVE_HIGH


#define PWM_LOWSIDE_OUTPUT_ENABLE

//三相PWM输出高或低有效状态设置 
#define ACTIVE_HIGH 1
#define ACTIVE_LOW 0
#define ACTIVE 1
#define INACTIVE 0


#define PWM_U_HIGH_SIDE_POLARITY		ACTIVE_HIGH
#define PWM_U_LOW_SIDE_POLARITY			ACTIVE_LOW
#define PWM_U_HIGH_SIDE_IDLE_STATE		INACTIVE
#define PWM_U_LOW_SIDE_IDLE_STATE		INACTIVE

#define PWM_V_HIGH_SIDE_POLARITY		ACTIVE_HIGH
#define PWM_V_LOW_SIDE_POLARITY			ACTIVE_LOW
#define PWM_V_HIGH_SIDE_IDLE_STATE		INACTIVE
#define PWM_V_LOW_SIDE_IDLE_STATE		INACTIVE

#define PWM_W_HIGH_SIDE_POLARITY		ACTIVE_HIGH
#define PWM_W_LOW_SIDE_POLARITY			ACTIVE_LOW
#define PWM_W_HIGH_SIDE_IDLE_STATE		INACTIVE
#define PWM_W_LOW_SIDE_IDLE_STATE		INACTIVE 


// BRK_INPUT settings
#define BKIN_POLARITY	ACTIVE_LOW 


#endif /* __POWER_STAGE_PARAM_H */

/******************* (C) COPYRIGHT 2008 STMicroelectronics *****END OF FILE****/
