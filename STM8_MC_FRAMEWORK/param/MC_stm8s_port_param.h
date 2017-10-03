/******************** (C) COPYRIGHT 2008 STMicroelectronics ********************
* File Name          : MC_stm8s_port_param.h
* Author             : IMS Systems Lab 
* Date First Issued  : mm/dd/yyy
* Description        : 
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
#ifndef __MC_PORT_PARAM_H
#define __MC_PORT_PARAM_H

//Õý¶Ë
#define MCO1_PORT GPIOC  
#define MCO1_PIN	GPIO_PIN_6
#define MCO3_PORT GPIOC
#define MCO3_PIN	GPIO_PIN_7
#define MCO5_PORT GPIOC
#define MCO5_PIN	GPIO_PIN_3
//¸º¶Ë
#define MCO0_PORT GPIOE
#define MCO0_PIN	GPIO_PIN_5
#define MCO2_PORT GPIOC
#define MCO2_PIN	GPIO_PIN_1
#define MCO4_PORT GPIOC
#define MCO4_PIN	GPIO_PIN_2


// Brake command
#define DISSIPATIVE_BRAKE_PORT GPIOD
#define DISSIPATIVE_BRAKE_BIT GPIO_PIN_0

#endif /* __MC_PORT_PARAM_H */

/******************* (C) COPYRIGHT 2008 STMicroelectronics *****END OF FILE****/