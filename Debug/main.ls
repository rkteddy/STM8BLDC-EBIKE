   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
   3                     ; Optimizer V4.2.8 - 03 Dec 2008
   5                     	bsct
   6  0000               L3_cnt:
   7  0000 0000          	dc.w	0
   8  0002               L5_curave:
   9  0002 00000000      	dc.w	0,0
  70                     ; 37 void fun(void)
  70                     ; 38 {
  72                     	switch	.text
  73  0000               _fun:
  77                     ; 43 	vtimer_SetTimer(VTIM0,1,fun);
  79  0000 ae0000        	ldw	x,#_fun
  80  0003 89            	pushw	x
  81  0004 ae0001        	ldw	x,#1
  82  0007 89            	pushw	x
  83  0008 4f            	clr	a
  84  0009 cd0000        	call	_vtimer_SetTimer
  86  000c 5b04          	addw	sp,#4
  87                     ; 45 	if(5==cnt)
  89  000e be00          	ldw	x,L3_cnt
  90  0010 a30005        	cpw	x,#5
  91  0013 2652          	jrne	L73
  92                     ; 48 		ADC1_ConversionConfig(ADC1_CONVERSIONMODE_SINGLE, ADC1_CHANNEL_3, ADC1_ALIGN_RIGHT);
  94  0015 4b08          	push	#8
  95  0017 ae0003        	ldw	x,#3
  96  001a 4f            	clr	a
  97  001b 95            	ld	xh,a
  98  001c cd0000        	call	_ADC1_ConversionConfig
 100  001f 84            	pop	a
 101                     ; 49 		ADC1_Cmd(ENABLE);
 103  0020 a601          	ld	a,#1
 104  0022 cd0000        	call	_ADC1_Cmd
 106                     ; 50 		ADC1_StartConversion();
 108  0025 cd0000        	call	_ADC1_StartConversion
 111  0028               L34:
 112                     ; 51 		while(!ADC1_GetFlagStatus(ADC1_FLAG_EOC));
 114  0028 a680          	ld	a,#128
 115  002a cd0000        	call	_ADC1_GetFlagStatus
 117  002d 4d            	tnz	a
 118  002e 27f8          	jreq	L34
 119                     ; 52 		ADC1_ClearFlag(ADC1_FLAG_EOC);
 121  0030 a680          	ld	a,#128
 122  0032 cd0000        	call	_ADC1_ClearFlag
 124                     ; 53 		Conversion_Val = ADC1_GetConversionValue();
 126  0035 cd0000        	call	_ADC1_GetConversionValue
 128  0038 bf00          	ldw	_Conversion_Val,x
 129                     ; 54 		if(Conversion_Val<MINVALUE)
 131  003a a60a          	ld	a,#10
 132  003c be00          	ldw	x,_hArrPwmVal
 133  003e 62            	div	x,a
 134  003f b300          	cpw	x,_Conversion_Val
 135  0041 2304          	jrule	L74
 136                     ; 55 			Conversion_Val=MINVALUE;
 138  0043 be00          	ldw	x,_hArrPwmVal
 140  0045 2011          	jp	LC001
 141  0047               L74:
 142                     ; 56 		else if(Conversion_Val>MAXVALUE)
 144  0047 be00          	ldw	x,_hArrPwmVal
 145  0049 58            	sllw	x
 146  004a 58            	sllw	x
 147  004b 58            	sllw	x
 148  004c a60a          	ld	a,#10
 149  004e 62            	div	x,a
 150  004f b300          	cpw	x,_Conversion_Val
 151  0051 240a          	jruge	L15
 152                     ; 57 			Conversion_Val=MAXVALUE;
 154  0053 be00          	ldw	x,_hArrPwmVal
 155  0055 58            	sllw	x
 156  0056 58            	sllw	x
 157  0057 58            	sllw	x
 158  0058               LC001:
 159  0058 a60a          	ld	a,#10
 160  005a 62            	div	x,a
 161  005b bf00          	ldw	_Conversion_Val,x
 162  005d               L15:
 163                     ; 58 		if(OUTPWM!=Conversion_Val)
 165  005d be02          	ldw	x,_OUTPWM
 166  005f b300          	cpw	x,_Conversion_Val
 167  0061 2704          	jreq	L73
 168                     ; 60 			OUTPWM=Conversion_Val;
 170  0063 be00          	ldw	x,_Conversion_Val
 171  0065 bf02          	ldw	_OUTPWM,x
 172  0067               L73:
 173                     ; 68 	ADC1_ConversionConfig(ADC1_CONVERSIONMODE_SINGLE, ADC1_CHANNEL_1, ADC1_ALIGN_RIGHT);
 175  0067 4b08          	push	#8
 176  0069 ae0001        	ldw	x,#1
 177  006c 4f            	clr	a
 178  006d 95            	ld	xh,a
 179  006e cd0000        	call	_ADC1_ConversionConfig
 181  0071 84            	pop	a
 182                     ; 69 	ADC1_Cmd(ENABLE);
 184  0072 a601          	ld	a,#1
 185  0074 cd0000        	call	_ADC1_Cmd
 187                     ; 70 	ADC1_StartConversion();
 189  0077 cd0000        	call	_ADC1_StartConversion
 192  007a               L16:
 193                     ; 71 	while(!ADC1_GetFlagStatus(ADC1_FLAG_EOC));
 195  007a a680          	ld	a,#128
 196  007c cd0000        	call	_ADC1_GetFlagStatus
 198  007f 4d            	tnz	a
 199  0080 27f8          	jreq	L16
 200                     ; 72 	ADC1_ClearFlag(ADC1_FLAG_EOC);
 202  0082 a680          	ld	a,#128
 203  0084 cd0000        	call	_ADC1_ClearFlag
 205                     ; 74 	curave+=(float)ADC1_GetConversionValue()/100.0;
 207  0087 cd0000        	call	_ADC1_GetConversionValue
 209  008a cd0000        	call	c_uitof
 211  008d ae000c        	ldw	x,#L17
 212  0090 cd0000        	call	c_fdiv
 214  0093 ae0002        	ldw	x,#L5_curave
 215  0096 cd0000        	call	c_fgadd
 217                     ; 75 	++cnt;
 219  0099 be00          	ldw	x,L3_cnt
 220  009b 5c            	incw	x
 221  009c bf00          	ldw	L3_cnt,x
 222                     ; 76 	if(100==cnt)
 224  009e a30064        	cpw	x,#100
 225  00a1 262b          	jrne	L57
 226                     ; 78 		cnt=0;
 228  00a3 5f            	clrw	x
 229  00a4 bf00          	ldw	L3_cnt,x
 230                     ; 79 		curave=CURRENT_PARA_A*curave+CURRENT_PARA_B;//y=12.72727x-2529.035
 232  00a6 ae0002        	ldw	x,#L5_curave
 233  00a9 cd0000        	call	c_ltor
 235  00ac ae0008        	ldw	x,#L301
 236  00af cd0000        	call	c_fmul
 238  00b2 ae0004        	ldw	x,#L311
 239  00b5 cd0000        	call	c_fadd
 241  00b8 ae0002        	ldw	x,#L5_curave
 242  00bb cd0000        	call	c_rtol
 244                     ; 80 		SendChar((unsigned char)curave);
 246  00be cd0000        	call	c_ltor
 248  00c1 cd0000        	call	c_ftol
 250  00c4 b603          	ld	a,c_lreg+3
 251  00c6 cd0000        	call	_SendChar
 253                     ; 81 		curave=0;
 255  00c9 5f            	clrw	x
 256  00ca bf04          	ldw	L5_curave+2,x
 257  00cc bf02          	ldw	L5_curave,x
 258  00ce               L57:
 259                     ; 88 }
 262  00ce 81            	ret	
 289                     ; 90 void ADC_Init(void)
 289                     ; 91 {
 290                     	switch	.text
 291  00cf               _ADC_Init:
 295                     ; 93 		GPIO_Init(GPIOB,GPIO_PIN_1,GPIO_MODE_IN_FL_NO_IT); //current average,AIN1
 297  00cf 4b00          	push	#0
 298  00d1 4b02          	push	#2
 299  00d3 ae5005        	ldw	x,#20485
 300  00d6 cd0000        	call	_GPIO_Init
 302  00d9 85            	popw	x
 303                     ; 94 		GPIO_Init(GPIOB,GPIO_PIN_3,GPIO_MODE_IN_FL_NO_IT); //speed_set,AIN3
 305  00da 4b00          	push	#0
 306  00dc 4b08          	push	#8
 307  00de ae5005        	ldw	x,#20485
 308  00e1 cd0000        	call	_GPIO_Init
 310  00e4 85            	popw	x
 311                     ; 95 		ADC1_DeInit();
 313  00e5 cd0000        	call	_ADC1_DeInit
 315                     ; 96 		ADC1_SchmittTriggerConfig(ADC1_SCHMITTTRIG_CHANNEL1, DISABLE);
 317  00e8 5f            	clrw	x
 318  00e9 a601          	ld	a,#1
 319  00eb 95            	ld	xh,a
 320  00ec cd0000        	call	_ADC1_SchmittTriggerConfig
 322                     ; 97 		ADC1_SchmittTriggerConfig(ADC1_SCHMITTTRIG_CHANNEL3, DISABLE);
 324  00ef 5f            	clrw	x
 325  00f0 a603          	ld	a,#3
 326  00f2 95            	ld	xh,a
 327  00f3 cd0000        	call	_ADC1_SchmittTriggerConfig
 329                     ; 98     ADC1_ITConfig(ADC1_IT_EOCIE, DISABLE);
 331  00f6 4b00          	push	#0
 332  00f8 ae0020        	ldw	x,#32
 333  00fb cd0000        	call	_ADC1_ITConfig
 335  00fe 84            	pop	a
 336                     ; 99 }
 339  00ff 81            	ret	
 382                     ; 101 void delay(unsigned int i)
 382                     ; 102 {
 383                     	switch	.text
 384  0100               _delay:
 386  0100 89            	pushw	x
 387  0101 89            	pushw	x
 388       00000002      OFST:	set	2
 391  0102 2008          	jra	L351
 392  0104               L151:
 393                     ; 105 		for(k=20000;k>0;--k);
 395  0104 ae4e20        	ldw	x,#20000
 396  0107               L751:
 400  0107 5a            	decw	x
 403  0108 26fd          	jrne	L751
 404  010a 1f01          	ldw	(OFST-1,sp),x
 405  010c               L351:
 406                     ; 104 	while(i--)
 408  010c 1e03          	ldw	x,(OFST+1,sp)
 409  010e 5a            	decw	x
 410  010f 1f03          	ldw	(OFST+1,sp),x
 411  0111 5c            	incw	x
 412  0112 26f0          	jrne	L151
 413                     ; 106 }
 416  0114 5b04          	addw	sp,#4
 417  0116 81            	ret	
 466                     .const:	section	.text
 467  0000               L46:
 468  0000 0000ea60      	dc.l	60000
 469                     ; 109 main()
 469                     ; 110 {
 470                     	switch	.text
 471  0117               _main:
 473  0117 89            	pushw	x
 474       00000002      OFST:	set	2
 477                     ; 113 		for(i=0;i<60000;i++);
 479  0118 5f            	clrw	x
 480  0119 1f01          	ldw	(OFST-1,sp),x
 481  011b               L302:
 485  011b 1e01          	ldw	x,(OFST-1,sp)
 486  011d 5c            	incw	x
 487  011e 1f01          	ldw	(OFST-1,sp),x
 490  0120 cd0000        	call	c_uitolx
 492  0123 ae0000        	ldw	x,#L46
 493  0126 cd0000        	call	c_lcmp
 495  0129 2ff0          	jrslt	L302
 496                     ; 114 		OUTPWM=MINVALUE;		
 498  012b be00          	ldw	x,_hArrPwmVal
 499  012d a60a          	ld	a,#10
 500  012f 62            	div	x,a
 501  0130 bf02          	ldw	_OUTPWM,x
 502                     ; 115     dev_clkInit();
 504  0132 cd0000        	call	_dev_clkInit
 506                     ; 116 		DebugInit();
 508  0135 cd0000        	call	_DebugInit
 510                     ; 118 		InitLed_GPIO();  //LED灯初始化
 512  0138 cd0000        	call	_InitLed_GPIO
 514                     ; 119 		dev_portInit();//PWMio初始化
 516  013b cd0000        	call	_dev_portInit
 518                     ; 120 		dev_vtimerInit(); //TIM5软件定时器配置 
 520  013e cd0000        	call	_dev_vtimerInit
 522                     ; 121 		ADC_Init();
 524  0141 ad8c          	call	_ADC_Init
 526                     ; 122 		vtimer_SetTimer(VTIM0,1,fun);	
 528  0143 ae0000        	ldw	x,#_fun
 529  0146 89            	pushw	x
 530  0147 ae0001        	ldw	x,#1
 531  014a 89            	pushw	x
 532  014b 4f            	clr	a
 533  014c cd0000        	call	_vtimer_SetTimer
 535  014f 5b04          	addw	sp,#4
 536                     ; 124      GPIO_WriteHigh(GPIOD,GPIO_PIN_6);
 538  0151 4b40          	push	#64
 539  0153 ae500f        	ldw	x,#20495
 540  0156 cd0000        	call	_GPIO_WriteHigh
 542  0159 84            	pop	a
 543                     ; 131     EXTI_HALL_Init();
 545  015a cd0000        	call	_EXTI_HALL_Init
 547                     ; 132 		Init_TIM1();
 549  015d cd0000        	call	_Init_TIM1
 551                     ; 133     HallEXTI_Init();
 553  0160 cd0000        	call	_HallEXTI_Init
 555  0163               L112:
 556                     ; 137 			CheckBreak();
 558  0163 cd0000        	call	_CheckBreak
 561  0166 20fb          	jra	L112
 594                     	xdef	_main
 595                     	xdef	_delay
 596                     	xdef	_ADC_Init
 597                     	xdef	_fun
 598                     	switch	.ubsct
 599  0000               _Conversion_Val:
 600  0000 0000          	ds.b	2
 601                     	xdef	_Conversion_Val
 602  0002               _OUTPWM:
 603  0002 0000          	ds.b	2
 604                     	xdef	_OUTPWM
 605                     	xref.b	_hArrPwmVal
 606                     	xref	_SendChar
 607                     	xref	_DebugInit
 608                     	xref	_dev_portInit
 609                     	xref	_HallEXTI_Init
 610                     	xref	_EXTI_HALL_Init
 611                     	xref	_CheckBreak
 612                     	xref	_Init_TIM1
 613                     	xref	_dev_vtimerInit
 614                     	xref	_vtimer_SetTimer
 615                     	xref	_dev_clkInit
 616                     	xref	_InitLed_GPIO
 617                     	xref	_GPIO_WriteHigh
 618                     	xref	_GPIO_Init
 619                     	xref	_ADC1_ClearFlag
 620                     	xref	_ADC1_GetFlagStatus
 621                     	xref	_ADC1_GetConversionValue
 622                     	xref	_ADC1_StartConversion
 623                     	xref	_ADC1_ConversionConfig
 624                     	xref	_ADC1_SchmittTriggerConfig
 625                     	xref	_ADC1_ITConfig
 626                     	xref	_ADC1_Cmd
 627                     	xref	_ADC1_DeInit
 628                     	switch	.const
 629  0004               L311:
 630  0004 c38133a5      	dc.w	-15487,13221
 631  0008               L301:
 632  0008 3fa2e8b7      	dc.w	16290,-5961
 633  000c               L17:
 634  000c 42c80000      	dc.w	17096,0
 635                     	xref.b	c_lreg
 636                     	xref.b	c_x
 656                     	xref	c_lcmp
 657                     	xref	c_uitolx
 658                     	xref	c_ftol
 659                     	xref	c_rtol
 660                     	xref	c_fadd
 661                     	xref	c_fmul
 662                     	xref	c_ltor
 663                     	xref	c_fgadd
 664                     	xref	c_fdiv
 665                     	xref	c_uitof
 666                     	end
