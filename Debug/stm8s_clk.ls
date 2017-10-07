   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
   3                     ; Optimizer V4.2.8 - 03 Dec 2008
   5                     .const:	section	.text
   6  0000               _HSIDivFactor:
   7  0000 01            	dc.b	1
   8  0001 02            	dc.b	2
   9  0002 04            	dc.b	4
  10  0003 08            	dc.b	8
  11  0004               _CLKPrescTable:
  12  0004 01            	dc.b	1
  13  0005 02            	dc.b	2
  14  0006 04            	dc.b	4
  15  0007 08            	dc.b	8
  16  0008 0a            	dc.b	10
  17  0009 10            	dc.b	16
  18  000a 14            	dc.b	20
  19  000b 28            	dc.b	40
  48                     ; 64 void CLK_DeInit(void)
  48                     ; 65 {
  50                     .text:	section	.text,new
  51  0000               _CLK_DeInit:
  55                     ; 67     CLK->ICKR = CLK_ICKR_RESET_VALUE;
  57  0000 350150c0      	mov	20672,#1
  58                     ; 68     CLK->ECKR = CLK_ECKR_RESET_VALUE;
  60  0004 725f50c1      	clr	20673
  61                     ; 69     CLK->SWR  = CLK_SWR_RESET_VALUE;
  63  0008 35e150c4      	mov	20676,#225
  64                     ; 70     CLK->SWCR = CLK_SWCR_RESET_VALUE;
  66  000c 725f50c5      	clr	20677
  67                     ; 71     CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
  69  0010 351850c6      	mov	20678,#24
  70                     ; 72     CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
  72  0014 35ff50c7      	mov	20679,#255
  73                     ; 73     CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
  75  0018 35ff50ca      	mov	20682,#255
  76                     ; 74     CLK->CSSR = CLK_CSSR_RESET_VALUE;
  78  001c 725f50c8      	clr	20680
  79                     ; 75     CLK->CCOR = CLK_CCOR_RESET_VALUE;
  81  0020 725f50c9      	clr	20681
  83  0024               L52:
  84                     ; 76     while (CLK->CCOR & CLK_CCOR_CCOEN)
  86  0024 720050c9fb    	btjt	20681,#0,L52
  87                     ; 78     CLK->CCOR = CLK_CCOR_RESET_VALUE;
  89  0029 725f50c9      	clr	20681
  90                     ; 79     CLK->CANCCR = CLK_CANCCR_RESET_VALUE;
  92  002d 725f50cb      	clr	20683
  93                     ; 80     CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
  95  0031 725f50cc      	clr	20684
  96                     ; 81     CLK->SWIMCCR = CLK_SWIMCCR_RESET_VALUE;
  98  0035 725f50cd      	clr	20685
  99                     ; 83 }
 102  0039 81            	ret	
 158                     ; 94 void CLK_FastHaltWakeUpCmd(FunctionalState NewState)
 158                     ; 95 {
 159                     .text:	section	.text,new
 160  0000               _CLK_FastHaltWakeUpCmd:
 164                     ; 98     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 166                     ; 100     if (NewState != DISABLE)
 168  0000 4d            	tnz	a
 169  0001 2705          	jreq	L75
 170                     ; 103         CLK->ICKR |= CLK_ICKR_FHWU;
 172  0003 721450c0      	bset	20672,#2
 175  0007 81            	ret	
 176  0008               L75:
 177                     ; 108         CLK->ICKR &= (u8)(~CLK_ICKR_FHWU);
 179  0008 721550c0      	bres	20672,#2
 180                     ; 111 }
 183  000c 81            	ret	
 218                     ; 118 void CLK_HSECmd(FunctionalState NewState)
 218                     ; 119 {
 219                     .text:	section	.text,new
 220  0000               _CLK_HSECmd:
 224                     ; 122     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 226                     ; 124     if (NewState != DISABLE)
 228  0000 4d            	tnz	a
 229  0001 2705          	jreq	L101
 230                     ; 127         CLK->ECKR |= CLK_ECKR_HSEEN;
 232  0003 721050c1      	bset	20673,#0
 235  0007 81            	ret	
 236  0008               L101:
 237                     ; 132         CLK->ECKR &= (u8)(~CLK_ECKR_HSEEN);
 239  0008 721150c1      	bres	20673,#0
 240                     ; 135 }
 243  000c 81            	ret	
 278                     ; 142 void CLK_HSICmd(FunctionalState NewState)
 278                     ; 143 {
 279                     .text:	section	.text,new
 280  0000               _CLK_HSICmd:
 284                     ; 146     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 286                     ; 148     if (NewState != DISABLE)
 288  0000 4d            	tnz	a
 289  0001 2705          	jreq	L321
 290                     ; 151         CLK->ICKR |= CLK_ICKR_HSIEN;
 292  0003 721050c0      	bset	20672,#0
 295  0007 81            	ret	
 296  0008               L321:
 297                     ; 156         CLK->ICKR &= (u8)(~CLK_ICKR_HSIEN);
 299  0008 721150c0      	bres	20672,#0
 300                     ; 159 }
 303  000c 81            	ret	
 338                     ; 166 void CLK_LSICmd(FunctionalState NewState)
 338                     ; 167 {
 339                     .text:	section	.text,new
 340  0000               _CLK_LSICmd:
 344                     ; 170     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 346                     ; 172     if (NewState != DISABLE)
 348  0000 4d            	tnz	a
 349  0001 2705          	jreq	L541
 350                     ; 175         CLK->ICKR |= CLK_ICKR_LSIEN;
 352  0003 721650c0      	bset	20672,#3
 355  0007 81            	ret	
 356  0008               L541:
 357                     ; 180         CLK->ICKR &= (u8)(~CLK_ICKR_LSIEN);
 359  0008 721750c0      	bres	20672,#3
 360                     ; 183 }
 363  000c 81            	ret	
 398                     ; 191 void CLK_CCOCmd(FunctionalState NewState)
 398                     ; 192 {
 399                     .text:	section	.text,new
 400  0000               _CLK_CCOCmd:
 404                     ; 195     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 406                     ; 197     if (NewState != DISABLE)
 408  0000 4d            	tnz	a
 409  0001 2705          	jreq	L761
 410                     ; 200         CLK->CCOR |= CLK_CCOR_CCOEN;
 412  0003 721050c9      	bset	20681,#0
 415  0007 81            	ret	
 416  0008               L761:
 417                     ; 205         CLK->CCOR &= (u8)(~CLK_CCOR_CCOEN);
 419  0008 721150c9      	bres	20681,#0
 420                     ; 208 }
 423  000c 81            	ret	
 458                     ; 217 void CLK_ClockSwitchCmd(FunctionalState NewState)
 458                     ; 218 {
 459                     .text:	section	.text,new
 460  0000               _CLK_ClockSwitchCmd:
 464                     ; 221     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 466                     ; 223     if (NewState != DISABLE )
 468  0000 4d            	tnz	a
 469  0001 2705          	jreq	L112
 470                     ; 226         CLK->SWCR |= CLK_SWCR_SWEN;
 472  0003 721250c5      	bset	20677,#1
 475  0007 81            	ret	
 476  0008               L112:
 477                     ; 231         CLK->SWCR &= (u8)(~CLK_SWCR_SWEN);
 479  0008 721350c5      	bres	20677,#1
 480                     ; 234 }
 483  000c 81            	ret	
 519                     ; 244 void CLK_SlowActiveHaltWakeUpCmd(FunctionalState NewState)
 519                     ; 245 {
 520                     .text:	section	.text,new
 521  0000               _CLK_SlowActiveHaltWakeUpCmd:
 525                     ; 248     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 527                     ; 250     if (NewState != DISABLE)
 529  0000 4d            	tnz	a
 530  0001 2705          	jreq	L332
 531                     ; 253         CLK->ICKR |= CLK_ICKR_SWUAH;
 533  0003 721a50c0      	bset	20672,#5
 536  0007 81            	ret	
 537  0008               L332:
 538                     ; 258         CLK->ICKR &= (u8)(~CLK_ICKR_SWUAH);
 540  0008 721b50c0      	bres	20672,#5
 541                     ; 261 }
 544  000c 81            	ret	
 703                     ; 271 void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
 703                     ; 272 {
 704                     .text:	section	.text,new
 705  0000               _CLK_PeripheralClockConfig:
 707  0000 89            	pushw	x
 708       00000000      OFST:	set	0
 711                     ; 275     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 713                     ; 276     assert_param(IS_CLK_PERIPHERAL_OK(CLK_Peripheral));
 715                     ; 278     if (((u8)CLK_Peripheral & (u8)0x10) == 0x00)
 717  0001 9e            	ld	a,xh
 718  0002 a510          	bcp	a,#16
 719  0004 2630          	jrne	L123
 720                     ; 280         if (NewState != DISABLE)
 722  0006 7b02          	ld	a,(OFST+2,sp)
 723  0008 2714          	jreq	L323
 724                     ; 283             CLK->PCKENR1 |= (u8)((u8)1 << ((u8)CLK_Peripheral & (u8)0x0F));
 726  000a 7b01          	ld	a,(OFST+1,sp)
 727  000c a40f          	and	a,#15
 728  000e 5f            	clrw	x
 729  000f 97            	ld	xl,a
 730  0010 a601          	ld	a,#1
 731  0012 5d            	tnzw	x
 732  0013 2704          	jreq	L62
 733  0015               L03:
 734  0015 48            	sll	a
 735  0016 5a            	decw	x
 736  0017 26fc          	jrne	L03
 737  0019               L62:
 738  0019 ca50c7        	or	a,20679
 740  001c 2013          	jp	LC002
 741  001e               L323:
 742                     ; 288             CLK->PCKENR1 &= (u8)(~(u8)(((u8)1 << ((u8)CLK_Peripheral & (u8)0x0F))));
 744  001e 7b01          	ld	a,(OFST+1,sp)
 745  0020 a40f          	and	a,#15
 746  0022 5f            	clrw	x
 747  0023 97            	ld	xl,a
 748  0024 a601          	ld	a,#1
 749  0026 5d            	tnzw	x
 750  0027 2704          	jreq	L23
 751  0029               L43:
 752  0029 48            	sll	a
 753  002a 5a            	decw	x
 754  002b 26fc          	jrne	L43
 755  002d               L23:
 756  002d 43            	cpl	a
 757  002e c450c7        	and	a,20679
 758  0031               LC002:
 759  0031 c750c7        	ld	20679,a
 760  0034 202e          	jra	L723
 761  0036               L123:
 762                     ; 293         if (NewState != DISABLE)
 764  0036 7b02          	ld	a,(OFST+2,sp)
 765  0038 2714          	jreq	L133
 766                     ; 296             CLK->PCKENR2 |= (u8)((u8)1 << ((u8)CLK_Peripheral & (u8)0x0F));
 768  003a 7b01          	ld	a,(OFST+1,sp)
 769  003c a40f          	and	a,#15
 770  003e 5f            	clrw	x
 771  003f 97            	ld	xl,a
 772  0040 a601          	ld	a,#1
 773  0042 5d            	tnzw	x
 774  0043 2704          	jreq	L63
 775  0045               L04:
 776  0045 48            	sll	a
 777  0046 5a            	decw	x
 778  0047 26fc          	jrne	L04
 779  0049               L63:
 780  0049 ca50ca        	or	a,20682
 782  004c 2013          	jp	LC001
 783  004e               L133:
 784                     ; 301             CLK->PCKENR2 &= (u8)(~(u8)(((u8)1 << ((u8)CLK_Peripheral & (u8)0x0F))));
 786  004e 7b01          	ld	a,(OFST+1,sp)
 787  0050 a40f          	and	a,#15
 788  0052 5f            	clrw	x
 789  0053 97            	ld	xl,a
 790  0054 a601          	ld	a,#1
 791  0056 5d            	tnzw	x
 792  0057 2704          	jreq	L24
 793  0059               L44:
 794  0059 48            	sll	a
 795  005a 5a            	decw	x
 796  005b 26fc          	jrne	L44
 797  005d               L24:
 798  005d 43            	cpl	a
 799  005e c450ca        	and	a,20682
 800  0061               LC001:
 801  0061 c750ca        	ld	20682,a
 802  0064               L723:
 803                     ; 305 }
 806  0064 85            	popw	x
 807  0065 81            	ret	
 995                     ; 318 ErrorStatus CLK_ClockSwitchConfig(CLK_SwitchMode_TypeDef CLK_SwitchMode, CLK_Source_TypeDef CLK_NewClock, FunctionalState ITState, CLK_CurrentClockState_TypeDef CLK_CurrentClockState)
 995                     ; 319 {
 996                     .text:	section	.text,new
 997  0000               _CLK_ClockSwitchConfig:
 999  0000 89            	pushw	x
1000  0001 5204          	subw	sp,#4
1001       00000004      OFST:	set	4
1004                     ; 322     u16 DownCounter = CLK_TIMEOUT;
1006  0003 ae0491        	ldw	x,#1169
1007  0006 1f03          	ldw	(OFST-1,sp),x
1008                     ; 323     ErrorStatus Swif = ERROR;
1010  0008 7b02          	ld	a,(OFST-2,sp)
1011  000a 97            	ld	xl,a
1012                     ; 326     assert_param(IS_CLK_SOURCE_OK(CLK_NewClock));
1014                     ; 327     assert_param(IS_CLK_SWITCHMODE_OK(CLK_SwitchMode));
1016                     ; 328     assert_param(IS_FUNCTIONALSTATE_OK(ITState));
1018                     ; 329     assert_param(IS_CLK_CURRENTCLOCKSTATE_OK(CLK_CurrentClockState));
1020                     ; 332     clock_master = (CLK_Source_TypeDef)CLK->CMSR;
1022  000b c650c3        	ld	a,20675
1023  000e 6b01          	ld	(OFST-3,sp),a
1024                     ; 335     if (CLK_SwitchMode == CLK_SWITCHMODE_AUTO)
1026  0010 7b05          	ld	a,(OFST+1,sp)
1027  0012 4a            	dec	a
1028  0013 262d          	jrne	L544
1029                     ; 339         CLK->SWCR |= CLK_SWCR_SWEN;
1031  0015 721250c5      	bset	20677,#1
1032                     ; 342         if (ITState != DISABLE)
1034  0019 7b09          	ld	a,(OFST+5,sp)
1035  001b 2706          	jreq	L744
1036                     ; 344             CLK->SWCR |= CLK_SWCR_SWIEN;
1038  001d 721450c5      	bset	20677,#2
1040  0021 2004          	jra	L154
1041  0023               L744:
1042                     ; 348             CLK->SWCR &= (u8)(~CLK_SWCR_SWIEN);
1044  0023 721550c5      	bres	20677,#2
1045  0027               L154:
1046                     ; 352         CLK->SWR = (u8)CLK_NewClock;
1048  0027 7b06          	ld	a,(OFST+2,sp)
1049  0029 c750c4        	ld	20676,a
1051  002c 2003          	jra	L754
1052  002e               L354:
1053                     ; 356             DownCounter--;
1055  002e 5a            	decw	x
1056  002f 1f03          	ldw	(OFST-1,sp),x
1057  0031               L754:
1058                     ; 354         while (((CLK->SWCR & CLK_SWCR_SWBSY) && (DownCounter != 0)))
1060  0031 720150c504    	btjf	20677,#0,L364
1062  0036 1e03          	ldw	x,(OFST-1,sp)
1063  0038 26f4          	jrne	L354
1064  003a               L364:
1065                     ; 359         if (DownCounter != 0)
1067  003a 1e03          	ldw	x,(OFST-1,sp)
1068                     ; 361             Swif = SUCCESS;
1070  003c 2617          	jrne	LC003
1071                     ; 365             Swif = ERROR;
1073  003e 0f02          	clr	(OFST-2,sp)
1074  0040 2017          	jra	L174
1075  0042               L544:
1076                     ; 373         if (ITState != DISABLE)
1078  0042 7b09          	ld	a,(OFST+5,sp)
1079  0044 2706          	jreq	L374
1080                     ; 375             CLK->SWCR |= CLK_SWCR_SWIEN;
1082  0046 721450c5      	bset	20677,#2
1084  004a 2004          	jra	L574
1085  004c               L374:
1086                     ; 379             CLK->SWCR &= (u8)(~CLK_SWCR_SWIEN);
1088  004c 721550c5      	bres	20677,#2
1089  0050               L574:
1090                     ; 383         CLK->SWR = (u8)CLK_NewClock;
1092  0050 7b06          	ld	a,(OFST+2,sp)
1093  0052 c750c4        	ld	20676,a
1094                     ; 387         Swif = SUCCESS;
1096  0055               LC003:
1098  0055 a601          	ld	a,#1
1099  0057 6b02          	ld	(OFST-2,sp),a
1100  0059               L174:
1101                     ; 392     if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSI))
1103  0059 7b0a          	ld	a,(OFST+6,sp)
1104  005b 260c          	jrne	L774
1106  005d 7b01          	ld	a,(OFST-3,sp)
1107  005f a1e1          	cp	a,#225
1108  0061 2606          	jrne	L774
1109                     ; 394         CLK->ICKR &= (u8)(~CLK_ICKR_HSIEN);
1111  0063 721150c0      	bres	20672,#0
1113  0067 201e          	jra	L105
1114  0069               L774:
1115                     ; 396     else if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_LSI))
1117  0069 7b0a          	ld	a,(OFST+6,sp)
1118  006b 260c          	jrne	L305
1120  006d 7b01          	ld	a,(OFST-3,sp)
1121  006f a1d2          	cp	a,#210
1122  0071 2606          	jrne	L305
1123                     ; 398         CLK->ICKR &= (u8)(~CLK_ICKR_LSIEN);
1125  0073 721750c0      	bres	20672,#3
1127  0077 200e          	jra	L105
1128  0079               L305:
1129                     ; 400     else if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSE))
1131  0079 7b0a          	ld	a,(OFST+6,sp)
1132  007b 260a          	jrne	L105
1134  007d 7b01          	ld	a,(OFST-3,sp)
1135  007f a1b4          	cp	a,#180
1136  0081 2604          	jrne	L105
1137                     ; 402         CLK->ECKR &= (u8)(~CLK_ECKR_HSEEN);
1139  0083 721150c1      	bres	20673,#0
1140  0087               L105:
1141                     ; 405     return(Swif);
1143  0087 7b02          	ld	a,(OFST-2,sp)
1146  0089 5b06          	addw	sp,#6
1147  008b 81            	ret	
1285                     ; 415 void CLK_HSIPrescalerConfig(CLK_Prescaler_TypeDef HSIPrescaler)
1285                     ; 416 {
1286                     .text:	section	.text,new
1287  0000               _CLK_HSIPrescalerConfig:
1289  0000 88            	push	a
1290       00000000      OFST:	set	0
1293                     ; 419     assert_param(IS_CLK_HSIPRESCALER_OK(HSIPrescaler));
1295                     ; 422     CLK->CKDIVR &= (u8)(~CLK_CKDIVR_HSIDIV);
1297  0001 c650c6        	ld	a,20678
1298  0004 a4e7          	and	a,#231
1299  0006 c750c6        	ld	20678,a
1300                     ; 425     CLK->CKDIVR |= (u8)HSIPrescaler;
1302  0009 c650c6        	ld	a,20678
1303  000c 1a01          	or	a,(OFST+1,sp)
1304  000e c750c6        	ld	20678,a
1305                     ; 427 }
1308  0011 84            	pop	a
1309  0012 81            	ret	
1444                     ; 438 void CLK_CCOConfig(CLK_Output_TypeDef CLK_CCO)
1444                     ; 439 {
1445                     .text:	section	.text,new
1446  0000               _CLK_CCOConfig:
1448  0000 88            	push	a
1449       00000000      OFST:	set	0
1452                     ; 442     assert_param(IS_CLK_OUTPUT_OK(CLK_CCO));
1454                     ; 445     CLK->CCOR &= (u8)(~CLK_CCOR_CCOSEL);
1456  0001 c650c9        	ld	a,20681
1457  0004 a4e1          	and	a,#225
1458  0006 c750c9        	ld	20681,a
1459                     ; 448     CLK->CCOR |= (u8)CLK_CCO;
1461  0009 c650c9        	ld	a,20681
1462  000c 1a01          	or	a,(OFST+1,sp)
1463  000e c750c9        	ld	20681,a
1464                     ; 451     CLK->CCOR |= CLK_CCOR_CCOEN;
1466                     ; 453 }
1469  0011 84            	pop	a
1470  0012 721050c9      	bset	20681,#0
1471  0016 81            	ret	
1536                     ; 463 void CLK_ITConfig(CLK_IT_TypeDef CLK_IT, FunctionalState NewState)
1536                     ; 464 {
1537                     .text:	section	.text,new
1538  0000               _CLK_ITConfig:
1540  0000 89            	pushw	x
1541       00000000      OFST:	set	0
1544                     ; 467     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1546                     ; 468     assert_param(IS_CLK_IT_OK(CLK_IT));
1548                     ; 470     if (NewState != DISABLE)
1550  0001 9f            	ld	a,xl
1551  0002 4d            	tnz	a
1552  0003 2715          	jreq	L507
1553                     ; 472         switch (CLK_IT)
1555  0005 9e            	ld	a,xh
1557                     ; 480         default:
1557                     ; 481             break;
1558  0006 a00c          	sub	a,#12
1559  0008 270a          	jreq	L146
1560  000a a010          	sub	a,#16
1561  000c 2620          	jrne	L317
1562                     ; 474         case CLK_IT_SWIF: /* Enable the clock switch interrupt */
1562                     ; 475             CLK->SWCR |= CLK_SWCR_SWIEN;
1564  000e 721450c5      	bset	20677,#2
1565                     ; 476             break;
1567  0012 201a          	jra	L317
1568  0014               L146:
1569                     ; 477         case CLK_IT_CSSD: /* Enable the clock security system detection interrupt */
1569                     ; 478             CLK->CSSR |= CLK_CSSR_CSSDIE;
1571  0014 721450c8      	bset	20680,#2
1572                     ; 479             break;
1574  0018 2014          	jra	L317
1575                     ; 480         default:
1575                     ; 481             break;
1578  001a               L507:
1579                     ; 486         switch (CLK_IT)
1581  001a 7b01          	ld	a,(OFST+1,sp)
1583                     ; 494         default:
1583                     ; 495             break;
1584  001c a00c          	sub	a,#12
1585  001e 270a          	jreq	L746
1586  0020 a010          	sub	a,#16
1587  0022 260a          	jrne	L317
1588                     ; 488         case CLK_IT_SWIF: /* Disable the clock switch interrupt */
1588                     ; 489             CLK->SWCR  &= (u8)(~CLK_SWCR_SWIEN);
1590  0024 721550c5      	bres	20677,#2
1591                     ; 490             break;
1593  0028 2004          	jra	L317
1594  002a               L746:
1595                     ; 491         case CLK_IT_CSSD: /* Disable the clock security system detection interrupt */
1595                     ; 492             CLK->CSSR &= (u8)(~CLK_CSSR_CSSDIE);
1597  002a 721550c8      	bres	20680,#2
1598                     ; 493             break;
1599  002e               L317:
1600                     ; 499 }
1603  002e 85            	popw	x
1604  002f 81            	ret	
1605                     ; 494         default:
1605                     ; 495             break;
1641                     ; 506 void CLK_SYSCLKConfig(CLK_Prescaler_TypeDef ClockPrescaler)
1641                     ; 507 {
1642                     .text:	section	.text,new
1643  0000               _CLK_SYSCLKConfig:
1645  0000 88            	push	a
1646       00000000      OFST:	set	0
1649                     ; 510     assert_param(IS_CLK_PRESCALER_OK(ClockPrescaler));
1651                     ; 512     if (((u8)ClockPrescaler & (u8)0x80) == 0x00) /* Bit7 = 0 means HSI divider */
1653  0001 a580          	bcp	a,#128
1654  0003 260e          	jrne	L737
1655                     ; 514         CLK->CKDIVR &= (u8)(~CLK_CKDIVR_HSIDIV);
1657  0005 c650c6        	ld	a,20678
1658  0008 a4e7          	and	a,#231
1659  000a c750c6        	ld	20678,a
1660                     ; 515         CLK->CKDIVR |= (u8)((u8)ClockPrescaler & (u8)CLK_CKDIVR_HSIDIV);
1662  000d 7b01          	ld	a,(OFST+1,sp)
1663  000f a418          	and	a,#24
1665  0011 200c          	jra	L147
1666  0013               L737:
1667                     ; 519         CLK->CKDIVR &= (u8)(~CLK_CKDIVR_CPUDIV);
1669  0013 c650c6        	ld	a,20678
1670  0016 a4f8          	and	a,#248
1671  0018 c750c6        	ld	20678,a
1672                     ; 520         CLK->CKDIVR |= (u8)((u8)ClockPrescaler & (u8)CLK_CKDIVR_CPUDIV);
1674  001b 7b01          	ld	a,(OFST+1,sp)
1675  001d a407          	and	a,#7
1676  001f               L147:
1677  001f ca50c6        	or	a,20678
1678  0022 c750c6        	ld	20678,a
1679                     ; 523 }
1682  0025 84            	pop	a
1683  0026 81            	ret	
1739                     ; 530 void CLK_SWIMConfig(CLK_SWIMDivider_TypeDef CLK_SWIMDivider)
1739                     ; 531 {
1740                     .text:	section	.text,new
1741  0000               _CLK_SWIMConfig:
1745                     ; 534     assert_param(IS_CLK_SWIMDIVIDER_OK(CLK_SWIMDivider));
1747                     ; 536     if (CLK_SWIMDivider != CLK_SWIMDIVIDER_2)
1749  0000 4d            	tnz	a
1750  0001 2705          	jreq	L177
1751                     ; 539         CLK->SWIMCCR |= CLK_SWIMCCR_SWIMDIV;
1753  0003 721050cd      	bset	20685,#0
1756  0007 81            	ret	
1757  0008               L177:
1758                     ; 544         CLK->SWIMCCR &= (u8)(~CLK_SWIMCCR_SWIMDIV);
1760  0008 721150cd      	bres	20685,#0
1761                     ; 547 }
1764  000c 81            	ret	
1861                     ; 555 void CLK_CANConfig(CLK_CANDivider_TypeDef CLK_CANDivider)
1861                     ; 556 {
1862                     .text:	section	.text,new
1863  0000               _CLK_CANConfig:
1865  0000 88            	push	a
1866       00000000      OFST:	set	0
1869                     ; 559     assert_param(IS_CLK_CANDIVIDER_OK(CLK_CANDivider));
1871                     ; 562     CLK->CANCCR &= (u8)(~CLK_CANCCR_CANDIV);
1873  0001 c650cb        	ld	a,20683
1874  0004 a4f8          	and	a,#248
1875  0006 c750cb        	ld	20683,a
1876                     ; 565     CLK->CANCCR |= (u8)CLK_CANDivider;
1878  0009 c650cb        	ld	a,20683
1879  000c 1a01          	or	a,(OFST+1,sp)
1880  000e c750cb        	ld	20683,a
1881                     ; 567 }
1884  0011 84            	pop	a
1885  0012 81            	ret	
1909                     ; 577 void CLK_ClockSecuritySystemEnable(void)
1909                     ; 578 {
1910                     .text:	section	.text,new
1911  0000               _CLK_ClockSecuritySystemEnable:
1915                     ; 580     CLK->CSSR |= CLK_CSSR_CSSEN;
1917  0000 721050c8      	bset	20680,#0
1918                     ; 581 }
1921  0004 81            	ret	
1946                     ; 590 CLK_Source_TypeDef CLK_GetSYSCLKSource(void)
1946                     ; 591 {
1947                     .text:	section	.text,new
1948  0000               _CLK_GetSYSCLKSource:
1952                     ; 592     return((CLK_Source_TypeDef)CLK->CMSR);
1954  0000 c650c3        	ld	a,20675
1957  0003 81            	ret	
2020                     ; 602 u32 CLK_GetClockFreq(void)
2020                     ; 603 {
2021                     .text:	section	.text,new
2022  0000               _CLK_GetClockFreq:
2024  0000 5209          	subw	sp,#9
2025       00000009      OFST:	set	9
2028                     ; 605     u32 clockfrequency = 0;
2030  0002 96            	ldw	x,sp
2031  0003 1c0005        	addw	x,#OFST-4
2032  0006 cd0000        	call	c_ltor
2034                     ; 606     CLK_Source_TypeDef clocksource = CLK_SOURCE_HSI;
2036                     ; 607     u8 tmp = 0, presc = 0;
2040                     ; 610     clocksource = (CLK_Source_TypeDef)CLK->CMSR;
2042  0009 c650c3        	ld	a,20675
2043  000c 6b09          	ld	(OFST+0,sp),a
2044                     ; 612     if (clocksource == CLK_SOURCE_HSI)
2046  000e a1e1          	cp	a,#225
2047  0010 2634          	jrne	L1111
2048                     ; 614         tmp = (u8)(CLK->CKDIVR & CLK_CKDIVR_HSIDIV);
2050  0012 c650c6        	ld	a,20678
2051  0015 a418          	and	a,#24
2052                     ; 615         tmp = (u8)(tmp >> 3);
2054  0017 44            	srl	a
2055  0018 44            	srl	a
2056  0019 44            	srl	a
2057                     ; 616         presc = HSIDivFactor[tmp];
2059  001a 5f            	clrw	x
2060  001b 97            	ld	xl,a
2061  001c d60000        	ld	a,(_HSIDivFactor,x)
2062  001f 6b09          	ld	(OFST+0,sp),a
2063                     ; 617         clockfrequency = HSI_VALUE / presc;
2065  0021 b703          	ld	c_lreg+3,a
2066  0023 3f02          	clr	c_lreg+2
2067  0025 3f01          	clr	c_lreg+1
2068  0027 3f00          	clr	c_lreg
2069  0029 96            	ldw	x,sp
2070  002a 5c            	incw	x
2071  002b cd0000        	call	c_rtol
2073  002e ae2400        	ldw	x,#9216
2074  0031 bf02          	ldw	c_lreg+2,x
2075  0033 ae00f4        	ldw	x,#244
2076  0036 bf00          	ldw	c_lreg,x
2077  0038 96            	ldw	x,sp
2078  0039 5c            	incw	x
2079  003a cd0000        	call	c_ludv
2081  003d 96            	ldw	x,sp
2082  003e 1c0005        	addw	x,#OFST-4
2083  0041 cd0000        	call	c_rtol
2086  0044 2018          	jra	L3111
2087  0046               L1111:
2088                     ; 619     else if ( clocksource == CLK_SOURCE_LSI)
2090  0046 a1d2          	cp	a,#210
2091  0048 260a          	jrne	L5111
2092                     ; 621         clockfrequency = LSI_VALUE;
2094  004a aef400        	ldw	x,#62464
2095  004d 1f07          	ldw	(OFST-2,sp),x
2096  004f ae0001        	ldw	x,#1
2098  0052 2008          	jp	LC004
2099  0054               L5111:
2100                     ; 625         clockfrequency = HSE_VALUE;
2102  0054 ae3600        	ldw	x,#13824
2103  0057 1f07          	ldw	(OFST-2,sp),x
2104  0059 ae016e        	ldw	x,#366
2105  005c               LC004:
2106  005c 1f05          	ldw	(OFST-4,sp),x
2107  005e               L3111:
2108                     ; 628     return((u32)clockfrequency);
2110  005e 96            	ldw	x,sp
2111  005f 1c0005        	addw	x,#OFST-4
2112  0062 cd0000        	call	c_ltor
2116  0065 5b09          	addw	sp,#9
2117  0067 81            	ret	
2216                     ; 639 void CLK_AdjustHSICalibrationValue(CLK_HSITrimValue_TypeDef CLK_HSICalibrationValue)
2216                     ; 640 {
2217                     .text:	section	.text,new
2218  0000               _CLK_AdjustHSICalibrationValue:
2220  0000 88            	push	a
2221       00000000      OFST:	set	0
2224                     ; 643     assert_param(IS_CLK_HSITRIMVALUE_OK(CLK_HSICalibrationValue));
2226                     ; 646     CLK->HSITRIMR = (u8)((CLK->HSITRIMR & (u8)(~CLK_HSITRIMR_HSITRIM))|((u8)CLK_HSICalibrationValue));
2228  0001 c650cc        	ld	a,20684
2229  0004 a4f8          	and	a,#248
2230  0006 1a01          	or	a,(OFST+1,sp)
2231  0008 c750cc        	ld	20684,a
2232                     ; 648 }
2235  000b 84            	pop	a
2236  000c 81            	ret	
2260                     ; 660 void CLK_SYSCLKEmergencyClear(void)
2260                     ; 661 {
2261                     .text:	section	.text,new
2262  0000               _CLK_SYSCLKEmergencyClear:
2266                     ; 662     CLK->SWCR &= (u8)(~CLK_SWCR_SWBSY);
2268  0000 721150c5      	bres	20677,#0
2269                     ; 663 }
2272  0004 81            	ret	
2425                     ; 672 FlagStatus CLK_GetFlagStatus(CLK_Flag_TypeDef CLK_FLAG)
2425                     ; 673 {
2426                     .text:	section	.text,new
2427  0000               _CLK_GetFlagStatus:
2429  0000 89            	pushw	x
2430  0001 5203          	subw	sp,#3
2431       00000003      OFST:	set	3
2434                     ; 675     u16 statusreg = 0;
2436                     ; 676     u8 tmpreg = 0;
2438                     ; 677     FlagStatus bitstatus = RESET;
2440                     ; 680     assert_param(IS_CLK_FLAG_OK(CLK_FLAG));
2442                     ; 683     statusreg = (u16)((u16)CLK_FLAG & (u16)0xFF00);
2444  0003 7b04          	ld	a,(OFST+1,sp)
2445  0005 97            	ld	xl,a
2446  0006 4f            	clr	a
2447  0007 02            	rlwa	x,a
2448  0008 1f01          	ldw	(OFST-2,sp),x
2449                     ; 686     if (statusreg == 0x0100) /* The flag to check is in ICKRregister */
2451  000a a30100        	cpw	x,#256
2452  000d 2605          	jrne	L3621
2453                     ; 688         tmpreg = CLK->ICKR;
2455  000f c650c0        	ld	a,20672
2457  0012 2021          	jra	L5621
2458  0014               L3621:
2459                     ; 690     else if (statusreg == 0x0200) /* The flag to check is in ECKRregister */
2461  0014 a30200        	cpw	x,#512
2462  0017 2605          	jrne	L7621
2463                     ; 692         tmpreg = CLK->ECKR;
2465  0019 c650c1        	ld	a,20673
2467  001c 2017          	jra	L5621
2468  001e               L7621:
2469                     ; 694     else if (statusreg == 0x0300) /* The flag to check is in SWIC register */
2471  001e a30300        	cpw	x,#768
2472  0021 2605          	jrne	L3721
2473                     ; 696         tmpreg = CLK->SWCR;
2475  0023 c650c5        	ld	a,20677
2477  0026 200d          	jra	L5621
2478  0028               L3721:
2479                     ; 698     else if (statusreg == 0x0400) /* The flag to check is in CSS register */
2481  0028 a30400        	cpw	x,#1024
2482  002b 2605          	jrne	L7721
2483                     ; 700         tmpreg = CLK->CSSR;
2485  002d c650c8        	ld	a,20680
2487  0030 2003          	jra	L5621
2488  0032               L7721:
2489                     ; 704         tmpreg = CLK->CCOR;
2491  0032 c650c9        	ld	a,20681
2492  0035               L5621:
2493  0035 6b03          	ld	(OFST+0,sp),a
2494                     ; 707     if ((tmpreg & (u8)CLK_FLAG) != (u8)RESET)
2496  0037 7b05          	ld	a,(OFST+2,sp)
2497  0039 1503          	bcp	a,(OFST+0,sp)
2498  003b 2704          	jreq	L3031
2499                     ; 709         bitstatus = SET;
2501  003d a601          	ld	a,#1
2503  003f 2001          	jra	L5031
2504  0041               L3031:
2505                     ; 713         bitstatus = RESET;
2507  0041 4f            	clr	a
2508  0042               L5031:
2509                     ; 717     return((FlagStatus)bitstatus);
2513  0042 5b05          	addw	sp,#5
2514  0044 81            	ret	
2560                     ; 727 ITStatus CLK_GetITStatus(CLK_IT_TypeDef CLK_IT)
2560                     ; 728 {
2561                     .text:	section	.text,new
2562  0000               _CLK_GetITStatus:
2564  0000 88            	push	a
2565  0001 88            	push	a
2566       00000001      OFST:	set	1
2569                     ; 730     ITStatus bitstatus = RESET;
2571  0002 0f01          	clr	(OFST+0,sp)
2572                     ; 733     assert_param(IS_CLK_IT_OK(CLK_IT));
2574                     ; 735     if (CLK_IT == CLK_IT_SWIF)
2576  0004 a11c          	cp	a,#28
2577  0006 2609          	jrne	L1331
2578                     ; 738         if ((CLK->SWCR & (u8)CLK_IT) == (u8)0x0C)
2580  0008 c450c5        	and	a,20677
2581  000b a10c          	cp	a,#12
2582  000d 260f          	jrne	L1431
2583                     ; 740             bitstatus = SET;
2585  000f 2009          	jp	LC006
2586                     ; 744             bitstatus = RESET;
2587  0011               L1331:
2588                     ; 750         if ((CLK->CSSR & (u8)CLK_IT) == (u8)0x0C)
2590  0011 c650c8        	ld	a,20680
2591  0014 1402          	and	a,(OFST+1,sp)
2592  0016 a10c          	cp	a,#12
2593  0018 2604          	jrne	L1431
2594                     ; 752             bitstatus = SET;
2596  001a               LC006:
2598  001a a601          	ld	a,#1
2600  001c 2001          	jra	L7331
2601  001e               L1431:
2602                     ; 756             bitstatus = RESET;
2605  001e 4f            	clr	a
2606  001f               L7331:
2607                     ; 761     return bitstatus;
2611  001f 85            	popw	x
2612  0020 81            	ret	
2648                     ; 771 void CLK_ClearITPendingBit(CLK_IT_TypeDef CLK_IT)
2648                     ; 772 {
2649                     .text:	section	.text,new
2650  0000               _CLK_ClearITPendingBit:
2654                     ; 775     assert_param(IS_CLK_IT_OK(CLK_IT));
2656                     ; 777     if (CLK_IT == (u8)CLK_IT_CSSD)
2658  0000 a10c          	cp	a,#12
2659  0002 2605          	jrne	L3631
2660                     ; 780         CLK->CSSR &= (u8)(~CLK_CSSR_CSSD);
2662  0004 721750c8      	bres	20680,#3
2665  0008 81            	ret	
2666  0009               L3631:
2667                     ; 785         CLK->SWCR &= (u8)(~CLK_SWCR_SWIF);
2669  0009 721750c5      	bres	20677,#3
2670                     ; 788 }
2673  000d 81            	ret	
2708                     	xdef	_CLKPrescTable
2709                     	xdef	_HSIDivFactor
2710                     	xdef	_CLK_ClearITPendingBit
2711                     	xdef	_CLK_GetITStatus
2712                     	xdef	_CLK_GetFlagStatus
2713                     	xdef	_CLK_GetSYSCLKSource
2714                     	xdef	_CLK_GetClockFreq
2715                     	xdef	_CLK_AdjustHSICalibrationValue
2716                     	xdef	_CLK_SYSCLKEmergencyClear
2717                     	xdef	_CLK_ClockSecuritySystemEnable
2718                     	xdef	_CLK_CANConfig
2719                     	xdef	_CLK_SWIMConfig
2720                     	xdef	_CLK_SYSCLKConfig
2721                     	xdef	_CLK_ITConfig
2722                     	xdef	_CLK_CCOConfig
2723                     	xdef	_CLK_HSIPrescalerConfig
2724                     	xdef	_CLK_ClockSwitchConfig
2725                     	xdef	_CLK_PeripheralClockConfig
2726                     	xdef	_CLK_SlowActiveHaltWakeUpCmd
2727                     	xdef	_CLK_FastHaltWakeUpCmd
2728                     	xdef	_CLK_ClockSwitchCmd
2729                     	xdef	_CLK_CCOCmd
2730                     	xdef	_CLK_LSICmd
2731                     	xdef	_CLK_HSICmd
2732                     	xdef	_CLK_HSECmd
2733                     	xdef	_CLK_DeInit
2734                     	xref.b	c_lreg
2735                     	xref.b	c_x
2754                     	xref	c_ludv
2755                     	xref	c_rtol
2756                     	xref	c_ltor
2757                     	end
