/**
  ******************************************************************************
  * @file function.c
  * @brief This file contains some functions that can be used in the demo.
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

/* Includes ------------------------------------------------------------------*/
#include "stm8s_lib.h"
#include "functions.h"

/* Private typedef -----------------------------------------------------------*/
/* Private define ------------------------------------------------------------*/
#define RAM1_START            0x200
#define RAM1_END              0x21F


void InitLed_GPIO(void)
{
    /* LEDs */
    GPIO_Init(GPIOD, GPIO_PIN_7, GPIO_MODE_OUT_PP_HIGH_FAST);
    GPIO_Init(GPIOD, GPIO_PIN_6, GPIO_MODE_OUT_PP_HIGH_FAST);
}

void Init_Clock(void)
{

    /* Select fCPU = 16MHz */
    CLK_SYSCLKConfig(CLK_PRESCALER_HSIDIV1);

    /* For test purpose output Fcpu on MCO pin */
    //CLK_CCOConfig(CLK_OUTPUT_CPU);

}

/******************* (C) COPYRIGHT 2008 STMicroelectronics *****END OF FILE****/
