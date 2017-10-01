/**
  ******************************************************************************
  * @file stm8s_lib.h
  * @brief This file includes the peripherals header files in the user application.
  * @author STMicroelectronics - MCD Application Team
  * @version V1.0.1
  * @date 09/22/2008
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
#ifndef __STM8S_LIB_H
#define __STM8S_LIB_H

/* Includes ------------------------------------------------------------------*/
#include "stm8s.h"

#ifdef _ADC1
#include "stm8s_adc1.h"
#endif /* _ADC1 */

#ifdef _ADC2
#include "stm8s_adc2.h"
#endif /* _ADC2 */

#ifdef _AWU
#include "stm8s_awu.h"
#endif /* _AWU */

#ifdef _BEEP
#include "stm8s_beep.h"
#endif /* _BEEP */

#ifdef _CLK
#include "stm8s_clk.h"
#endif /* _CLK */

#if defined(_FLASH) || defined(_OPT)
#include "stm8s_flash.h"
#endif /* _FLASH/OPT */

#ifdef _EXTI
#include "stm8s_exti.h"
#endif /* _EXTI */

#if defined(_GPIOA) || defined(_GPIOB) || defined(_GPIOC) ||\
    defined(_GPIOD) || defined(_GPIOE) || defined(_GPIOF) ||\
    defined(_GPIOG) || defined(_GPIOH) || defined(_GPIOI)
#include "stm8s_gpio.h"
#endif /* _GPIOx */

#ifdef _I2C
#include "stm8s_i2c.h"
#endif /* _I2C */

#ifdef _ITC
#include "stm8s_itc.h"
#endif /* _ITC */

#ifdef _IWDG
#include "stm8s_iwdg.h"
#endif /* _IWDG */

#ifdef _RST
#include "stm8s_rst.h"
#endif /* _RST */

#ifdef _SPI
#include "stm8s_spi.h"
#endif /* _SPI */

#ifdef _TIM1
#include "stm8s_tim1.h"
#endif /* _TIM1 */

#ifdef _TIM2
#include "stm8s_tim2.h"
#endif /* _TIM2 */

#ifdef _TIM3
#include "stm8s_tim3.h"
#endif /* _TIM3 */

#ifdef _TIM4
#include "stm8s_tim4.h"
#endif /* _TIM4 */

#ifdef _TIM5
#include "stm8s_tim5.h"
#endif /* _TIM4 */

#ifdef _TIM6
#include "stm8s_tim6.h"
#endif /* _TIM4 */

#ifdef _UART1
#include "stm8s_uart1.h"
#endif /* _UART1 */

#ifdef _UART2
#include "stm8s_uart2.h"
#endif /* _UART2 */

#ifdef _UART3
#include "stm8s_uart3.h"
#endif /* _UART3 */

#ifdef _WWDG
#include "stm8s_wwdg.h"
#endif /* _WWDG */

#ifdef _CAN
#include "stm8s_can.h"
#endif /* _CAN */

/* Exported types ------------------------------------------------------------*/
/* Exported constants --------------------------------------------------------*/
/* Exported macro ------------------------------------------------------------*/
/* Exported functions ------------------------------------------------------- */

#endif /* __STM8S_LIB_H */

/******************* (C) COPYRIGHT 2008 STMicroelectronics *****END OF FILE****/
