   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
   3                     ; Optimizer V4.2.8 - 03 Dec 2008
   5                     .const:	section	.text
   6  0000               _STEP_TAB:
   7  0000 01            	dc.b	1
   8  0001 03            	dc.b	3
   9  0002 02            	dc.b	2
  10  0003 05            	dc.b	5
  11  0004 00            	dc.b	0
  12  0005 04            	dc.b	4
  13  0006               _PWM_EN1_TAB:
  14  0006 dd            	dc.b	221
  15  0007 0d            	dc.b	13
  16  0008 d0            	dc.b	208
  17  0009 dd            	dc.b	221
  18  000a 0d            	dc.b	13
  19  000b d0            	dc.b	208
  20  000c               _PWM_EN2_TAB:
  21  000c 00            	dc.b	0
  22  000d 0d            	dc.b	13
  23  000e 0d            	dc.b	13
  24  000f 00            	dc.b	0
  25  0010 0d            	dc.b	13
  26  0011 0d            	dc.b	13
  27                     	bsct
  28  0000               _hArrPwmVal:
  29  0000 0378          	dc.w	888
  30  0002               _hCntDeadDtime:
  31  0002 0000          	dc.w	0
  61                     ; 167 @far @interrupt void TIM5_CAP_COM_IRQHandler(void)
  61                     ; 168 #else /* _RAISONANCE_ */
  61                     ; 169 void TIM5_CAP_COM_IRQHandler(void) interrupt 14
  61                     ; 170 #endif /* _COSMIC_ */
  61                     ; 171 {
  62                     	switch	.text
  63  0000               f_TIM5_CAP_COM_IRQHandler:
  67                     ; 221 }
  70  0000 80            	iret	
 102                     ; 226 void Init_TIM1(void)
 102                     ; 227 {
 104                     	switch	.text
 105  0001               _Init_TIM1:
 109                     ; 229   TIM1_DeInit();
 111  0001 cd0000        	call	_TIM1_DeInit
 113                     ; 231   TIM1_TimeBaseInit(0, TIM1_COUNTERMODE_UP, hArrPwmVal, 0);
 115  0004 4b00          	push	#0
 116  0006 be00          	ldw	x,_hArrPwmVal
 117  0008 89            	pushw	x
 118  0009 4b00          	push	#0
 119  000b 5f            	clrw	x
 120  000c cd0000        	call	_TIM1_TimeBaseInit
 122  000f 5b04          	addw	sp,#4
 123                     ; 233   TIM1_OC1Init(TIM1_OCMODE_PWM1, TIM1_OUTPUTSTATE_ENABLE, TIM1_OUTPUTNSTATE_ENABLE, hArrPwmVal*0, TIM1_OCPOLARITY_HIGH, TIM1_OCNPOLARITY_LOW, TIM1_OCIDLESTATE_RESET, TIM1_OCNIDLESTATE_SET); 
 125  0011 4b2a          	push	#42
 126  0013 4b00          	push	#0
 127  0015 4b88          	push	#136
 128  0017 4b00          	push	#0
 129  0019 5f            	clrw	x
 130  001a 89            	pushw	x
 131  001b 4b44          	push	#68
 132  001d ae0011        	ldw	x,#17
 133  0020 a660          	ld	a,#96
 134  0022 95            	ld	xh,a
 135  0023 cd0000        	call	_TIM1_OC1Init
 137  0026 5b07          	addw	sp,#7
 138                     ; 235   TIM1_OC2Init(TIM1_OCMODE_PWM1, TIM1_OUTPUTSTATE_ENABLE, TIM1_OUTPUTNSTATE_ENABLE, hArrPwmVal*0, TIM1_OCPOLARITY_HIGH, TIM1_OCNPOLARITY_LOW, TIM1_OCIDLESTATE_RESET, TIM1_OCNIDLESTATE_SET); 
 140  0028 4b2a          	push	#42
 141  002a 4b00          	push	#0
 142  002c 4b88          	push	#136
 143  002e 4b00          	push	#0
 144  0030 5f            	clrw	x
 145  0031 89            	pushw	x
 146  0032 4b44          	push	#68
 147  0034 ae0011        	ldw	x,#17
 148  0037 a660          	ld	a,#96
 149  0039 95            	ld	xh,a
 150  003a cd0000        	call	_TIM1_OC2Init
 152  003d 5b07          	addw	sp,#7
 153                     ; 237   TIM1_OC3Init(TIM1_OCMODE_PWM1, TIM1_OUTPUTSTATE_ENABLE, TIM1_OUTPUTNSTATE_ENABLE, hArrPwmVal*0, TIM1_OCPOLARITY_HIGH, TIM1_OCNPOLARITY_LOW, TIM1_OCIDLESTATE_RESET, TIM1_OCNIDLESTATE_SET); 
 155  003f 4b2a          	push	#42
 156  0041 4b00          	push	#0
 157  0043 4b88          	push	#136
 158  0045 4b00          	push	#0
 159  0047 5f            	clrw	x
 160  0048 89            	pushw	x
 161  0049 4b44          	push	#68
 162  004b ae0011        	ldw	x,#17
 163  004e a660          	ld	a,#96
 164  0050 95            	ld	xh,a
 165  0051 cd0000        	call	_TIM1_OC3Init
 167  0054 5b07          	addw	sp,#7
 168                     ; 239 	TIM1_BDTRConfig( TIM1_OSSISTATE_ENABLE,  TIM1_LOCKLEVEL_1, hDeadTime , TIM1_BREAK_ENABLE,TIM1_BREAKPOLARITY_LOW, TIM1_AUTOMATICOUTPUT_ENABLE);//break
 170  0056 4b40          	push	#64
 171  0058 4b00          	push	#0
 172  005a 4b10          	push	#16
 173  005c 4b01          	push	#1
 174  005e ae0001        	ldw	x,#1
 175  0061 a604          	ld	a,#4
 176  0063 95            	ld	xh,a
 177  0064 cd0000        	call	_TIM1_BDTRConfig
 179  0067 5b04          	addw	sp,#4
 180                     ; 242   TIM1_CCPreloadControl(DISABLE);
 182  0069 4f            	clr	a
 183  006a cd0000        	call	_TIM1_CCPreloadControl
 185                     ; 244 	TIM1_Cmd(ENABLE);
 187  006d a601          	ld	a,#1
 188  006f cd0000        	call	_TIM1_Cmd
 190                     ; 245   TIM1_CtrlPWMOutputs(ENABLE);
 192  0072 a601          	ld	a,#1
 194                     ; 246 }
 197  0074 cc0000        	jp	_TIM1_CtrlPWMOutputs
 255                     ; 250 void Commutation(unsigned char step,unsigned int OutPwmValue,unsigned char PWM_ON_flag)
 255                     ; 251 {	
 256                     	switch	.text
 257  0077               _Commutation:
 259  0077 88            	push	a
 260       00000000      OFST:	set	0
 263                     ; 252    TIM1_CtrlPWMOutputs(DISABLE);
 265  0078 4f            	clr	a
 266  0079 cd0000        	call	_TIM1_CtrlPWMOutputs
 268                     ; 253 	 if(PWM_ON_flag==0)return;
 270  007c 7b06          	ld	a,(OFST+6,sp)
 271  007e 2602          	jrne	L75
 275  0080 84            	pop	a
 276  0081 81            	ret	
 277  0082               L75:
 278                     ; 255 	if(step<=1)	
 280  0082 7b01          	ld	a,(OFST+1,sp)
 281  0084 a102          	cp	a,#2
 282  0086 2408          	jruge	L16
 283                     ; 257 	TIM1_SetCompare1(OutPwmValue);
 285  0088 1e04          	ldw	x,(OFST+4,sp)
 286  008a cd0000        	call	_TIM1_SetCompare1
 288                     ; 258 	TIM1_SetCompare2(0);
 290  008d 5f            	clrw	x
 292                     ; 259 	TIM1_SetCompare3(0);
 295  008e 200a          	jp	LC001
 296  0090               L16:
 297                     ; 261 	else if(step<=3)
 299  0090 a104          	cp	a,#4
 300  0092 5f            	clrw	x
 301  0093 240b          	jruge	L56
 302                     ; 263 	TIM1_SetCompare1(0);
 304  0095 cd0000        	call	_TIM1_SetCompare1
 306                     ; 264 	TIM1_SetCompare2(OutPwmValue);
 308  0098 1e04          	ldw	x,(OFST+4,sp)
 310                     ; 265 	TIM1_SetCompare3(0);
 312  009a               LC001:
 313  009a cd0000        	call	_TIM1_SetCompare2
 315  009d 5f            	clrw	x
 318  009e 2009          	jra	L36
 319  00a0               L56:
 320                     ; 269 	TIM1_SetCompare1(0);
 322  00a0 cd0000        	call	_TIM1_SetCompare1
 324                     ; 270 	TIM1_SetCompare2(0);
 326  00a3 5f            	clrw	x
 327  00a4 cd0000        	call	_TIM1_SetCompare2
 329                     ; 271 	TIM1_SetCompare3(OutPwmValue);
 331  00a7 1e04          	ldw	x,(OFST+4,sp)
 333  00a9               L36:
 334  00a9 cd0000        	call	_TIM1_SetCompare3
 335                     ; 274 	TIM1->CCER1=PWM_EN1_TAB[step];
 337  00ac 7b01          	ld	a,(OFST+1,sp)
 338  00ae 5f            	clrw	x
 339  00af 97            	ld	xl,a
 340  00b0 d60006        	ld	a,(_PWM_EN1_TAB,x)
 341  00b3 c7525c        	ld	21084,a
 342                     ; 275 	TIM1->CCER2=PWM_EN2_TAB[step];	
 344  00b6 5f            	clrw	x
 345  00b7 7b01          	ld	a,(OFST+1,sp)
 346  00b9 97            	ld	xl,a
 347  00ba d6000c        	ld	a,(_PWM_EN2_TAB,x)
 348  00bd c7525d        	ld	21085,a
 349                     ; 276   TIM1_CtrlPWMOutputs(ENABLE);
 351  00c0 a601          	ld	a,#1
 352  00c2 cd0000        	call	_TIM1_CtrlPWMOutputs
 354                     ; 277 }
 357  00c5 84            	pop	a
 358  00c6 81            	ret	
 381                     ; 280 void EXTI_HALL_Init(void)//反电压比较设置
 381                     ; 281 {	
 382                     	switch	.text
 383  00c7               _EXTI_HALL_Init:
 387                     ; 282 	GPIOD->DDR &= (u8)(~(BIT3|BIT2|BIT4));
 389  00c7 c65011        	ld	a,20497
 390  00ca a4e3          	and	a,#227
 391  00cc c75011        	ld	20497,a
 392                     ; 283 	GPIOD->CR1|=BIT3|BIT2|BIT4;//上位输入
 394  00cf c65012        	ld	a,20498
 395  00d2 aa1c          	or	a,#28
 396  00d4 c75012        	ld	20498,a
 397                     ; 284 	GPIOD->CR2=0;
 399  00d7 725f5013      	clr	20499
 400                     ; 285 }
 403  00db 81            	ret	
 442                     ; 287 void HallEXTI_Init(void)//HALL
 442                     ; 288 	//捕获输入配置
 442                     ; 289 	{
 443                     	switch	.text
 444  00dc               _HallEXTI_Init:
 446  00dc 88            	push	a
 447       00000001      OFST:	set	1
 450                     ; 290 		u8 bHStatus = 0;	
 452  00dd 0f01          	clr	(OFST+0,sp)
 453                     ; 292 		bHStatus=(GPIO_ReadInputData(GPIOD)>>2)&0x07;
 455  00df ae500f        	ldw	x,#20495
 456  00e2 cd0000        	call	_GPIO_ReadInputData
 458  00e5 a41c          	and	a,#28
 459  00e7 44            	srl	a
 460  00e8 44            	srl	a
 461                     ; 293 	  bHStatus=STEP_TAB[bHStatus-1];
 463  00e9 5f            	clrw	x
 464  00ea 97            	ld	xl,a
 465  00eb 5a            	decw	x
 466  00ec d60000        	ld	a,(_STEP_TAB,x)
 467  00ef 6b01          	ld	(OFST+0,sp),a
 468                     ; 296 	  Commutation(bHStatus,OUTPWM,1);
 470  00f1 4b01          	push	#1
 471  00f3 be00          	ldw	x,_OUTPWM
 472  00f5 89            	pushw	x
 473  00f6 7b04          	ld	a,(OFST+3,sp)
 474  00f8 cd0077        	call	_Commutation
 476  00fb 5b03          	addw	sp,#3
 477                     ; 298 		GPIOD->CR2|=BIT3|BIT2|BIT4;
 479  00fd c65013        	ld	a,20499
 480  0100 aa1c          	or	a,#28
 481  0102 c75013        	ld	20499,a
 482                     ; 299 		enableInterrupts();
 485  0105 9a            	rim	
 487                     ; 300 		EXTI->CR1|=BIT6|BIT7;
 490  0106 c650a0        	ld	a,20640
 491  0109 aac0          	or	a,#192
 492  010b c750a0        	ld	20640,a
 493                     ; 301 	}
 496  010e 84            	pop	a
 497  010f 81            	ret	
 522                     ; 304 void CheckBreak(void)
 522                     ; 305 {
 523                     	switch	.text
 524  0110               _CheckBreak:
 528                     ; 306 	if((TIM1->BKR&0X80)==0)
 530  0110 720e526d0a    	btjt	21101,#7,L721
 531                     ; 307 		GPIO_WriteHigh(GPIOD,GPIO_PIN_7);
 533  0115 4b80          	push	#128
 534  0117 ae500f        	ldw	x,#20495
 535  011a cd0000        	call	_GPIO_WriteHigh
 538  011d 2008          	jra	L131
 539  011f               L721:
 540                     ; 309 		GPIO_WriteLow(GPIOD,GPIO_PIN_7);
 542  011f 4b80          	push	#128
 543  0121 ae500f        	ldw	x,#20495
 544  0124 cd0000        	call	_GPIO_WriteLow
 546  0127               L131:
 547  0127 84            	pop	a
 548                     ; 310 }
 551  0128 81            	ret	
 599                     ; 313 @far @interrupt void EXTI_PORTD_IRQHandler(void)
 599                     ; 314 #else /* _RAISONANCE_ */
 599                     ; 315 void EXTI_PORTD_IRQHandler(void) interrupt 6
 599                     ; 316 #endif /* _COSMIC_ */
 599                     ; 317 {
 601                     	switch	.text
 602  0129               f_EXTI_PORTD_IRQHandler:
 604       00000002      OFST:	set	2
 605  0129 3b0002        	push	c_x+2
 606  012c be00          	ldw	x,c_x
 607  012e 89            	pushw	x
 608  012f 3b0002        	push	c_y+2
 609  0132 be00          	ldw	x,c_y
 610  0134 89            	pushw	x
 611  0135 89            	pushw	x
 614                     ; 319 	u8 bHStatus = 0;
 616                     ; 324 	bHStatus=(GPIO_ReadInputData(GPIOD)>>2)&0x07;
 618  0136 ae500f        	ldw	x,#20495
 619  0139 cd0000        	call	_GPIO_ReadInputData
 621  013c a41c          	and	a,#28
 622  013e 44            	srl	a
 623  013f 44            	srl	a
 624  0140 6b01          	ld	(OFST-1,sp),a
 625                     ; 325 	for(i=0;i<250;i++);//滤波时间
 627  0142 0f02          	clr	(OFST+0,sp)
 628  0144               L551:
 632  0144 0c02          	inc	(OFST+0,sp)
 635  0146 7b02          	ld	a,(OFST+0,sp)
 636  0148 a1fa          	cp	a,#250
 637  014a 25f8          	jrult	L551
 638                     ; 326 	i=(GPIO_ReadInputData(GPIOD)>>2)&0x07;
 640  014c ae500f        	ldw	x,#20495
 641  014f cd0000        	call	_GPIO_ReadInputData
 643  0152 a41c          	and	a,#28
 644  0154 44            	srl	a
 645  0155 44            	srl	a
 646  0156 6b02          	ld	(OFST+0,sp),a
 647                     ; 327 	if(bHStatus!=i)return;
 649  0158 7b01          	ld	a,(OFST-1,sp)
 650  015a 1102          	cp	a,(OFST+0,sp)
 651  015c 2608          	jrne	L761
 654                     ; 328 	if(bHStatus==0||bHStatus==7)return;
 656  015e 7b01          	ld	a,(OFST-1,sp)
 657  0160 2704          	jreq	L761
 659  0162 a107          	cp	a,#7
 660  0164 260f          	jrne	L561
 661  0166               L761:
 665  0166 5b02          	addw	sp,#2
 666  0168 85            	popw	x
 667  0169 bf00          	ldw	c_y,x
 668  016b 320002        	pop	c_y+2
 669  016e 85            	popw	x
 670  016f bf00          	ldw	c_x,x
 671  0171 320002        	pop	c_x+2
 672  0174 80            	iret	
 673  0175               L561:
 674                     ; 332 	bHStatus=STEP_TAB[bHStatus-1];
 676  0175 5f            	clrw	x
 677  0176 97            	ld	xl,a
 678  0177 5a            	decw	x
 679  0178 d60000        	ld	a,(_STEP_TAB,x)
 680  017b 6b01          	ld	(OFST-1,sp),a
 681                     ; 335 	Commutation(bHStatus,OUTPWM,1);
 683  017d 4b01          	push	#1
 684  017f be00          	ldw	x,_OUTPWM
 685  0181 89            	pushw	x
 686  0182 7b04          	ld	a,(OFST+2,sp)
 687  0184 cd0077        	call	_Commutation
 689  0187 5b03          	addw	sp,#3
 690                     ; 336 	EXTI->CR1|=BIT6|BIT7;
 692  0189 c650a0        	ld	a,20640
 693  018c aac0          	or	a,#192
 694  018e c750a0        	ld	20640,a
 695                     ; 338 	return;
 697  0191 20d3          	jra	L761
 759                     	xdef	f_EXTI_PORTD_IRQHandler
 760                     	xdef	_CheckBreak
 761                     	xdef	_HallEXTI_Init
 762                     	xdef	_EXTI_HALL_Init
 763                     	xdef	_Init_TIM1
 764                     	xdef	f_TIM5_CAP_COM_IRQHandler
 765                     	xdef	_Commutation
 766                     	xdef	_hCntDeadDtime
 767                     	xdef	_hArrPwmVal
 768                     	xref.b	_OUTPWM
 769                     	xdef	_PWM_EN2_TAB
 770                     	xdef	_PWM_EN1_TAB
 771                     	xdef	_STEP_TAB
 772                     	xref	_TIM1_SetCompare3
 773                     	xref	_TIM1_SetCompare2
 774                     	xref	_TIM1_SetCompare1
 775                     	xref	_TIM1_CCPreloadControl
 776                     	xref	_TIM1_CtrlPWMOutputs
 777                     	xref	_TIM1_Cmd
 778                     	xref	_TIM1_BDTRConfig
 779                     	xref	_TIM1_OC3Init
 780                     	xref	_TIM1_OC2Init
 781                     	xref	_TIM1_OC1Init
 782                     	xref	_TIM1_TimeBaseInit
 783                     	xref	_TIM1_DeInit
 784                     	xref	_GPIO_ReadInputData
 785                     	xref	_GPIO_WriteLow
 786                     	xref	_GPIO_WriteHigh
 787                     	xref.b	c_x
 788                     	xref.b	c_y
 807                     	end
