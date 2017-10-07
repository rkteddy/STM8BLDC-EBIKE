   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
   3                     ; Optimizer V4.2.8 - 03 Dec 2008
  35                     ; 31 void dev_clkInit(void)
  35                     ; 32 {
  37                     .text:	section	.text,new
  38  0000               _dev_clkInit:
  42                     ; 33 	CLK_DeInit();
  44  0000 cd0000        	call	_CLK_DeInit
  46                     ; 34 	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);
  48  0003 a680          	ld	a,#128
  49  0005 cd0000        	call	_CLK_SYSCLKConfig
  51                     ; 40 		CLK_SYSCLKConfig(CLK_PRESCALER_HSIDIV1);
  53  0008 4f            	clr	a
  55                     ; 42 }
  58  0009 cc0000        	jp	_CLK_SYSCLKConfig
  71                     	xdef	_dev_clkInit
  72                     	xref	_CLK_SYSCLKConfig
  73                     	xref	_CLK_DeInit
  92                     	end
