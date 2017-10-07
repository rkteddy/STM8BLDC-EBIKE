   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
   3                     ; Optimizer V4.2.8 - 03 Dec 2008
  34                     ; 32 void InitLed_GPIO(void)
  34                     ; 33 {
  36                     .text:	section	.text,new
  37  0000               _InitLed_GPIO:
  41                     ; 35     GPIO_Init(GPIOD, GPIO_PIN_7, GPIO_MODE_OUT_PP_HIGH_FAST);
  43  0000 4bf0          	push	#240
  44  0002 4b80          	push	#128
  45  0004 ae500f        	ldw	x,#20495
  46  0007 cd0000        	call	_GPIO_Init
  48  000a 85            	popw	x
  49                     ; 36     GPIO_Init(GPIOD, GPIO_PIN_6, GPIO_MODE_OUT_PP_HIGH_FAST);
  51  000b 4bf0          	push	#240
  52  000d 4b40          	push	#64
  53  000f ae500f        	ldw	x,#20495
  54  0012 cd0000        	call	_GPIO_Init
  56  0015 85            	popw	x
  57                     ; 37 }
  60  0016 81            	ret	
  84                     ; 39 void Init_Clock(void)
  84                     ; 40 {
  85                     .text:	section	.text,new
  86  0000               _Init_Clock:
  90                     ; 43     CLK_SYSCLKConfig(CLK_PRESCALER_HSIDIV1);
  92  0000 4f            	clr	a
  94                     ; 48 }
  97  0001 cc0000        	jp	_CLK_SYSCLKConfig
 110                     	xdef	_Init_Clock
 111                     	xdef	_InitLed_GPIO
 112                     	xref	_GPIO_Init
 113                     	xref	_CLK_SYSCLKConfig
 132                     	end
