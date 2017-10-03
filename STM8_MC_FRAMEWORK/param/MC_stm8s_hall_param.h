/******************** (C) COPYRIGHT 2008 STMicroelectronics ********************
* File Name          : MC_stm8s_hall_param.h
* Author             : IMS Systems Lab 
* Date First Issued  : mm/dd/yyy
* Description        : hall sensors parameters file
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
#ifndef __MC_STM8S_HALL_PARAM_H
#define __MC_STM8S_HALL_PARAM_H

//#define HALLTEST_TIMER
//HALL检测用TIMER捕获方式，占IOPC5
//不定义定时器方式时默认用EXIT方式
//HALL检测喷射EXIT中断方式，占IOPD4

#ifdef HALLTEST_TIMER

	#define H1_PORT GPIOC->IDR
	#define H1_PIN  BIT5

  #define H2_PORT GPIOD->IDR
  #define H2_PIN  BIT3

	#define H3_PORT GPIOD->IDR
	#define H3_PIN  BIT2
#endif

#define HALL_FILTER_NOFILT	0	//	0.0625	us at 16Mhz;	0.0417	us at 24Mhz	sampling is done at fMASTER.
#define HALL_FILTER_F_N2	1	//	0.1250	us at 16Mhz;	0.0833	us at 24Mhz	fSAMPLING=fMASTER, N=2.
#define HALL_FILTER_F_N4	2	//	0.2500	us at 16Mhz;	0.1667	us at 24Mhz	fSAMPLING=fMASTER, N=4.
#define HALL_FILTER_F_N8	3	//	0.5000	us at 16Mhz;	0.3333	us at 24Mhz	fSAMPLING=fMASTER, N=8.
#define HALL_FILTER_F2_N6	4	//	0.7500	us at 16Mhz;	0.5000	us at 24Mhz	fSAMPLING=fMASTER/2, N=6.
#define HALL_FILTER_F2_N8	5	//	1.0000	us at 16Mhz;	0.6667	us at 24Mhz	fSAMPLING=fMASTER/2, N=8.
#define HALL_FILTER_F4_N6	6	//	1.5000	us at 16Mhz;	1.0000	us at 24Mhz	fSAMPLING=fMASTER/4, N=6.
#define HALL_FILTER_F4_N8	7	//	2.0000	us at 16Mhz;	1.3333	us at 24Mhz	fSAMPLING=fMASTER/4, N=8.
#define HALL_FILTER_F8_N6	8	//	3.0000	us at 16Mhz;	2.0000	us at 24Mhz	fSAMPLING=fMASTER/8, N=6.
#define HALL_FILTER_F8_N8	9	//	4.0000	us at 16Mhz;	2.6667	us at 24Mhz	fSAMPLING=fMASTER/8, N=8.
#define HALL_FILTER_F16_N5	10	//	5.0000	us at 16Mhz;	3.3333	us at 24Mhz	fSAMPLING=fMASTER/16, N=5.
#define HALL_FILTER_F16_N6	11	//	6.0000	us at 16Mhz;	4.0000	us at 24Mhz	fSAMPLING=fMASTER/16, N=6.
#define HALL_FILTER_F16_N8	12	//	8.0000	us at 16Mhz;	5.3333	us at 24Mhz	fSAMPLING=fMASTER/16, N=8.
#define HALL_FILTER_F32_N5	13	//	10.0000	us at 16Mhz;	6.6667	us at 24Mhz	fSAMPLING=fMASTER/32, N=5.
#define HALL_FILTER_F32_N6	14	//	12.0000	us at 16Mhz;	8.0000	us at 24Mhz	fSAMPLING=fMASTER/32, N=6.
#define HALL_FILTER_F32_N8	15	//	16.0000	us at 16Mhz;	10.6667	us at 24Mhz	fSAMPLING=fMASTER/32, N=8.

#define HALL_FILTER HALL_FILTER_F_N2

#endif /*__MC_STM8S_HALL_PARAM_H*/
/******************* (C) COPYRIGHT 2008 STMicroelectronics *****END OF FILE****/