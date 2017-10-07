   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
   3                     ; Optimizer V4.2.8 - 03 Dec 2008
  33                     ; 45 void EXTI_DeInit(void)
  33                     ; 46 {
  35                     .text:	section	.text,new
  36  0000               _EXTI_DeInit:
  40                     ; 47     EXTI->CR1 = EXTI_CR1_RESET_VALUE;
  42  0000 725f50a0      	clr	20640
  43                     ; 48     EXTI->CR2 = EXTI_CR2_RESET_VALUE;
  45  0004 725f50a1      	clr	20641
  46                     ; 49 }
  49  0008 81            	ret	
 174                     ; 62 void EXTI_SetExtIntSensitivity(EXTI_Port_TypeDef Port, EXTI_Sensitivity_TypeDef SensitivityValue)
 174                     ; 63 {
 175                     .text:	section	.text,new
 176  0000               _EXTI_SetExtIntSensitivity:
 178  0000 89            	pushw	x
 179       00000000      OFST:	set	0
 182                     ; 66     assert_param(IS_EXTI_PORT_OK(Port));
 184                     ; 67     assert_param(IS_EXTI_SENSITIVITY_OK(SensitivityValue));
 186                     ; 70     switch (Port)
 188  0001 9e            	ld	a,xh
 190                     ; 92     default:
 190                     ; 93         break;
 191  0002 4d            	tnz	a
 192  0003 270e          	jreq	L12
 193  0005 4a            	dec	a
 194  0006 271a          	jreq	L32
 195  0008 4a            	dec	a
 196  0009 2725          	jreq	L52
 197  000b 4a            	dec	a
 198  000c 2731          	jreq	L72
 199  000e 4a            	dec	a
 200  000f 2745          	jreq	L13
 201  0011 2053          	jra	L311
 202  0013               L12:
 203                     ; 72     case EXTI_PORT_GPIOA:
 203                     ; 73         EXTI->CR1 &= (u8)(~EXTI_CR1_PAIS);
 205  0013 c650a0        	ld	a,20640
 206  0016 a4fc          	and	a,#252
 207  0018 c750a0        	ld	20640,a
 208                     ; 74         EXTI->CR1 |= (u8)(SensitivityValue);
 210  001b c650a0        	ld	a,20640
 211  001e 1a02          	or	a,(OFST+2,sp)
 212                     ; 75         break;
 214  0020 202f          	jp	LC001
 215  0022               L32:
 216                     ; 76     case EXTI_PORT_GPIOB:
 216                     ; 77         EXTI->CR1 &= (u8)(~EXTI_CR1_PBIS);
 218  0022 c650a0        	ld	a,20640
 219  0025 a4f3          	and	a,#243
 220  0027 c750a0        	ld	20640,a
 221                     ; 78         EXTI->CR1 |= (u8)((u8)(SensitivityValue) << 2);
 223  002a 7b02          	ld	a,(OFST+2,sp)
 224  002c 48            	sll	a
 225  002d 48            	sll	a
 226                     ; 79         break;
 228  002e 201e          	jp	LC002
 229  0030               L52:
 230                     ; 80     case EXTI_PORT_GPIOC:
 230                     ; 81         EXTI->CR1 &= (u8)(~EXTI_CR1_PCIS);
 232  0030 c650a0        	ld	a,20640
 233  0033 a4cf          	and	a,#207
 234  0035 c750a0        	ld	20640,a
 235                     ; 82         EXTI->CR1 |= (u8)((u8)(SensitivityValue) << 4);
 237  0038 7b02          	ld	a,(OFST+2,sp)
 238  003a 97            	ld	xl,a
 239  003b a610          	ld	a,#16
 240                     ; 83         break;
 242  003d 200d          	jp	LC003
 243  003f               L72:
 244                     ; 84     case EXTI_PORT_GPIOD:
 244                     ; 85         EXTI->CR1 &= (u8)(~EXTI_CR1_PDIS);
 246  003f c650a0        	ld	a,20640
 247  0042 a43f          	and	a,#63
 248  0044 c750a0        	ld	20640,a
 249                     ; 86         EXTI->CR1 |= (u8)((u8)(SensitivityValue) << 6);
 251  0047 7b02          	ld	a,(OFST+2,sp)
 252  0049 97            	ld	xl,a
 253  004a a640          	ld	a,#64
 254  004c               LC003:
 255  004c 42            	mul	x,a
 256  004d 9f            	ld	a,xl
 257  004e               LC002:
 258  004e ca50a0        	or	a,20640
 259  0051               LC001:
 260  0051 c750a0        	ld	20640,a
 261                     ; 87         break;
 263  0054 2010          	jra	L311
 264  0056               L13:
 265                     ; 88     case EXTI_PORT_GPIOE:
 265                     ; 89         EXTI->CR2 &= (u8)(~EXTI_CR2_PEIS);
 267  0056 c650a1        	ld	a,20641
 268  0059 a4fc          	and	a,#252
 269  005b c750a1        	ld	20641,a
 270                     ; 90         EXTI->CR2 |= (u8)(SensitivityValue);
 272  005e c650a1        	ld	a,20641
 273  0061 1a02          	or	a,(OFST+2,sp)
 274  0063 c750a1        	ld	20641,a
 275                     ; 91         break;
 277                     ; 92     default:
 277                     ; 93         break;
 279  0066               L311:
 280                     ; 95 }
 283  0066 85            	popw	x
 284  0067 81            	ret	
 342                     ; 104 void EXTI_SetTLISensitivity(EXTI_TLISensitivity_TypeDef SensitivityValue)
 342                     ; 105 {
 343                     .text:	section	.text,new
 344  0000               _EXTI_SetTLISensitivity:
 348                     ; 108     assert_param(IS_EXTI_TLISENSITIVITY_OK(SensitivityValue));
 350                     ; 111     EXTI->CR2 &= (u8)(~EXTI_CR2_TLIS);
 352  0000 721550a1      	bres	20641,#2
 353                     ; 112     EXTI->CR2 |= (u8)(SensitivityValue);
 355  0004 ca50a1        	or	a,20641
 356  0007 c750a1        	ld	20641,a
 357                     ; 114 }
 360  000a 81            	ret	
 406                     ; 121 EXTI_Sensitivity_TypeDef EXTI_GetExtIntSensitivity(EXTI_Port_TypeDef Port)
 406                     ; 122 {
 407                     .text:	section	.text,new
 408  0000               _EXTI_GetExtIntSensitivity:
 410  0000 88            	push	a
 411       00000001      OFST:	set	1
 414                     ; 124     u8 value = 0;
 416  0001 0f01          	clr	(OFST+0,sp)
 417                     ; 127     assert_param(IS_EXTI_PORT_OK(Port));
 419                     ; 129     switch (Port)
 422                     ; 146     default:
 422                     ; 147         break;
 423  0003 4d            	tnz	a
 424  0004 2710          	jreq	L341
 425  0006 4a            	dec	a
 426  0007 2712          	jreq	L541
 427  0009 4a            	dec	a
 428  000a 2718          	jreq	L741
 429  000c 4a            	dec	a
 430  000d 271b          	jreq	L151
 431  000f 4a            	dec	a
 432  0010 2722          	jreq	L351
 433  0012 7b01          	ld	a,(OFST+0,sp)
 434  0014 2023          	jra	LC004
 435  0016               L341:
 436                     ; 131     case EXTI_PORT_GPIOA:
 436                     ; 132         value = (u8)(EXTI->CR1 & EXTI_CR1_PAIS);
 438  0016 c650a0        	ld	a,20640
 439                     ; 133         break;
 441  0019 201c          	jp	LC005
 442  001b               L541:
 443                     ; 134     case EXTI_PORT_GPIOB:
 443                     ; 135         value = (u8)((EXTI->CR1 & EXTI_CR1_PBIS) >> 2);
 445  001b c650a0        	ld	a,20640
 446  001e a40c          	and	a,#12
 447  0020 44            	srl	a
 448  0021 44            	srl	a
 449                     ; 136         break;
 451  0022 2015          	jp	LC004
 452  0024               L741:
 453                     ; 137     case EXTI_PORT_GPIOC:
 453                     ; 138         value = (u8)((EXTI->CR1 & EXTI_CR1_PCIS) >> 4);
 455  0024 c650a0        	ld	a,20640
 456  0027 4e            	swap	a
 457                     ; 139         break;
 459  0028 200d          	jp	LC005
 460  002a               L151:
 461                     ; 140     case EXTI_PORT_GPIOD:
 461                     ; 141         value = (u8)((EXTI->CR1 & EXTI_CR1_PDIS) >> 6);
 463  002a c650a0        	ld	a,20640
 464  002d 4e            	swap	a
 465  002e a40c          	and	a,#12
 466  0030 44            	srl	a
 467  0031 44            	srl	a
 468                     ; 142         break;
 470  0032 2003          	jp	LC005
 471  0034               L351:
 472                     ; 143     case EXTI_PORT_GPIOE:
 472                     ; 144         value = (u8)(EXTI->CR2 & EXTI_CR2_PEIS);
 474  0034 c650a1        	ld	a,20641
 475  0037               LC005:
 476  0037 a403          	and	a,#3
 477  0039               LC004:
 478                     ; 145         break;
 480                     ; 146     default:
 480                     ; 147         break;
 482                     ; 150     return((EXTI_Sensitivity_TypeDef)value);
 486  0039 5b01          	addw	sp,#1
 487  003b 81            	ret	
 523                     ; 160 EXTI_TLISensitivity_TypeDef EXTI_GetTLISensitivity(void)
 523                     ; 161 {
 524                     .text:	section	.text,new
 525  0000               _EXTI_GetTLISensitivity:
 527  0000 88            	push	a
 528       00000001      OFST:	set	1
 531                     ; 166     value = (u8)(EXTI->CR2 & EXTI_CR2_TLIS);
 533  0001 c650a1        	ld	a,20641
 534  0004 a404          	and	a,#4
 535                     ; 168     return((EXTI_TLISensitivity_TypeDef)value);
 539  0006 5b01          	addw	sp,#1
 540  0008 81            	ret	
 553                     	xdef	_EXTI_GetTLISensitivity
 554                     	xdef	_EXTI_GetExtIntSensitivity
 555                     	xdef	_EXTI_SetTLISensitivity
 556                     	xdef	_EXTI_SetExtIntSensitivity
 557                     	xdef	_EXTI_DeInit
 576                     	end
