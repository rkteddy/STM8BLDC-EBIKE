/**
  ******************************************************************************
  * @file stm8s_conf.h
  * @brief This file is used to configure the Library.
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
#ifndef __STM8S_CONF_H
#define __STM8S_CONF_H

/* Includes ------------------------------------------------------------------*/
#include "stm8s_type.h"
//#include "stm8s_macro.h"

/* Exported types ------------------------------------------------------------*/
/* Exported constants --------------------------------------------------------*/

/* Uncomment the line below to compile the library in DEBUG mode.
   This will expanse the "assert" macro in the firmware library code
   (see "Exported macro" section below) */
/*#define DEBUG (1)*/

/* Uncomment the line below to use the full assert mode */
#define FULL_ASSERT (1)

/* Uncomment the line below to use the cosmic section */
#if defined(__CSMC__)
/* #define USE_COSMIC_SECTIONS  (1) */
#endif

/* Value of the High Speed External clock in Hz (1MHz to 24 MHz) */
#define HSE_VALUE ((u32)24000000)


/* Comment the line below to disable the specific peripheral inclusion */

/*** ANALOG DIGITAL CONVERTER *************************************************/
#define _ADC1 (1)
#define _ADC2 (1)

/*** AUTO WAKE UP *************************************************************/
#define _AWU (1)

/*** BEEP *********************************************************************/
#define _BEEP (1)

/*** CLOCK CONTROLLER *********************************************************/
#define _CLK (1)

/*** EXTERNAL INTERRUPTS ******************************************************/
#define _EXTI (1)

/*** FLASH/DATA EEPROM ********************************************************/
#define _FLASH (1)

/*** GENERAL PURPOSE IOs ******************************************************/
#define _GPIOA (1)
#define _GPIOB (1)
#define _GPIOC (1)
#define _GPIOD (1)
#define _GPIOE (1)
#define _GPIOF (1)
#define _GPIOG (1)
#define _GPIOH (1)
#define _GPIOI (1)

/*** INTERRUPT CONTROLLER *****************************************************/
#define _ITC (1)

/*** INDEPENDANT WDG **********************************************************/
#define _IWDG (1)

/*** I2C **********************************************************************/
#define _I2C (1)

/*** OPTION BYTES *************************************************************/
/* #define _OPT (1) */

/*** RESET CONTROLLER *********************************************************/
#define _RST (1)

/*** SPI **********************************************************************/
#define _SPI (1)

/*** TIMERs *******************************************************************/
#define _TIM1 (1)
#define _TIM2 (1)
#define _TIM3 (1)
#define _TIM4 (1)
#define _TIM5 (1)
#define _TIM6 (1)

/*** UART1 ******************************************************************/
#define _UART1 (1)

/*** UART2 ********************************************************************/
#define _UART2 (1)

/*** UART3 ********************************************************************/
#define _UART3 (1)

/*** WINDOW WDG ***************************************************************/
#define _WWDG (1)

/* Exported macro ------------------------------------------------------------*/

/**
  * @brief The assert macro is used for function's parameters check.
  * It is used only if the library is compiled in DEBUG mode.
  * There is a normal mode and a full mode when the FULL_ASSERT constant is
  * defined.
  * @par Parameters:
  * expr : If expr is false, it calls the assert_failed call-back function.
  * This call-back function must be defined in your application.
  * @retval void None
  * @par Required preconditions:
  * None
  * @par Called functions:
  * None
  * @par Example:
  * Check GPIO mode parameter
  * @code
  * assert_param(IS_GPIO_MODE_OK(GPIO_InitStruct->GPIO_Mode));
  * @endcode
  */
#ifdef DEBUG /* DEBUG defined */
#ifndef FULL_ASSERT /* FULL_ASSERT not defined */
void assert_failed(void);
#define assert_param(expr) ((expr) ? (void)(0) : assert_failed())
#else /* FULL_ASSERT defined */
void assert_failed(u8 *file, u16 line);
#define assert_param(expr) ((expr) ? (void)(0) : assert_failed(__FILE__, __LINE__))
#endif
#else /* DEBUG undefined */
#define assert_param(expr) ((void)(0))
#endif

#endif /* __STM8S_CONF_H */

/******************* (C) COPYRIGHT 2008 STMicroelectronics *****END OF FILE****/
