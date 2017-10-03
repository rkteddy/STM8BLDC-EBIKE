/**
  ********************************************************************************
  * @file function.h
  * @brief This file contains functions prototypes for the functions.
  * @author STMicroelectronics - MCD Application Team
  * @version V1.0.1
  * @date 11/21/2008
  ******************************************************************************
  *
  * THE PRESENT FIRMWARE WHICH IS FOR GUIDANCE ONLY AIMS AT PROVIDING CUSTOMERS
  * WITH CODING INFORMATION REGARDING THEIR PRODUCTS IN ORDER FOR THEM TO SAVE
  * TIME. AS A RESULT, STMICROELECTRONICS SHALL NOT BE HELD LIABLE FOR ANY
  * DIRECT, INDIRECT OR CONSEQUENTIAL DAMAGES WITH RESPECT TO ANY CLAIMS ARISING
  * FROM THE CONTENT OF SUCH FIRMWARE AND/OR THE USE MADE BY CUSTOMERS OF THE
  * CODING INFORMATION CONTAINED HEREIN IN CONNECTION WITH THEIR PRODUCTS.
  *
  * <h2><center>&copy; COPYRIGHT 2008 STMicroelectronics</center></h2>
  * @image html logo.bmp
  ******************************************************************************
  */

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __FUNCTIONS_H
#define __FUNCTIONS_H

/* Includes ------------------------------------------------------------------*/
#include "stm8s_type.h"
#include <stdio.h>
#include <string.h>


/* LEDs I/Os */
#define LEDS_PORT (GPIOH)
#define LED1_PIN  (GPIO_PIN_3)
#define LED2_PIN  (GPIO_PIN_2)
#define LED3_PIN  (GPIO_PIN_1)
#define LED4_PIN  (GPIO_PIN_0)

/* Exported macro ------------------------------------------------------------*/
#define LEDS_OFF {GPIO_WriteLow(LEDS_PORT, (LED1_PIN | LED2_PIN | LED3_PIN | LED4_PIN));}
#define LEDS_ON  {GPIO_WriteHigh(LEDS_PORT, (LED1_PIN | LED2_PIN | LED3_PIN | LED4_PIN));}
#define LEDS_TOG {GPIO_WriteReverse(LEDS_PORT, (LED1_PIN | LED2_PIN | LED3_PIN | LED4_PIN));}
#define LED1_OFF {GPIO_WriteLow(LEDS_PORT, LED1_PIN);}
#define LED2_OFF {GPIO_WriteLow(LEDS_PORT, LED2_PIN);}
#define LED3_OFF {GPIO_WriteLow(LEDS_PORT, LED3_PIN);}
#define LED4_OFF {GPIO_WriteLow(LEDS_PORT, LED4_PIN);}
#define LED1_ON  {GPIO_WriteHigh(LEDS_PORT, LED1_PIN);}
#define LED2_ON  {GPIO_WriteHigh(LEDS_PORT, LED2_PIN);}
#define LED3_ON  {GPIO_WriteHigh(LEDS_PORT, LED3_PIN);}
#define LED4_ON  {GPIO_WriteHigh(LEDS_PORT, LED4_PIN);}

/* Exported functions --------------------------------------------------------*/
void InitLed_GPIO(void);
void Init_Clock(void);
#endif /* __FUNCTIONS_H */

/******************* (C) COPYRIGHT 2008 STMicroelectronics *****END OF FILE****/
