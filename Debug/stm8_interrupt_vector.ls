   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
   3                     ; Optimizer V4.2.8 - 03 Dec 2008
   5                     .const:	section	.text
   6  0000               __vectab:
   7  0000 82            	dc.b	130
   9  0001 00            	dc.b	page(__stext)
  10  0002 0000          	dc.w	__stext
  11  0004 82            	dc.b	130
  13  0005 00            	dc.b	page(f_TRAP_IRQHandler)
  14  0006 0000          	dc.w	f_TRAP_IRQHandler
  15  0008 82            	dc.b	130
  17  0009 00            	dc.b	page(f_TLI_IRQHandler)
  18  000a 0000          	dc.w	f_TLI_IRQHandler
  19  000c 82            	dc.b	130
  21  000d 00            	dc.b	page(f_AWU_IRQHandler)
  22  000e 0000          	dc.w	f_AWU_IRQHandler
  23  0010 82            	dc.b	130
  25  0011 00            	dc.b	page(f_CLK_IRQHandler)
  26  0012 0000          	dc.w	f_CLK_IRQHandler
  27  0014 82            	dc.b	130
  29  0015 00            	dc.b	page(f_EXTI_PORTA_IRQHandler)
  30  0016 0000          	dc.w	f_EXTI_PORTA_IRQHandler
  31  0018 82            	dc.b	130
  33  0019 00            	dc.b	page(f_EXTI_PORTB_IRQHandler)
  34  001a 0000          	dc.w	f_EXTI_PORTB_IRQHandler
  35  001c 82            	dc.b	130
  37  001d 00            	dc.b	page(f_EXTI_PORTC_IRQHandler)
  38  001e 0000          	dc.w	f_EXTI_PORTC_IRQHandler
  39  0020 82            	dc.b	130
  41  0021 00            	dc.b	page(f_EXTI_PORTD_IRQHandler)
  42  0022 0000          	dc.w	f_EXTI_PORTD_IRQHandler
  43  0024 82            	dc.b	130
  45  0025 00            	dc.b	page(f_EXTI_PORTE_IRQHandler)
  46  0026 0000          	dc.w	f_EXTI_PORTE_IRQHandler
  47  0028 82            	dc.b	130
  49  0029 00            	dc.b	page(f_EXTI_PORTF_IRQHandler)
  50  002a 0000          	dc.w	f_EXTI_PORTF_IRQHandler
  51  002c 82            	dc.b	130
  53  002d 00            	dc.b	page(f_NonHandledInterrupt)
  54  002e 0000          	dc.w	f_NonHandledInterrupt
  55  0030 82            	dc.b	130
  57  0031 00            	dc.b	page(f_SPI_IRQHandler)
  58  0032 0000          	dc.w	f_SPI_IRQHandler
  59  0034 82            	dc.b	130
  61  0035 00            	dc.b	page(f_TIM1_UPD_OVF_TRG_BRK_IRQHandler)
  62  0036 0000          	dc.w	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
  63  0038 82            	dc.b	130
  65  0039 00            	dc.b	page(f_TIM1_CAP_COM_IRQHandler)
  66  003a 0000          	dc.w	f_TIM1_CAP_COM_IRQHandler
  67  003c 82            	dc.b	130
  69  003d 00            	dc.b	page(f_TIM5_UPD_OVF_BRK_TRG_IRQHandler)
  70  003e 0000          	dc.w	f_TIM5_UPD_OVF_BRK_TRG_IRQHandler
  71  0040 82            	dc.b	130
  73  0041 00            	dc.b	page(f_TIM5_CAP_COM_IRQHandler)
  74  0042 0000          	dc.w	f_TIM5_CAP_COM_IRQHandler
  75  0044 82            	dc.b	130
  77  0045 00            	dc.b	page(f_NonHandledInterrupt)
  78  0046 0000          	dc.w	f_NonHandledInterrupt
  79  0048 82            	dc.b	130
  81  0049 00            	dc.b	page(f_NonHandledInterrupt)
  82  004a 0000          	dc.w	f_NonHandledInterrupt
  83  004c 82            	dc.b	130
  85  004d 00            	dc.b	page(f_UART1_TX_IRQHandler)
  86  004e 0000          	dc.w	f_UART1_TX_IRQHandler
  87  0050 82            	dc.b	130
  89  0051 00            	dc.b	page(f_UART1_RX_IRQHandler)
  90  0052 0000          	dc.w	f_UART1_RX_IRQHandler
  91  0054 82            	dc.b	130
  93  0055 00            	dc.b	page(f_I2C_IRQHandler)
  94  0056 0000          	dc.w	f_I2C_IRQHandler
  95  0058 82            	dc.b	130
  97  0059 00            	dc.b	page(f_NonHandledInterrupt)
  98  005a 0000          	dc.w	f_NonHandledInterrupt
  99  005c 82            	dc.b	130
 101  005d 00            	dc.b	page(f_NonHandledInterrupt)
 102  005e 0000          	dc.w	f_NonHandledInterrupt
 103  0060 82            	dc.b	130
 105  0061 00            	dc.b	page(f_ADC1_IRQHandler)
 106  0062 0000          	dc.w	f_ADC1_IRQHandler
 107  0064 82            	dc.b	130
 109  0065 00            	dc.b	page(f_TIM6_UPD_OVF_TRG_IRQHandler)
 110  0066 0000          	dc.w	f_TIM6_UPD_OVF_TRG_IRQHandler
 111  0068 82            	dc.b	130
 113  0069 00            	dc.b	page(f_EEPROM_EEC_IRQHandler)
 114  006a 0000          	dc.w	f_EEPROM_EEC_IRQHandler
 115  006c 82            	dc.b	130
 117  006d 00            	dc.b	page(f_NonHandledInterrupt)
 118  006e 0000          	dc.w	f_NonHandledInterrupt
 119  0070 82            	dc.b	130
 121  0071 00            	dc.b	page(f_NonHandledInterrupt)
 122  0072 0000          	dc.w	f_NonHandledInterrupt
 123  0074 82            	dc.b	130
 125  0075 00            	dc.b	page(f_NonHandledInterrupt)
 126  0076 0000          	dc.w	f_NonHandledInterrupt
 127  0078 82            	dc.b	130
 129  0079 00            	dc.b	page(f_NonHandledInterrupt)
 130  007a 0000          	dc.w	f_NonHandledInterrupt
 131  007c 82            	dc.b	130
 133  007d 00            	dc.b	page(f_NonHandledInterrupt)
 134  007e 0000          	dc.w	f_NonHandledInterrupt
 194                     	xdef	__vectab
 195                     	xref	f_EEPROM_EEC_IRQHandler
 196                     	xref	f_TIM6_UPD_OVF_TRG_IRQHandler
 197                     	xref	f_ADC1_IRQHandler
 198                     	xref	f_I2C_IRQHandler
 199                     	xref	f_UART1_RX_IRQHandler
 200                     	xref	f_UART1_TX_IRQHandler
 201                     	xref	f_TIM5_CAP_COM_IRQHandler
 202                     	xref	f_TIM5_UPD_OVF_BRK_TRG_IRQHandler
 203                     	xref	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
 204                     	xref	f_TIM1_CAP_COM_IRQHandler
 205                     	xref	f_SPI_IRQHandler
 206                     	xref	f_EXTI_PORTF_IRQHandler
 207                     	xref	f_EXTI_PORTE_IRQHandler
 208                     	xref	f_EXTI_PORTD_IRQHandler
 209                     	xref	f_EXTI_PORTC_IRQHandler
 210                     	xref	f_EXTI_PORTB_IRQHandler
 211                     	xref	f_EXTI_PORTA_IRQHandler
 212                     	xref	f_CLK_IRQHandler
 213                     	xref	f_AWU_IRQHandler
 214                     	xref	f_TLI_IRQHandler
 215                     	xref	f_TRAP_IRQHandler
 216                     	xref	f_NonHandledInterrupt
 217                     	xref	__stext
 236                     	end
