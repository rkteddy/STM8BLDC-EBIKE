   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
   3                     ; Optimizer V4.2.8 - 03 Dec 2008
  34                     ; 44 @far @interrupt void NonHandledInterrupt(void)
  34                     ; 45 {
  35                     .text:	section	.text,new
  36  0000               f_NonHandledInterrupt:
  40                     ; 49 }
  43  0000 80            	iret	
  65                     ; 58 @far @interrupt void TRAP_IRQHandler(void)
  65                     ; 59 {
  66                     .text:	section	.text,new
  67  0000               f_TRAP_IRQHandler:
  71                     ; 63 }
  74  0000 80            	iret	
  96                     ; 89 @far @interrupt void TLI_IRQHandler(void)
  96                     ; 90 #else /* _RAISONANCE_ */
  96                     ; 91 void TLI_IRQHandler(void) interrupt 0
  96                     ; 92 #endif /* _COSMIC_ */
  96                     ; 93 {
  97                     .text:	section	.text,new
  98  0000               f_TLI_IRQHandler:
 102                     ; 97 }
 105  0000 80            	iret	
 127                     ; 107 @far @interrupt void AWU_IRQHandler(void)
 127                     ; 108 #else /* _RAISONANCE_ */
 127                     ; 109 void AWU_IRQHandler(void) interrupt 1
 127                     ; 110 #endif /* _COSMIC_ */	
 127                     ; 111 {
 128                     .text:	section	.text,new
 129  0000               f_AWU_IRQHandler:
 133                     ; 115 }
 136  0000 80            	iret	
 158                     ; 125 @far @interrupt void CLK_IRQHandler(void)
 158                     ; 126 #else /* _RAISONANCE_ */
 158                     ; 127 void CLK_IRQHandler(void) interrupt 2
 158                     ; 128 #endif /* _COSMIC_ */
 158                     ; 129 {
 159                     .text:	section	.text,new
 160  0000               f_CLK_IRQHandler:
 164                     ; 133 }
 167  0000 80            	iret	
 190                     ; 143 @far @interrupt void EXTI_PORTA_IRQHandler(void)
 190                     ; 144 #else /* _RAISONANCE_ */
 190                     ; 145 void EXTI_PORTA_IRQHandler(void) interrupt 3
 190                     ; 146 #endif /* _COSMIC_ */
 190                     ; 147 {
 191                     .text:	section	.text,new
 192  0000               f_EXTI_PORTA_IRQHandler:
 196                     ; 151 }
 199  0000 80            	iret	
 222                     ; 161 @far @interrupt void EXTI_PORTB_IRQHandler(void)
 222                     ; 162 #else /* _RAISONANCE_ */
 222                     ; 163 void EXTI_PORTB_IRQHandler(void) interrupt 4
 222                     ; 164 #endif /* _COSMIC_ */
 222                     ; 165 {
 223                     .text:	section	.text,new
 224  0000               f_EXTI_PORTB_IRQHandler:
 228                     ; 169 }
 231  0000 80            	iret	
 254                     ; 179 @far @interrupt void EXTI_PORTC_IRQHandler(void)
 254                     ; 180 #else /* _RAISONANCE_ */
 254                     ; 181 void EXTI_PORTC_IRQHandler(void) interrupt 5
 254                     ; 182 #endif /* _COSMIC_ */
 254                     ; 183 {
 255                     .text:	section	.text,new
 256  0000               f_EXTI_PORTC_IRQHandler:
 260                     ; 187 }
 263  0000 80            	iret	
 286                     ; 215 @far @interrupt void EXTI_PORTE_IRQHandler(void)
 286                     ; 216 #else /* _RAISONANCE_ */
 286                     ; 217 void EXTI_PORTE_IRQHandler(void) interrupt 7
 286                     ; 218 #endif /* _COSMIC_ */
 286                     ; 219 {
 287                     .text:	section	.text,new
 288  0000               f_EXTI_PORTE_IRQHandler:
 292                     ; 223 }
 295  0000 80            	iret	
 318                     ; 233 @far @interrupt void EXTI_PORTF_IRQHandler(void)
 318                     ; 234 #else /* _RAISONANCE_ */
 318                     ; 235 void EXTI_PORTF_IRQHandler(void) interrupt 8
 318                     ; 236 #endif /* _COSMIC_ */
 318                     ; 237 {
 319                     .text:	section	.text,new
 320  0000               f_EXTI_PORTF_IRQHandler:
 324                     ; 241 }
 327  0000 80            	iret	
 349                     ; 290 @far @interrupt void SPI_IRQHandler(void)
 349                     ; 291 #else /* _RAISONANCE_ */
 349                     ; 292 void SPI_IRQHandler(void) interrupt 10
 349                     ; 293 #endif /* _COSMIC_ */
 349                     ; 294 {
 350                     .text:	section	.text,new
 351  0000               f_SPI_IRQHandler:
 355                     ; 298 }
 358  0000 80            	iret	
 381                     ; 308 @far @interrupt void TIM1_UPD_OVF_TRG_BRK_IRQHandler(void)
 381                     ; 309 #else /* _RAISONANCE_ */
 381                     ; 310 void TIM1_UPD_OVF_TRG_BRK_IRQHandler(void) interrupt 11
 381                     ; 311 #endif /* _COSMIC_ */
 381                     ; 312 {
 382                     .text:	section	.text,new
 383  0000               f_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
 387                     ; 316 }
 390  0000 80            	iret	
 413                     ; 326 @far @interrupt void TIM1_CAP_COM_IRQHandler(void)
 413                     ; 327 #else /* _RAISONANCE_ */
 413                     ; 328 void TIM1_CAP_COM_IRQHandler(void) interrupt 12
 413                     ; 329 #endif /* _COSMIC_ */
 413                     ; 330 {
 414                     .text:	section	.text,new
 415  0000               f_TIM1_CAP_COM_IRQHandler:
 419                     ; 334 }
 422  0000 80            	iret	
 445                     ; 345 @far @interrupt void TIM5_UPD_OVF_BRK_TRG_IRQHandler(void)
 445                     ; 346 #else /* _RAISONANCE_ */
 445                     ; 347 void TIM5_UPD_OVF_BRK_TRG_IRQHandler(void) interrupt 13
 445                     ; 348 #endif /* _COSMIC_ */
 445                     ; 349 {
 446                     .text:	section	.text,new
 447  0000               f_TIM5_UPD_OVF_BRK_TRG_IRQHandler:
 451                     ; 353 }
 454  0000 80            	iret	
 477                     ; 447 @far @interrupt void UART1_TX_IRQHandler(void)
 477                     ; 448 #else /* _RAISONANCE_ */
 477                     ; 449 void UART1_TX_IRQHandler(void) interrupt 17
 477                     ; 450 #endif /* _COSMIC_ */
 477                     ; 451 {
 478                     .text:	section	.text,new
 479  0000               f_UART1_TX_IRQHandler:
 483                     ; 455 }
 486  0000 80            	iret	
 509                     ; 465 @far @interrupt void UART1_RX_IRQHandler(void)
 509                     ; 466 #else /* _RAISONANCE_ */
 509                     ; 467 void UART1_RX_IRQHandler(void) interrupt 18
 509                     ; 468 #endif /* _COSMIC_ */
 509                     ; 469 {
 510                     .text:	section	.text,new
 511  0000               f_UART1_RX_IRQHandler:
 515                     ; 473 }
 518  0000 80            	iret	
 540                     ; 484 @far @interrupt void I2C_IRQHandler(void)
 540                     ; 485 #else /* _RAISONANCE_ */
 540                     ; 486 void I2C_IRQHandler(void) interrupt 19
 540                     ; 487 #endif /* _COSMIC_ */
 540                     ; 488 {
 541                     .text:	section	.text,new
 542  0000               f_I2C_IRQHandler:
 546                     ; 492 }
 549  0000 80            	iret	
 571                     ; 597 @far @interrupt void ADC1_IRQHandler(void)
 571                     ; 598 #else /* _RAISONANCE_ */
 571                     ; 599 void ADC1_IRQHandler(void) interrupt 22
 571                     ; 600 #endif /* _COSMIC_ */
 571                     ; 601 {
 572                     .text:	section	.text,new
 573  0000               f_ADC1_IRQHandler:
 577                     ; 605 }
 580  0000 80            	iret	
 603                     ; 654 @far @interrupt void EEPROM_EEC_IRQHandler(void)
 603                     ; 655 #else /* _RAISONANCE_ */
 603                     ; 656 void EEPROM_EEC_IRQHandler(void) interrupt 24
 603                     ; 657 #endif /* _COSMIC_ */
 603                     ; 658 {
 604                     .text:	section	.text,new
 605  0000               f_EEPROM_EEC_IRQHandler:
 609                     ; 662 }
 612  0000 80            	iret	
 624                     	xdef	f_EEPROM_EEC_IRQHandler
 625                     	xdef	f_ADC1_IRQHandler
 626                     	xdef	f_I2C_IRQHandler
 627                     	xdef	f_UART1_RX_IRQHandler
 628                     	xdef	f_UART1_TX_IRQHandler
 629                     	xdef	f_TIM5_UPD_OVF_BRK_TRG_IRQHandler
 630                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
 631                     	xdef	f_TIM1_CAP_COM_IRQHandler
 632                     	xdef	f_SPI_IRQHandler
 633                     	xdef	f_EXTI_PORTF_IRQHandler
 634                     	xdef	f_EXTI_PORTE_IRQHandler
 635                     	xdef	f_EXTI_PORTC_IRQHandler
 636                     	xdef	f_EXTI_PORTB_IRQHandler
 637                     	xdef	f_EXTI_PORTA_IRQHandler
 638                     	xdef	f_CLK_IRQHandler
 639                     	xdef	f_AWU_IRQHandler
 640                     	xdef	f_TLI_IRQHandler
 641                     	xdef	f_TRAP_IRQHandler
 642                     	xdef	f_NonHandledInterrupt
 661                     	end
