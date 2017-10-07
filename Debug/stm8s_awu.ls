   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
   3                     ; Optimizer V4.2.8 - 03 Dec 2008
   5                     .const:	section	.text
   6  0000               _APR_Array:
   7  0000 00            	dc.b	0
   8  0001 1e            	dc.b	30
   9  0002 1e            	dc.b	30
  10  0003 1e            	dc.b	30
  11  0004 1e            	dc.b	30
  12  0005 1e            	dc.b	30
  13  0006 1e            	dc.b	30
  14  0007 1e            	dc.b	30
  15  0008 1e            	dc.b	30
  16  0009 1e            	dc.b	30
  17  000a 1e            	dc.b	30
  18  000b 1e            	dc.b	30
  19  000c 1e            	dc.b	30
  20  000d 3d            	dc.b	61
  21  000e 17            	dc.b	23
  22  000f 17            	dc.b	23
  23  0010 3e            	dc.b	62
  24  0011               _TBR_Array:
  25  0011 00            	dc.b	0
  26  0012 01            	dc.b	1
  27  0013 02            	dc.b	2
  28  0014 03            	dc.b	3
  29  0015 04            	dc.b	4
  30  0016 05            	dc.b	5
  31  0017 06            	dc.b	6
  32  0018 07            	dc.b	7
  33  0019 08            	dc.b	8
  34  001a 09            	dc.b	9
  35  001b 0a            	dc.b	10
  36  001c 0b            	dc.b	11
  37  001d 0c            	dc.b	12
  38  001e 0c            	dc.b	12
  39  001f 0e            	dc.b	14
  40  0020 0f            	dc.b	15
  41  0021 0f            	dc.b	15
  70                     ; 65 void AWU_DeInit(void)
  70                     ; 66 {
  72                     .text:	section	.text,new
  73  0000               _AWU_DeInit:
  77                     ; 67     AWU->CSR = AWU_CSR_RESET_VALUE;
  79  0000 725f50f0      	clr	20720
  80                     ; 68     AWU->APR = AWU_APR_RESET_VALUE;
  82  0004 353f50f1      	mov	20721,#63
  83                     ; 69     AWU->TBR = AWU_TBR_RESET_VALUE;
  85  0008 725f50f2      	clr	20722
  86                     ; 70 }
  89  000c 81            	ret	
 251                     ; 80 void AWU_Init(AWU_Timebase_TypeDef AWU_TimeBase)
 251                     ; 81 {
 252                     .text:	section	.text,new
 253  0000               _AWU_Init:
 255       00000000      OFST:	set	0
 258                     ; 84     assert_param(IS_AWU_TIMEBASE_OK(AWU_TimeBase));
 260                     ; 87     AWU->CSR |= AWU_CSR_AWUEN;
 262  0000 721850f0      	bset	20720,#4
 263  0004 88            	push	a
 264                     ; 90     AWU->TBR &= (u8)(~AWU_TBR_AWUTB);
 266  0005 c650f2        	ld	a,20722
 267  0008 a4f0          	and	a,#240
 268  000a c750f2        	ld	20722,a
 269                     ; 91     AWU->TBR |= TBR_Array[(u8)AWU_TimeBase];
 271  000d 5f            	clrw	x
 272  000e 7b01          	ld	a,(OFST+1,sp)
 273  0010 97            	ld	xl,a
 274  0011 c650f2        	ld	a,20722
 275  0014 da0011        	or	a,(_TBR_Array,x)
 276  0017 c750f2        	ld	20722,a
 277                     ; 94     AWU->APR &= (u8)(~AWU_APR_APR);
 279  001a c650f1        	ld	a,20721
 280  001d a4c0          	and	a,#192
 281  001f c750f1        	ld	20721,a
 282                     ; 95     AWU->APR |= APR_Array[(u8)AWU_TimeBase];
 284  0022 5f            	clrw	x
 285  0023 7b01          	ld	a,(OFST+1,sp)
 286  0025 97            	ld	xl,a
 287  0026 c650f1        	ld	a,20721
 288  0029 da0000        	or	a,(_APR_Array,x)
 289  002c c750f1        	ld	20721,a
 290                     ; 97 }
 293  002f 84            	pop	a
 294  0030 81            	ret	
 349                     ; 106 void AWU_Cmd(FunctionalState NewState)
 349                     ; 107 {
 350                     .text:	section	.text,new
 351  0000               _AWU_Cmd:
 355                     ; 108     if (NewState != DISABLE)
 357  0000 4d            	tnz	a
 358  0001 2705          	jreq	L331
 359                     ; 111         AWU->CSR |= AWU_CSR_AWUEN;
 361  0003 721850f0      	bset	20720,#4
 364  0007 81            	ret	
 365  0008               L331:
 366                     ; 116         AWU->CSR &= (u8)(~AWU_CSR_AWUEN);
 368  0008 721950f0      	bres	20720,#4
 369                     ; 118 }
 372  000c 81            	ret	
 425                     	switch	.const
 426  0022               L41:
 427  0022 000003e8      	dc.l	1000
 428                     ; 133 void AWU_LSICalibrationConfig(u32 LSIFreqHz)
 428                     ; 134 {
 429                     .text:	section	.text,new
 430  0000               _AWU_LSICalibrationConfig:
 432  0000 5206          	subw	sp,#6
 433       00000006      OFST:	set	6
 436                     ; 136     u16 lsifreqkhz = 0x0;
 438                     ; 137     u16 A = 0x0;
 440                     ; 140     assert_param(IS_LSI_FREQUENCY_OK(LSIFreqHz));
 442                     ; 142     lsifreqkhz = (u16)(LSIFreqHz / 1000); /* Converts value in kHz */
 444  0002 96            	ldw	x,sp
 445  0003 1c0009        	addw	x,#OFST+3
 446  0006 cd0000        	call	c_ltor
 448  0009 ae0022        	ldw	x,#L41
 449  000c cd0000        	call	c_ludv
 451  000f be02          	ldw	x,c_lreg+2
 452  0011 1f03          	ldw	(OFST-3,sp),x
 453                     ; 146     A = (u16)(lsifreqkhz >> 2U); /* Division by 4, keep integer part only */
 455  0013 54            	srlw	x
 456  0014 54            	srlw	x
 457  0015 1f05          	ldw	(OFST-1,sp),x
 458                     ; 148     if ((4U * A) >= ((lsifreqkhz - (4U * A)) * (1U + (2U * A))))
 460  0017 58            	sllw	x
 461  0018 58            	sllw	x
 462  0019 1f01          	ldw	(OFST-5,sp),x
 463  001b 1e03          	ldw	x,(OFST-3,sp)
 464  001d 72f001        	subw	x,(OFST-5,sp)
 465  0020 1605          	ldw	y,(OFST-1,sp)
 466  0022 9058          	sllw	y
 467  0024 905c          	incw	y
 468  0026 cd0000        	call	c_imul
 470  0029 1605          	ldw	y,(OFST-1,sp)
 471  002b 9058          	sllw	y
 472  002d bf01          	ldw	c_x+1,x
 473  002f 9058          	sllw	y
 474  0031 90b301        	cpw	y,c_x+1
 475  0034 7b06          	ld	a,(OFST+0,sp)
 476  0036 2504          	jrult	L561
 477                     ; 150         AWU->APR = (u8)(A - 2U);
 479  0038 a002          	sub	a,#2
 481  003a 2001          	jra	L761
 482  003c               L561:
 483                     ; 154         AWU->APR = (u8)(A - 1U);
 485  003c 4a            	dec	a
 486  003d               L761:
 487  003d c750f1        	ld	20721,a
 488                     ; 158     AWU->CSR |= AWU_CSR_MR;
 490                     ; 160 }
 493  0040 5b06          	addw	sp,#6
 494  0042 721250f0      	bset	20720,#1
 495  0046 81            	ret	
 518                     ; 168 void AWU_IdleModeEnable(void)
 518                     ; 169 {
 519                     .text:	section	.text,new
 520  0000               _AWU_IdleModeEnable:
 524                     ; 172     AWU->CSR &= (u8)(~AWU_CSR_AWUEN);
 526  0000 721950f0      	bres	20720,#4
 527                     ; 175     AWU->TBR = (u8)(~AWU_TBR_AWUTB);
 529  0004 35f050f2      	mov	20722,#240
 530                     ; 177 }
 533  0008 81            	ret	
 556                     ; 185 void AWU_ReInitCounter(void)
 556                     ; 186 {
 557                     .text:	section	.text,new
 558  0000               _AWU_ReInitCounter:
 562                     ; 187     AWU->CSR |= AWU_CSR_MR;
 564  0000 721250f0      	bset	20720,#1
 565                     ; 188 }
 568  0004 81            	ret	
 612                     ; 197 FlagStatus AWU_GetFlagStatus(void)
 612                     ; 198 {
 613                     .text:	section	.text,new
 614  0000               _AWU_GetFlagStatus:
 618                     ; 199     return((FlagStatus)(((u8)(AWU->CSR & AWU_CSR_AWUF) == (u8)0x00) ? RESET : SET));
 620  0000 720a50f002    	btjt	20720,#5,L42
 621  0005 4f            	clr	a
 623  0006 81            	ret	
 624  0007               L42:
 625  0007 a601          	ld	a,#1
 628  0009 81            	ret	
 663                     	xdef	_TBR_Array
 664                     	xdef	_APR_Array
 665                     	xdef	_AWU_GetFlagStatus
 666                     	xdef	_AWU_ReInitCounter
 667                     	xdef	_AWU_IdleModeEnable
 668                     	xdef	_AWU_LSICalibrationConfig
 669                     	xdef	_AWU_Cmd
 670                     	xdef	_AWU_Init
 671                     	xdef	_AWU_DeInit
 672                     	xref.b	c_lreg
 673                     	xref.b	c_x
 692                     	xref	c_imul
 693                     	xref	c_ludv
 694                     	xref	c_ltor
 695                     	end
