   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
   3                     ; Optimizer V4.2.8 - 03 Dec 2008
  33                     ; 42 u8 ITC_GetCPUCC(void)
  33                     ; 43 {
  35                     .text:	section	.text,new
  36  0000               _ITC_GetCPUCC:
  40                     ; 45     _asm("push cc");
  43  0000 8a            	push	cc
  45                     ; 46     _asm("pop a");
  48  0001 84            	pop	a
  50                     ; 47     return; /* Ignore compiler warning, the returned value is in A register */
  53  0002 81            	ret	
  76                     ; 71 void ITC_DeInit(void)
  76                     ; 72 {
  77                     .text:	section	.text,new
  78  0000               _ITC_DeInit:
  82                     ; 73     ITC->ISPR1 = ITC_SPRX_RESET_VALUE;
  84  0000 35ff7f70      	mov	32624,#255
  85                     ; 74     ITC->ISPR2 = ITC_SPRX_RESET_VALUE;
  87  0004 35ff7f71      	mov	32625,#255
  88                     ; 75     ITC->ISPR3 = ITC_SPRX_RESET_VALUE;
  90  0008 35ff7f72      	mov	32626,#255
  91                     ; 76     ITC->ISPR4 = ITC_SPRX_RESET_VALUE;
  93  000c 35ff7f73      	mov	32627,#255
  94                     ; 77     ITC->ISPR5 = ITC_SPRX_RESET_VALUE;
  96  0010 35ff7f74      	mov	32628,#255
  97                     ; 78     ITC->ISPR6 = ITC_SPRX_RESET_VALUE;
  99  0014 35ff7f75      	mov	32629,#255
 100                     ; 79     ITC->ISPR7 = ITC_SPRX_RESET_VALUE;
 102  0018 35ff7f76      	mov	32630,#255
 103                     ; 80     ITC->ISPR8 = ITC_SPRX_RESET_VALUE;
 105  001c 35ff7f77      	mov	32631,#255
 106                     ; 81 }
 109  0020 81            	ret	
 134                     ; 89 u8 ITC_GetSoftIntStatus(void)
 134                     ; 90 {
 135                     .text:	section	.text,new
 136  0000               _ITC_GetSoftIntStatus:
 140                     ; 91     return (u8)(ITC_GetCPUCC() & CPU_CC_I1I0);
 142  0000 cd0000        	call	_ITC_GetCPUCC
 144  0003 a428          	and	a,#40
 147  0005 81            	ret	
 398                     .const:	section	.text
 399  0000               L42:
 400  0000 0021          	dc.w	L14
 401  0002 0021          	dc.w	L14
 402  0004 0021          	dc.w	L14
 403  0006 0021          	dc.w	L14
 404  0008 0026          	dc.w	L34
 405  000a 0026          	dc.w	L34
 406  000c 0026          	dc.w	L34
 407  000e 0026          	dc.w	L34
 408  0010 002b          	dc.w	L54
 409  0012 0046          	dc.w	L302
 410  0014 002b          	dc.w	L54
 411  0016 002b          	dc.w	L54
 412  0018 0030          	dc.w	L74
 413  001a 0030          	dc.w	L74
 414  001c 0030          	dc.w	L74
 415  001e 0030          	dc.w	L74
 416  0020 0035          	dc.w	L15
 417  0022 0035          	dc.w	L15
 418  0024 0035          	dc.w	L15
 419  0026 0035          	dc.w	L15
 420  0028 0046          	dc.w	L302
 421  002a 0046          	dc.w	L302
 422  002c 0046          	dc.w	L302
 423  002e 003a          	dc.w	L35
 424  0030 003f          	dc.w	L55
 425                     ; 99 ITC_PriorityLevel_TypeDef ITC_GetSoftwarePriority(ITC_Irq_TypeDef IrqNum)
 425                     ; 100 {
 426                     .text:	section	.text,new
 427  0000               _ITC_GetSoftwarePriority:
 429  0000 88            	push	a
 430  0001 89            	pushw	x
 431       00000002      OFST:	set	2
 434                     ; 102     u8 Value = 0;
 436  0002 0f02          	clr	(OFST+0,sp)
 437                     ; 106     assert_param(IS_ITC_IRQ_OK((u8)IrqNum));
 439                     ; 109     Mask = (u8)(0x03U << (((u8)IrqNum % 4U) * 2U));
 441  0004 a403          	and	a,#3
 442  0006 48            	sll	a
 443  0007 5f            	clrw	x
 444  0008 97            	ld	xl,a
 445  0009 a603          	ld	a,#3
 446  000b 5d            	tnzw	x
 447  000c 2704          	jreq	L61
 448  000e               L02:
 449  000e 48            	sll	a
 450  000f 5a            	decw	x
 451  0010 26fc          	jrne	L02
 452  0012               L61:
 453  0012 6b01          	ld	(OFST-1,sp),a
 454                     ; 111     switch (IrqNum)
 456  0014 7b03          	ld	a,(OFST+1,sp)
 458                     ; 181     default:
 458                     ; 182         break;
 459  0016 a119          	cp	a,#25
 460  0018 242c          	jruge	L302
 461  001a 5f            	clrw	x
 462  001b 97            	ld	xl,a
 463  001c 58            	sllw	x
 464  001d de0000        	ldw	x,(L42,x)
 465  0020 fc            	jp	(x)
 466  0021               L14:
 467                     ; 113     case ITC_IRQ_TLI: /* TLI software priority can be read but has no meaning */
 467                     ; 114     case ITC_IRQ_AWU:
 467                     ; 115     case ITC_IRQ_CLK:
 467                     ; 116     case ITC_IRQ_PORTA:
 467                     ; 117         Value = (u8)(ITC->ISPR1 & Mask); /* Read software priority */
 469  0021 c67f70        	ld	a,32624
 470                     ; 118         break;
 472  0024 201c          	jp	LC001
 473  0026               L34:
 474                     ; 119     case ITC_IRQ_PORTB:
 474                     ; 120     case ITC_IRQ_PORTC:
 474                     ; 121     case ITC_IRQ_PORTD:
 474                     ; 122     case ITC_IRQ_PORTE:
 474                     ; 123         Value = (u8)(ITC->ISPR2 & Mask); /* Read software priority */
 476  0026 c67f71        	ld	a,32625
 477                     ; 124         break;
 479  0029 2017          	jp	LC001
 480  002b               L54:
 481                     ; 131     case ITC_IRQ_PORTF:
 481                     ; 132 #endif /*STM8S903*/
 481                     ; 133 
 481                     ; 134     case ITC_IRQ_SPI:
 481                     ; 135     case ITC_IRQ_TIM1_OVF:
 481                     ; 136         Value = (u8)(ITC->ISPR3 & Mask); /* Read software priority */
 483  002b c67f72        	ld	a,32626
 484                     ; 137         break;
 486  002e 2012          	jp	LC001
 487  0030               L74:
 488                     ; 138     case ITC_IRQ_TIM1_CAPCOM:
 488                     ; 139 #ifdef STM8S903
 488                     ; 140     case ITC_IRQ_TIM5_OVFTRI:
 488                     ; 141     case ITC_IRQ_TIM5_CAPCOM:
 488                     ; 142 #else
 488                     ; 143     case ITC_IRQ_TIM2_OVF:
 488                     ; 144     case ITC_IRQ_TIM2_CAPCOM:
 488                     ; 145 #endif /*STM8S903*/
 488                     ; 146 
 488                     ; 147     case ITC_IRQ_TIM3_OVF:
 488                     ; 148         Value = (u8)(ITC->ISPR4 & Mask); /* Read software priority */
 490  0030 c67f73        	ld	a,32627
 491                     ; 149         break;
 493  0033 200d          	jp	LC001
 494  0035               L15:
 495                     ; 150     case ITC_IRQ_TIM3_CAPCOM:
 495                     ; 151     case ITC_IRQ_UART1_TX:
 495                     ; 152     case ITC_IRQ_UART1_RX:
 495                     ; 153     case ITC_IRQ_I2C:
 495                     ; 154         Value = (u8)(ITC->ISPR5 & Mask); /* Read software priority */
 497  0035 c67f74        	ld	a,32628
 498                     ; 155         break;
 500  0038 2008          	jp	LC001
 501  003a               L35:
 502                     ; 172     case ITC_IRQ_TIM6_OVFTRI:
 502                     ; 173 #else
 502                     ; 174     case ITC_IRQ_TIM4_OVF:
 502                     ; 175 #endif /*STM8S903*/
 502                     ; 176         Value = (u8)(ITC->ISPR6 & Mask); /* Read software priority */
 504  003a c67f75        	ld	a,32629
 505                     ; 177         break;
 507  003d 2003          	jp	LC001
 508  003f               L55:
 509                     ; 178     case ITC_IRQ_EEPROM_EEC:
 509                     ; 179         Value = (u8)(ITC->ISPR7 & Mask); /* Read software priority */
 511  003f c67f76        	ld	a,32630
 512  0042               LC001:
 513  0042 1401          	and	a,(OFST-1,sp)
 514  0044 6b02          	ld	(OFST+0,sp),a
 515                     ; 180         break;
 517                     ; 181     default:
 517                     ; 182         break;
 519  0046               L302:
 520                     ; 185     Value >>= (u8)(((u8)IrqNum % 4u) * 2u);
 522  0046 7b03          	ld	a,(OFST+1,sp)
 523  0048 a403          	and	a,#3
 524  004a 48            	sll	a
 525  004b 5f            	clrw	x
 526  004c 97            	ld	xl,a
 527  004d 7b02          	ld	a,(OFST+0,sp)
 528  004f 5d            	tnzw	x
 529  0050 2704          	jreq	L62
 530  0052               L03:
 531  0052 44            	srl	a
 532  0053 5a            	decw	x
 533  0054 26fc          	jrne	L03
 534  0056               L62:
 535                     ; 187     return((ITC_PriorityLevel_TypeDef)Value);
 539  0056 5b03          	addw	sp,#3
 540  0058 81            	ret	
 604                     	switch	.const
 605  0032               L64:
 606  0032 0036          	dc.w	L502
 607  0034 0036          	dc.w	L502
 608  0036 0036          	dc.w	L502
 609  0038 0036          	dc.w	L502
 610  003a 0048          	dc.w	L702
 611  003c 0048          	dc.w	L702
 612  003e 0048          	dc.w	L702
 613  0040 0048          	dc.w	L702
 614  0042 005a          	dc.w	L112
 615  0044 00b2          	dc.w	L162
 616  0046 005a          	dc.w	L112
 617  0048 005a          	dc.w	L112
 618  004a 006c          	dc.w	L312
 619  004c 006c          	dc.w	L312
 620  004e 006c          	dc.w	L312
 621  0050 006c          	dc.w	L312
 622  0052 007e          	dc.w	L512
 623  0054 007e          	dc.w	L512
 624  0056 007e          	dc.w	L512
 625  0058 007e          	dc.w	L512
 626  005a 00b2          	dc.w	L162
 627  005c 00b2          	dc.w	L162
 628  005e 00b2          	dc.w	L162
 629  0060 0090          	dc.w	L712
 630  0062 00a2          	dc.w	L122
 631                     ; 201 void ITC_SetSoftwarePriority(ITC_Irq_TypeDef IrqNum, ITC_PriorityLevel_TypeDef PriorityValue)
 631                     ; 202 {
 632                     .text:	section	.text,new
 633  0000               _ITC_SetSoftwarePriority:
 635  0000 89            	pushw	x
 636  0001 89            	pushw	x
 637       00000002      OFST:	set	2
 640                     ; 208     assert_param(IS_ITC_IRQ_OK((u8)IrqNum));
 642                     ; 209     assert_param(IS_ITC_PRIORITY_OK(PriorityValue));
 644                     ; 212     assert_param(IS_ITC_INTERRUPTS_DISABLED);
 646                     ; 216     Mask = (u8)(~(u8)(0x03U << (((u8)IrqNum % 4U) * 2U)));
 648  0002 9e            	ld	a,xh
 649  0003 a403          	and	a,#3
 650  0005 48            	sll	a
 651  0006 5f            	clrw	x
 652  0007 97            	ld	xl,a
 653  0008 a603          	ld	a,#3
 654  000a 5d            	tnzw	x
 655  000b 2704          	jreq	L43
 656  000d               L63:
 657  000d 48            	sll	a
 658  000e 5a            	decw	x
 659  000f 26fc          	jrne	L63
 660  0011               L43:
 661  0011 43            	cpl	a
 662  0012 6b01          	ld	(OFST-1,sp),a
 663                     ; 219     NewPriority = (u8)((u8)(PriorityValue) << (((u8)IrqNum % 4U) * 2U));
 665  0014 7b03          	ld	a,(OFST+1,sp)
 666  0016 a403          	and	a,#3
 667  0018 48            	sll	a
 668  0019 5f            	clrw	x
 669  001a 97            	ld	xl,a
 670  001b 7b04          	ld	a,(OFST+2,sp)
 671  001d 5d            	tnzw	x
 672  001e 2704          	jreq	L04
 673  0020               L24:
 674  0020 48            	sll	a
 675  0021 5a            	decw	x
 676  0022 26fc          	jrne	L24
 677  0024               L04:
 678  0024 6b02          	ld	(OFST+0,sp),a
 679                     ; 221     switch (IrqNum)
 681  0026 7b03          	ld	a,(OFST+1,sp)
 683                     ; 305     default:
 683                     ; 306         break;
 684  0028 a119          	cp	a,#25
 685  002a 2503cc00b2    	jruge	L162
 686  002f 5f            	clrw	x
 687  0030 97            	ld	xl,a
 688  0031 58            	sllw	x
 689  0032 de0032        	ldw	x,(L64,x)
 690  0035 fc            	jp	(x)
 691  0036               L502:
 692                     ; 224     case ITC_IRQ_TLI: /* TLI software priority can be written but has no meaning */
 692                     ; 225     case ITC_IRQ_AWU:
 692                     ; 226     case ITC_IRQ_CLK:
 692                     ; 227     case ITC_IRQ_PORTA:
 692                     ; 228         ITC->ISPR1 &= Mask;
 694  0036 c67f70        	ld	a,32624
 695  0039 1401          	and	a,(OFST-1,sp)
 696  003b c77f70        	ld	32624,a
 697                     ; 229         ITC->ISPR1 |= NewPriority;
 699  003e c67f70        	ld	a,32624
 700  0041 1a02          	or	a,(OFST+0,sp)
 701  0043 c77f70        	ld	32624,a
 702                     ; 230         break;
 704  0046 206a          	jra	L162
 705  0048               L702:
 706                     ; 232     case ITC_IRQ_PORTB:
 706                     ; 233     case ITC_IRQ_PORTC:
 706                     ; 234     case ITC_IRQ_PORTD:
 706                     ; 235     case ITC_IRQ_PORTE:
 706                     ; 236         ITC->ISPR2 &= Mask;
 708  0048 c67f71        	ld	a,32625
 709  004b 1401          	and	a,(OFST-1,sp)
 710  004d c77f71        	ld	32625,a
 711                     ; 237         ITC->ISPR2 |= NewPriority;
 713  0050 c67f71        	ld	a,32625
 714  0053 1a02          	or	a,(OFST+0,sp)
 715  0055 c77f71        	ld	32625,a
 716                     ; 238         break;
 718  0058 2058          	jra	L162
 719  005a               L112:
 720                     ; 246     case ITC_IRQ_PORTF:
 720                     ; 247 #endif /*STM8S903*/
 720                     ; 248     case ITC_IRQ_SPI:
 720                     ; 249     case ITC_IRQ_TIM1_OVF:
 720                     ; 250         ITC->ISPR3 &= Mask;
 722  005a c67f72        	ld	a,32626
 723  005d 1401          	and	a,(OFST-1,sp)
 724  005f c77f72        	ld	32626,a
 725                     ; 251         ITC->ISPR3 |= NewPriority;
 727  0062 c67f72        	ld	a,32626
 728  0065 1a02          	or	a,(OFST+0,sp)
 729  0067 c77f72        	ld	32626,a
 730                     ; 252         break;
 732  006a 2046          	jra	L162
 733  006c               L312:
 734                     ; 254     case ITC_IRQ_TIM1_CAPCOM:
 734                     ; 255 #ifdef STM8S903
 734                     ; 256     case ITC_IRQ_TIM5_OVFTRI:
 734                     ; 257     case ITC_IRQ_TIM5_CAPCOM:
 734                     ; 258 #else
 734                     ; 259     case ITC_IRQ_TIM2_OVF:
 734                     ; 260     case ITC_IRQ_TIM2_CAPCOM:
 734                     ; 261 #endif /*STM8S903*/
 734                     ; 262 
 734                     ; 263     case ITC_IRQ_TIM3_OVF:
 734                     ; 264         ITC->ISPR4 &= Mask;
 736  006c c67f73        	ld	a,32627
 737  006f 1401          	and	a,(OFST-1,sp)
 738  0071 c77f73        	ld	32627,a
 739                     ; 265         ITC->ISPR4 |= NewPriority;
 741  0074 c67f73        	ld	a,32627
 742  0077 1a02          	or	a,(OFST+0,sp)
 743  0079 c77f73        	ld	32627,a
 744                     ; 266         break;
 746  007c 2034          	jra	L162
 747  007e               L512:
 748                     ; 268     case ITC_IRQ_TIM3_CAPCOM:
 748                     ; 269     case ITC_IRQ_UART1_TX:
 748                     ; 270     case ITC_IRQ_UART1_RX:
 748                     ; 271     case ITC_IRQ_I2C:
 748                     ; 272         ITC->ISPR5 &= Mask;
 750  007e c67f74        	ld	a,32628
 751  0081 1401          	and	a,(OFST-1,sp)
 752  0083 c77f74        	ld	32628,a
 753                     ; 273         ITC->ISPR5 |= NewPriority;
 755  0086 c67f74        	ld	a,32628
 756  0089 1a02          	or	a,(OFST+0,sp)
 757  008b c77f74        	ld	32628,a
 758                     ; 274         break;
 760  008e 2022          	jra	L162
 761  0090               L712:
 762                     ; 292     case ITC_IRQ_TIM6_OVFTRI:
 762                     ; 293 #else
 762                     ; 294     case ITC_IRQ_TIM4_OVF:
 762                     ; 295 #endif /*STM8S903*/
 762                     ; 296         ITC->ISPR6 &= Mask;
 764  0090 c67f75        	ld	a,32629
 765  0093 1401          	and	a,(OFST-1,sp)
 766  0095 c77f75        	ld	32629,a
 767                     ; 297         ITC->ISPR6 |= NewPriority;
 769  0098 c67f75        	ld	a,32629
 770  009b 1a02          	or	a,(OFST+0,sp)
 771  009d c77f75        	ld	32629,a
 772                     ; 298         break;
 774  00a0 2010          	jra	L162
 775  00a2               L122:
 776                     ; 300     case ITC_IRQ_EEPROM_EEC:
 776                     ; 301         ITC->ISPR7 &= Mask;
 778  00a2 c67f76        	ld	a,32630
 779  00a5 1401          	and	a,(OFST-1,sp)
 780  00a7 c77f76        	ld	32630,a
 781                     ; 302         ITC->ISPR7 |= NewPriority;
 783  00aa c67f76        	ld	a,32630
 784  00ad 1a02          	or	a,(OFST+0,sp)
 785  00af c77f76        	ld	32630,a
 786                     ; 303         break;
 788                     ; 305     default:
 788                     ; 306         break;
 790  00b2               L162:
 791                     ; 310 }
 794  00b2 5b04          	addw	sp,#4
 795  00b4 81            	ret	
 808                     	xdef	_ITC_GetSoftwarePriority
 809                     	xdef	_ITC_SetSoftwarePriority
 810                     	xdef	_ITC_GetSoftIntStatus
 811                     	xdef	_ITC_DeInit
 812                     	xdef	_ITC_GetCPUCC
 831                     	end
