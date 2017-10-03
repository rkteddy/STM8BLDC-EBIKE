#ifndef __MC_HALL_H
#define __MC_HALL_H

#include "mc_stm8s_hall_param.h"

#ifdef HALLTEST_TIMER
void Init_HallBaseTimer(void);
void HallTimer_InitCapturePolarity(void);
#endif

void Init_TIM1(void);
void Commutation(unsigned char step,unsigned int OutPwmValue,unsigned char PWM_ON_flag);
void PWMinc(void);
void CheckBreak(void);

#ifndef HALLTEST_TIMER
void EXTI_HALL_Init(void);
void HallEXTI_Init(void);
#endif

#endif 