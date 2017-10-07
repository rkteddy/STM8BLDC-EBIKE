   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
   3                     ; Optimizer V4.2.8 - 03 Dec 2008
  34                     ; 34 void Init_MC_Port(void)//电机控制IO初始化,6个管子IO初始化无效
  34                     ; 35 {
  36                     .text:	section	.text,new
  37  0000               _Init_MC_Port:
  41                     ; 40 		GPIO_Init(MCO0_PORT, MCO0_PIN,GPIO_MODE_OUT_PP_HIGH_FAST);
  43  0000 4bf0          	push	#240
  44  0002 4b20          	push	#32
  45  0004 ae5014        	ldw	x,#20500
  46  0007 cd0000        	call	_GPIO_Init
  48  000a 85            	popw	x
  49                     ; 45 		GPIO_Init(MCO1_PORT, MCO1_PIN,GPIO_MODE_OUT_PP_LOW_FAST);
  51  000b 4be0          	push	#224
  52  000d 4b40          	push	#64
  53  000f ae500a        	ldw	x,#20490
  54  0012 cd0000        	call	_GPIO_Init
  56  0015 85            	popw	x
  57                     ; 54 		GPIO_Init(MCO2_PORT, MCO2_PIN,GPIO_MODE_OUT_PP_HIGH_FAST);
  59  0016 4bf0          	push	#240
  60  0018 4b02          	push	#2
  61  001a ae500a        	ldw	x,#20490
  62  001d cd0000        	call	_GPIO_Init
  64  0020 85            	popw	x
  65                     ; 59 		GPIO_Init(MCO3_PORT, MCO3_PIN,GPIO_MODE_OUT_PP_LOW_FAST);
  67  0021 4be0          	push	#224
  68  0023 4b80          	push	#128
  69  0025 ae500a        	ldw	x,#20490
  70  0028 cd0000        	call	_GPIO_Init
  72  002b 85            	popw	x
  73                     ; 68 		GPIO_Init(MCO4_PORT, MCO4_PIN,GPIO_MODE_OUT_PP_HIGH_FAST);
  75  002c 4bf0          	push	#240
  76  002e 4b04          	push	#4
  77  0030 ae500a        	ldw	x,#20490
  78  0033 cd0000        	call	_GPIO_Init
  80  0036 85            	popw	x
  81                     ; 73 		GPIO_Init(MCO5_PORT, MCO5_PIN,GPIO_MODE_OUT_PP_LOW_FAST);
  83  0037 4be0          	push	#224
  84  0039 4b08          	push	#8
  85  003b ae500a        	ldw	x,#20490
  86  003e cd0000        	call	_GPIO_Init
  88  0041 85            	popw	x
  89                     ; 77 }
  92  0042 81            	ret	
 116                     ; 90 void dev_portInit(void)
 116                     ; 91 {
 117                     .text:	section	.text,new
 118  0000               _dev_portInit:
 122                     ; 92 	Init_MC_Port();
 125                     ; 96 }
 128  0000 cc0000        	jp	_Init_MC_Port
 141                     	xdef	_Init_MC_Port
 142                     	xdef	_dev_portInit
 143                     	xref	_GPIO_Init
 162                     	end
