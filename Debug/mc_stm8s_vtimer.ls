   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
   3                     ; Optimizer V4.2.8 - 03 Dec 2008
  38                     ; 36 void dev_vtimerInit(void)
  38                     ; 37 {
  40                     .text:	section	.text,new
  41  0000               _dev_vtimerInit:
  45                     ; 38 	TIM6_DeInit();
  47  0000 cd0000        	call	_TIM6_DeInit
  49                     ; 41 	TIM6_TimeBaseInit(TIM6_PRESCALER_128,ARRVALUE); // Setting for 1ms Delta time
  51  0003 ae007d        	ldw	x,#125
  52  0006 a607          	ld	a,#7
  53  0008 95            	ld	xh,a
  54  0009 cd0000        	call	_TIM6_TimeBaseInit
  56                     ; 44 	ITC->ISPR6 |= 0xC0;
  58  000c c67f75        	ld	a,32629
  59  000f aac0          	or	a,#192
  60  0011 c77f75        	ld	32629,a
  61                     ; 45 	ITC->ISPR6 &= 0x7F;
  63                     ; 47 	TIM6_ITConfig(TIM6_IT_UPDATE, ENABLE);
  65  0014 ae0001        	ldw	x,#1
  66  0017 721f7f75      	bres	32629,#7
  67  001b a601          	ld	a,#1
  68  001d 95            	ld	xh,a
  69  001e cd0000        	call	_TIM6_ITConfig
  71                     ; 48 	enableInterrupts();
  74  0021 9a            	rim	
  76                     ; 50 	TIM6_Cmd(ENABLE);
  79  0022 a601          	ld	a,#1
  81                     ; 51 }
  84  0024 cc0000        	jp	_TIM6_Cmd
 110                     ; 63 	@far @interrupt void TIM6_UPD_OVF_TRG_IRQHandler(void)
 110                     ; 64 {
 112                     .text:	section	.text,new
 113  0000               f_TIM6_UPD_OVF_TRG_IRQHandler:
 115  0000 3b0002        	push	c_x+2
 116  0003 be00          	ldw	x,c_x
 117  0005 89            	pushw	x
 118  0006 3b0002        	push	c_y+2
 119  0009 be00          	ldw	x,c_y
 120  000b 89            	pushw	x
 123                     ; 65 	TIM6_ClearITPendingBit(TIM6_IT_UPDATE);
 125  000c a601          	ld	a,#1
 126  000e cd0000        	call	_TIM6_ClearITPendingBit
 128                     ; 66 	vtimer_UpdateHandler();
 130  0011 cd0000        	call	_vtimer_UpdateHandler
 132                     ; 67 	return;
 135  0014 85            	popw	x
 136  0015 bf00          	ldw	c_y,x
 137  0017 320002        	pop	c_y+2
 138  001a 85            	popw	x
 139  001b bf00          	ldw	c_x,x
 140  001d 320002        	pop	c_x+2
 141  0020 80            	iret	
 153                     	xdef	f_TIM6_UPD_OVF_TRG_IRQHandler
 154                     	xdef	_dev_vtimerInit
 155                     	xref	_vtimer_UpdateHandler
 156                     	xref	_TIM6_ClearITPendingBit
 157                     	xref	_TIM6_ITConfig
 158                     	xref	_TIM6_Cmd
 159                     	xref	_TIM6_TimeBaseInit
 160                     	xref	_TIM6_DeInit
 161                     	xref.b	c_x
 162                     	xref.b	c_y
 181                     	end
