   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
   3                     ; Optimizer V4.2.8 - 03 Dec 2008
  33                     ; 46 void BEEP_DeInit(void)
  33                     ; 47 {
  35                     .text:	section	.text,new
  36  0000               _BEEP_DeInit:
  40                     ; 48     BEEP->CSR = BEEP_CSR_RESET_VALUE;
  42  0000 351f50f3      	mov	20723,#31
  43                     ; 49 }
  46  0004 81            	ret	
 111                     ; 59 void BEEP_Init(BEEP_Frequency_TypeDef BEEP_Frequency)
 111                     ; 60 {
 112                     .text:	section	.text,new
 113  0000               _BEEP_Init:
 115  0000 88            	push	a
 116       00000000      OFST:	set	0
 119                     ; 63     assert_param(IS_BEEP_FREQUENCY_OK(BEEP_Frequency));
 121                     ; 66     if ((BEEP->CSR & BEEP_CSR_BEEPDIV) == BEEP_CSR_BEEPDIV)
 123  0001 c650f3        	ld	a,20723
 124  0004 a41f          	and	a,#31
 125  0006 a11f          	cp	a,#31
 126  0008 2610          	jrne	L15
 127                     ; 68         BEEP->CSR &= (u8)(~BEEP_CSR_BEEPDIV); /* Clear bits */
 129  000a c650f3        	ld	a,20723
 130  000d a4e0          	and	a,#224
 131  000f c750f3        	ld	20723,a
 132                     ; 69         BEEP->CSR |= BEEP_CALIBRATION_DEFAULT;
 134  0012 c650f3        	ld	a,20723
 135  0015 aa0b          	or	a,#11
 136  0017 c750f3        	ld	20723,a
 137  001a               L15:
 138                     ; 73     BEEP->CSR &= (u8)(~BEEP_CSR_BEEPSEL);
 140  001a c650f3        	ld	a,20723
 141  001d a43f          	and	a,#63
 142  001f c750f3        	ld	20723,a
 143                     ; 74     BEEP->CSR |= (u8)(BEEP_Frequency);
 145  0022 c650f3        	ld	a,20723
 146  0025 1a01          	or	a,(OFST+1,sp)
 147  0027 c750f3        	ld	20723,a
 148                     ; 76 }
 151  002a 84            	pop	a
 152  002b 81            	ret	
 207                     ; 85 void BEEP_Cmd(FunctionalState NewState)
 207                     ; 86 {
 208                     .text:	section	.text,new
 209  0000               _BEEP_Cmd:
 213                     ; 87     if (NewState != DISABLE)
 215  0000 4d            	tnz	a
 216  0001 2705          	jreq	L101
 217                     ; 90         BEEP->CSR |= BEEP_CSR_BEEPEN;
 219  0003 721a50f3      	bset	20723,#5
 222  0007 81            	ret	
 223  0008               L101:
 224                     ; 95         BEEP->CSR &= (u8)(~BEEP_CSR_BEEPEN);
 226  0008 721b50f3      	bres	20723,#5
 227                     ; 97 }
 230  000c 81            	ret	
 283                     .const:	section	.text
 284  0000               L41:
 285  0000 000003e8      	dc.l	1000
 286                     ; 112 void BEEP_LSICalibrationConfig(u32 LSIFreqHz)
 286                     ; 113 {
 287                     .text:	section	.text,new
 288  0000               _BEEP_LSICalibrationConfig:
 290  0000 5206          	subw	sp,#6
 291       00000006      OFST:	set	6
 294                     ; 119     assert_param(IS_LSI_FREQUENCY_OK(LSIFreqHz));
 296                     ; 121     lsifreqkhz = (u16)(LSIFreqHz / 1000); /* Converts value in kHz */
 298  0002 96            	ldw	x,sp
 299  0003 1c0009        	addw	x,#OFST+3
 300  0006 cd0000        	call	c_ltor
 302  0009 ae0000        	ldw	x,#L41
 303  000c cd0000        	call	c_ludv
 305  000f be02          	ldw	x,c_lreg+2
 306  0011 1f03          	ldw	(OFST-3,sp),x
 307                     ; 125     BEEP->CSR &= (u8)(~BEEP_CSR_BEEPDIV); /* Clear bits */
 309  0013 c650f3        	ld	a,20723
 310  0016 a4e0          	and	a,#224
 311  0018 c750f3        	ld	20723,a
 312                     ; 127     A = (u16)(lsifreqkhz >> 3U); /* Division by 8, keep integer part only */
 314  001b 54            	srlw	x
 315  001c 54            	srlw	x
 316  001d 54            	srlw	x
 317  001e 1f05          	ldw	(OFST-1,sp),x
 318                     ; 129     if ((8U * A) >= ((lsifreqkhz - (8U * A)) * (1U + (2U * A))))
 320  0020 58            	sllw	x
 321  0021 58            	sllw	x
 322  0022 58            	sllw	x
 323  0023 1f01          	ldw	(OFST-5,sp),x
 324  0025 1e03          	ldw	x,(OFST-3,sp)
 325  0027 72f001        	subw	x,(OFST-5,sp)
 326  002a 1605          	ldw	y,(OFST-1,sp)
 327  002c 9058          	sllw	y
 328  002e 905c          	incw	y
 329  0030 cd0000        	call	c_imul
 331  0033 1605          	ldw	y,(OFST-1,sp)
 332  0035 9058          	sllw	y
 333  0037 9058          	sllw	y
 334  0039 bf01          	ldw	c_x+1,x
 335  003b 9058          	sllw	y
 336  003d 90b301        	cpw	y,c_x+1
 337  0040 7b06          	ld	a,(OFST+0,sp)
 338  0042 2504          	jrult	L331
 339                     ; 131         BEEP->CSR |= (u8)(A - 2U);
 341  0044 a002          	sub	a,#2
 343  0046 2001          	jra	L531
 344  0048               L331:
 345                     ; 135         BEEP->CSR |= (u8)(A - 1U);
 347  0048 4a            	dec	a
 348  0049               L531:
 349  0049 ca50f3        	or	a,20723
 350  004c c750f3        	ld	20723,a
 351                     ; 139     AWU->CSR |= AWU_CSR_MR;
 353                     ; 141 }
 356  004f 5b06          	addw	sp,#6
 357  0051 721250f0      	bset	20720,#1
 358  0055 81            	ret	
 371                     	xdef	_BEEP_LSICalibrationConfig
 372                     	xdef	_BEEP_Cmd
 373                     	xdef	_BEEP_Init
 374                     	xdef	_BEEP_DeInit
 375                     	xref.b	c_lreg
 376                     	xref.b	c_x
 395                     	xref	c_imul
 396                     	xref	c_ludv
 397                     	xref	c_ltor
 398                     	end
