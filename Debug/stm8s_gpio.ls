   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
   3                     ; Optimizer V4.2.8 - 03 Dec 2008
  99                     ; 45 void GPIO_DeInit(GPIO_TypeDef* GPIOx)
  99                     ; 46 {
 101                     .text:	section	.text,new
 102  0000               _GPIO_DeInit:
 106                     ; 47     GPIOx->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
 108  0000 7f            	clr	(x)
 109                     ; 48     GPIOx->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
 111  0001 6f02          	clr	(2,x)
 112                     ; 49     GPIOx->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
 114  0003 6f03          	clr	(3,x)
 115                     ; 50     GPIOx->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
 117  0005 6f04          	clr	(4,x)
 118                     ; 51 }
 121  0007 81            	ret	
 361                     ; 62 void GPIO_Init(GPIO_TypeDef* GPIOx,
 361                     ; 63                GPIO_Pin_TypeDef GPIO_Pin,
 361                     ; 64                GPIO_Mode_TypeDef GPIO_Mode)
 361                     ; 65 {
 362                     .text:	section	.text,new
 363  0000               _GPIO_Init:
 365  0000 89            	pushw	x
 366       00000000      OFST:	set	0
 369                     ; 70     assert_param(IS_GPIO_MODE_OK(GPIO_Mode));
 371                     ; 71     assert_param(IS_GPIO_PIN_OK(GPIO_Pin));
 373                     ; 77     if ((((u8)(GPIO_Mode)) & (u8)0x80) != (u8)0x00) /* Output mode */
 375  0001 7b06          	ld	a,(OFST+6,sp)
 376  0003 2a18          	jrpl	L771
 377                     ; 79         if ((((u8)(GPIO_Mode)) & (u8)0x10) != (u8)0x00) /* High level */
 379  0005 a510          	bcp	a,#16
 380  0007 2705          	jreq	L102
 381                     ; 81             GPIOx->ODR |= (u8)GPIO_Pin;
 383  0009 f6            	ld	a,(x)
 384  000a 1a05          	or	a,(OFST+5,sp)
 386  000c 2006          	jra	L302
 387  000e               L102:
 388                     ; 84             GPIOx->ODR &= (u8)(~(GPIO_Pin));
 390  000e 1e01          	ldw	x,(OFST+1,sp)
 391  0010 7b05          	ld	a,(OFST+5,sp)
 392  0012 43            	cpl	a
 393  0013 f4            	and	a,(x)
 394  0014               L302:
 395  0014 f7            	ld	(x),a
 396                     ; 87         GPIOx->DDR |= (u8)GPIO_Pin;
 398  0015 1e01          	ldw	x,(OFST+1,sp)
 399  0017 e602          	ld	a,(2,x)
 400  0019 1a05          	or	a,(OFST+5,sp)
 402  001b 2007          	jra	L502
 403  001d               L771:
 404                     ; 91         GPIOx->DDR &= (u8)(~(GPIO_Pin));
 406  001d 1e01          	ldw	x,(OFST+1,sp)
 407  001f 7b05          	ld	a,(OFST+5,sp)
 408  0021 43            	cpl	a
 409  0022 e402          	and	a,(2,x)
 410  0024               L502:
 411  0024 e702          	ld	(2,x),a
 412                     ; 98     if ((((u8)(GPIO_Mode)) & (u8)0x40) != (u8)0x00) /* Pull-Up or Push-Pull */
 414  0026 7b06          	ld	a,(OFST+6,sp)
 415  0028 a540          	bcp	a,#64
 416  002a 2706          	jreq	L702
 417                     ; 100         GPIOx->CR1 |= (u8)GPIO_Pin;
 419  002c e603          	ld	a,(3,x)
 420  002e 1a05          	or	a,(OFST+5,sp)
 422  0030 2005          	jra	L112
 423  0032               L702:
 424                     ; 103         GPIOx->CR1 &= (u8)(~(GPIO_Pin));
 426  0032 7b05          	ld	a,(OFST+5,sp)
 427  0034 43            	cpl	a
 428  0035 e403          	and	a,(3,x)
 429  0037               L112:
 430  0037 e703          	ld	(3,x),a
 431                     ; 110     if ((((u8)(GPIO_Mode)) & (u8)0x20) != (u8)0x00) /* Interrupt or Slow slope */
 433  0039 7b06          	ld	a,(OFST+6,sp)
 434  003b a520          	bcp	a,#32
 435  003d 2706          	jreq	L312
 436                     ; 112         GPIOx->CR2 |= (u8)GPIO_Pin;
 438  003f e604          	ld	a,(4,x)
 439  0041 1a05          	or	a,(OFST+5,sp)
 441  0043 2005          	jra	L512
 442  0045               L312:
 443                     ; 115         GPIOx->CR2 &= (u8)(~(GPIO_Pin));
 445  0045 7b05          	ld	a,(OFST+5,sp)
 446  0047 43            	cpl	a
 447  0048 e404          	and	a,(4,x)
 448  004a               L512:
 449  004a e704          	ld	(4,x),a
 450                     ; 118 }
 453  004c 85            	popw	x
 454  004d 81            	ret	
 500                     ; 129 void GPIO_Write(GPIO_TypeDef* GPIOx, u8 PortVal)
 500                     ; 130 {
 501                     .text:	section	.text,new
 502  0000               _GPIO_Write:
 504  0000 89            	pushw	x
 505       00000000      OFST:	set	0
 508                     ; 131     GPIOx->ODR = PortVal;
 510  0001 1e01          	ldw	x,(OFST+1,sp)
 511  0003 7b05          	ld	a,(OFST+5,sp)
 512  0005 f7            	ld	(x),a
 513                     ; 132 }
 516  0006 85            	popw	x
 517  0007 81            	ret	
 564                     ; 143 void GPIO_WriteHigh(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 564                     ; 144 {
 565                     .text:	section	.text,new
 566  0000               _GPIO_WriteHigh:
 568  0000 89            	pushw	x
 569       00000000      OFST:	set	0
 572                     ; 145     GPIOx->ODR |= (u8)PortPins;
 574  0001 f6            	ld	a,(x)
 575  0002 1a05          	or	a,(OFST+5,sp)
 576  0004 f7            	ld	(x),a
 577                     ; 146 }
 580  0005 85            	popw	x
 581  0006 81            	ret	
 628                     ; 157 void GPIO_WriteLow(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 628                     ; 158 {
 629                     .text:	section	.text,new
 630  0000               _GPIO_WriteLow:
 632  0000 89            	pushw	x
 633       00000000      OFST:	set	0
 636                     ; 159     GPIOx->ODR &= (u8)(~PortPins);
 638  0001 7b05          	ld	a,(OFST+5,sp)
 639  0003 43            	cpl	a
 640  0004 f4            	and	a,(x)
 641  0005 f7            	ld	(x),a
 642                     ; 160 }
 645  0006 85            	popw	x
 646  0007 81            	ret	
 693                     ; 171 void GPIO_WriteReverse(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 693                     ; 172 {
 694                     .text:	section	.text,new
 695  0000               _GPIO_WriteReverse:
 697  0000 89            	pushw	x
 698       00000000      OFST:	set	0
 701                     ; 173     GPIOx->ODR ^= (u8)PortPins;
 703  0001 f6            	ld	a,(x)
 704  0002 1805          	xor	a,(OFST+5,sp)
 705  0004 f7            	ld	(x),a
 706                     ; 174 }
 709  0005 85            	popw	x
 710  0006 81            	ret	
 748                     ; 183 u8 GPIO_ReadOutputData(GPIO_TypeDef* GPIOx)
 748                     ; 184 {
 749                     .text:	section	.text,new
 750  0000               _GPIO_ReadOutputData:
 754                     ; 185     return ((u8)GPIOx->ODR);
 756  0000 f6            	ld	a,(x)
 759  0001 81            	ret	
 796                     ; 195 u8 GPIO_ReadInputData(GPIO_TypeDef* GPIOx)
 796                     ; 196 {
 797                     .text:	section	.text,new
 798  0000               _GPIO_ReadInputData:
 802                     ; 197     return ((u8)GPIOx->IDR);
 804  0000 e601          	ld	a,(1,x)
 807  0002 81            	ret	
 875                     ; 210 BitStatus GPIO_ReadInputPin(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
 875                     ; 211 {
 876                     .text:	section	.text,new
 877  0000               _GPIO_ReadInputPin:
 879  0000 89            	pushw	x
 880       00000000      OFST:	set	0
 883                     ; 212     return ((BitStatus)(GPIOx->IDR & (vu8)GPIO_Pin));
 885  0001 e601          	ld	a,(1,x)
 886  0003 1405          	and	a,(OFST+5,sp)
 889  0005 85            	popw	x
 890  0006 81            	ret	
 968                     ; 223 void GPIO_ExternalPullUpConfig(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, FunctionalState NewState)
 968                     ; 224 {
 969                     .text:	section	.text,new
 970  0000               _GPIO_ExternalPullUpConfig:
 972  0000 89            	pushw	x
 973       00000000      OFST:	set	0
 976                     ; 226     assert_param(IS_GPIO_PIN_OK(GPIO_Pin));
 978                     ; 227     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 980                     ; 229     if (NewState != DISABLE) /* External Pull-Up Set*/
 982  0001 7b06          	ld	a,(OFST+6,sp)
 983  0003 2706          	jreq	L374
 984                     ; 231         GPIOx->CR1 |= (u8)GPIO_Pin;
 986  0005 e603          	ld	a,(3,x)
 987  0007 1a05          	or	a,(OFST+5,sp)
 989  0009 2007          	jra	L574
 990  000b               L374:
 991                     ; 234         GPIOx->CR1 &= (u8)(~(GPIO_Pin));
 993  000b 1e01          	ldw	x,(OFST+1,sp)
 994  000d 7b05          	ld	a,(OFST+5,sp)
 995  000f 43            	cpl	a
 996  0010 e403          	and	a,(3,x)
 997  0012               L574:
 998  0012 e703          	ld	(3,x),a
 999                     ; 236 }
1002  0014 85            	popw	x
1003  0015 81            	ret	
1016                     	xdef	_GPIO_ExternalPullUpConfig
1017                     	xdef	_GPIO_ReadInputPin
1018                     	xdef	_GPIO_ReadOutputData
1019                     	xdef	_GPIO_ReadInputData
1020                     	xdef	_GPIO_WriteReverse
1021                     	xdef	_GPIO_WriteLow
1022                     	xdef	_GPIO_WriteHigh
1023                     	xdef	_GPIO_Write
1024                     	xdef	_GPIO_Init
1025                     	xdef	_GPIO_DeInit
1044                     	end
