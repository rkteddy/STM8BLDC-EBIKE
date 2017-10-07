   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
   3                     ; Optimizer V4.2.8 - 03 Dec 2008
  33                     ; 45 void I2C_DeInit(void)
  33                     ; 46 {
  35                     .text:	section	.text,new
  36  0000               _I2C_DeInit:
  40                     ; 47   I2C->CR1 = I2C_CR1_RESET_VALUE;
  42  0000 725f5210      	clr	21008
  43                     ; 48   I2C->CR2 = I2C_CR2_RESET_VALUE;
  45  0004 725f5211      	clr	21009
  46                     ; 49   I2C->FREQR = I2C_FREQR_RESET_VALUE;
  48  0008 725f5212      	clr	21010
  49                     ; 50   I2C->OARL = I2C_OARL_RESET_VALUE;
  51  000c 725f5213      	clr	21011
  52                     ; 51   I2C->OARH = I2C_OARH_RESET_VALUE;
  54  0010 725f5214      	clr	21012
  55                     ; 52   I2C->ITR = I2C_ITR_RESET_VALUE;
  57  0014 725f521a      	clr	21018
  58                     ; 53   I2C->CCRL = I2C_CCRL_RESET_VALUE;
  60  0018 725f521b      	clr	21019
  61                     ; 54   I2C->CCRH = I2C_CCRH_RESET_VALUE;
  63  001c 725f521c      	clr	21020
  64                     ; 55   I2C->TRISER = I2C_TRISER_RESET_VALUE;
  66  0020 3502521d      	mov	21021,#2
  67                     ; 56 }
  70  0024 81            	ret	
 249                     .const:	section	.text
 250  0000               L01:
 251  0000 000186a1      	dc.l	100001
 252  0004               L21:
 253  0004 000f4240      	dc.l	1000000
 254                     ; 71 void I2C_Init(u32 OutputClockFrequencyHz, u16 OwnAddress, I2C_DutyCycle_TypeDef DutyCycle, I2C_Ack_TypeDef Ack, I2C_AddMode_TypeDef AddMode, u8 InputClockFrequencyMHz )
 254                     ; 72 {
 255                     .text:	section	.text,new
 256  0000               _I2C_Init:
 258  0000 5209          	subw	sp,#9
 259       00000009      OFST:	set	9
 262                     ; 73   u16 result = 0x0004;
 264                     ; 74   u16 tmpval = 0;
 266                     ; 75   u8 tmpccrh = 0;
 268  0002 0f07          	clr	(OFST-2,sp)
 269                     ; 78   assert_param(IS_I2C_ACK_OK(Ack));
 271                     ; 79   assert_param(IS_I2C_ADDMODE_OK(AddMode));
 273                     ; 80   assert_param(IS_I2C_OWN_ADDRESS_OK(OwnAddress));
 275                     ; 81   assert_param(IS_I2C_INPUT_CLOCK_FREQ_OK(InputClockFrequencyMHz));
 277                     ; 82   assert_param(IS_I2C_OUTPUT_CLOCK_FREQ_OK(OutputClockFrequencyHz));
 279                     ; 87   I2C->FREQR &= (u8)(~I2C_FREQR_FREQ);
 281  0004 c65212        	ld	a,21010
 282  0007 a4c0          	and	a,#192
 283  0009 c75212        	ld	21010,a
 284                     ; 89   I2C->FREQR |= InputClockFrequencyMHz;
 286  000c c65212        	ld	a,21010
 287  000f 1a15          	or	a,(OFST+12,sp)
 288  0011 c75212        	ld	21010,a
 289                     ; 93   I2C->CR1 &= (u8)(~I2C_CR1_PE);
 291  0014 72115210      	bres	21008,#0
 292                     ; 96   I2C->CCRH &= (u8)(~(I2C_CCRH_FS | I2C_CCRH_DUTY | I2C_CCRH_CCR));
 294  0018 c6521c        	ld	a,21020
 295  001b a430          	and	a,#48
 296  001d c7521c        	ld	21020,a
 297                     ; 97   I2C->CCRL &= (u8)(~I2C_CCRL_CCR);
 299  0020 725f521b      	clr	21019
 300                     ; 100   if (OutputClockFrequencyHz > I2C_MAX_STANDARD_FREQ) /* FAST MODE */
 302  0024 96            	ldw	x,sp
 303  0025 1c000c        	addw	x,#OFST+3
 304  0028 cd0000        	call	c_ltor
 306  002b ae0000        	ldw	x,#L01
 307  002e cd0000        	call	c_lcmp
 309  0031 257c          	jrult	L131
 310                     ; 103     tmpccrh = I2C_CCRH_FS;
 312  0033 a680          	ld	a,#128
 313  0035 6b07          	ld	(OFST-2,sp),a
 314                     ; 105     if (DutyCycle == I2C_DUTYCYCLE_2)
 316  0037 96            	ldw	x,sp
 317  0038 0d12          	tnz	(OFST+9,sp)
 318  003a 262b          	jrne	L331
 319                     ; 108       result = (u16) ((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 3));
 321  003c 1c000c        	addw	x,#OFST+3
 322  003f cd0000        	call	c_ltor
 324  0042 a603          	ld	a,#3
 325  0044 cd0000        	call	c_smul
 327  0047 96            	ldw	x,sp
 328  0048 5c            	incw	x
 329  0049 cd0000        	call	c_rtol
 331  004c 7b15          	ld	a,(OFST+12,sp)
 332  004e b703          	ld	c_lreg+3,a
 333  0050 3f02          	clr	c_lreg+2
 334  0052 3f01          	clr	c_lreg+1
 335  0054 3f00          	clr	c_lreg
 336  0056 ae0004        	ldw	x,#L21
 337  0059 cd0000        	call	c_lmul
 339  005c 96            	ldw	x,sp
 340  005d 5c            	incw	x
 341  005e cd0000        	call	c_ludv
 343  0061 be02          	ldw	x,c_lreg+2
 344  0063 1f08          	ldw	(OFST-1,sp),x
 346  0065 202f          	jra	L531
 347  0067               L331:
 348                     ; 113       result = (u16) ((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 25));
 350  0067 1c000c        	addw	x,#OFST+3
 351  006a cd0000        	call	c_ltor
 353  006d a619          	ld	a,#25
 354  006f cd0000        	call	c_smul
 356  0072 96            	ldw	x,sp
 357  0073 5c            	incw	x
 358  0074 cd0000        	call	c_rtol
 360  0077 7b15          	ld	a,(OFST+12,sp)
 361  0079 b703          	ld	c_lreg+3,a
 362  007b 3f02          	clr	c_lreg+2
 363  007d 3f01          	clr	c_lreg+1
 364  007f 3f00          	clr	c_lreg
 365  0081 ae0004        	ldw	x,#L21
 366  0084 cd0000        	call	c_lmul
 368  0087 96            	ldw	x,sp
 369  0088 5c            	incw	x
 370  0089 cd0000        	call	c_ludv
 372  008c be02          	ldw	x,c_lreg+2
 373  008e 1f08          	ldw	(OFST-1,sp),x
 374                     ; 115       tmpccrh |= I2C_CCRH_DUTY;
 376  0090 7b07          	ld	a,(OFST-2,sp)
 377  0092 aa40          	or	a,#64
 378  0094 6b07          	ld	(OFST-2,sp),a
 379  0096               L531:
 380                     ; 119     if (result < (u16)0x01)
 382  0096 1e08          	ldw	x,(OFST-1,sp)
 383  0098 2603          	jrne	L731
 384                     ; 122       result = (u16)0x0001;
 386  009a 5c            	incw	x
 387  009b 1f08          	ldw	(OFST-1,sp),x
 388  009d               L731:
 389                     ; 128     tmpval = ((InputClockFrequencyMHz * 3) / 10) + 1;
 391  009d 7b15          	ld	a,(OFST+12,sp)
 392  009f 97            	ld	xl,a
 393  00a0 a603          	ld	a,#3
 394  00a2 42            	mul	x,a
 395  00a3 a60a          	ld	a,#10
 396  00a5 cd0000        	call	c_sdivx
 398  00a8 5c            	incw	x
 399  00a9 1f05          	ldw	(OFST-4,sp),x
 400                     ; 129     I2C->TRISER = (u8)tmpval;
 402  00ab 7b06          	ld	a,(OFST-3,sp)
 404  00ad 2038          	jra	L141
 405  00af               L131:
 406                     ; 136     result = (u16)((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz << (u8)1));
 408  00af 96            	ldw	x,sp
 409  00b0 1c000c        	addw	x,#OFST+3
 410  00b3 cd0000        	call	c_ltor
 412  00b6 3803          	sll	c_lreg+3
 413  00b8 3902          	rlc	c_lreg+2
 414  00ba 3901          	rlc	c_lreg+1
 415  00bc 96            	ldw	x,sp
 416  00bd 3900          	rlc	c_lreg
 417  00bf 5c            	incw	x
 418  00c0 cd0000        	call	c_rtol
 420  00c3 7b15          	ld	a,(OFST+12,sp)
 421  00c5 b703          	ld	c_lreg+3,a
 422  00c7 3f02          	clr	c_lreg+2
 423  00c9 3f01          	clr	c_lreg+1
 424  00cb 3f00          	clr	c_lreg
 425  00cd ae0004        	ldw	x,#L21
 426  00d0 cd0000        	call	c_lmul
 428  00d3 96            	ldw	x,sp
 429  00d4 5c            	incw	x
 430  00d5 cd0000        	call	c_ludv
 432  00d8 be02          	ldw	x,c_lreg+2
 433                     ; 139     if (result < (u16)0x0004)
 435  00da a30004        	cpw	x,#4
 436  00dd 2403          	jruge	L341
 437                     ; 142       result = (u16)0x0004;
 439  00df ae0004        	ldw	x,#4
 440  00e2               L341:
 441  00e2 1f08          	ldw	(OFST-1,sp),x
 442                     ; 148     I2C->TRISER = (u8)(InputClockFrequencyMHz + 1);
 444  00e4 7b15          	ld	a,(OFST+12,sp)
 445  00e6 4c            	inc	a
 446  00e7               L141:
 447  00e7 c7521d        	ld	21021,a
 448                     ; 153   I2C->CCRL = (u8)result;
 450  00ea 7b09          	ld	a,(OFST+0,sp)
 451  00ec c7521b        	ld	21019,a
 452                     ; 154   I2C->CCRH = (u8)(((u8)(result >> 8) & I2C_CCRH_CCR) | tmpccrh);
 454  00ef 7b08          	ld	a,(OFST-1,sp)
 455  00f1 a40f          	and	a,#15
 456  00f3 1a07          	or	a,(OFST-2,sp)
 457  00f5 c7521c        	ld	21020,a
 458                     ; 157   I2C->CR1 |= I2C_CR1_PE;
 460  00f8 72105210      	bset	21008,#0
 461                     ; 160   I2C_AcknowledgeConfig(Ack);
 463  00fc 7b13          	ld	a,(OFST+10,sp)
 464  00fe cd0000        	call	_I2C_AcknowledgeConfig
 466                     ; 163   I2C->OARL = (u8)(OwnAddress);
 468  0101 7b11          	ld	a,(OFST+8,sp)
 469  0103 c75213        	ld	21011,a
 470                     ; 164   I2C->OARH = (u8)((u8)AddMode |
 470                     ; 165                    I2C_OARH_ADDCONF |
 470                     ; 166                    (u8)((OwnAddress & (u16)0x0300) >> (u8)7));
 472  0106 7b10          	ld	a,(OFST+7,sp)
 473  0108 a403          	and	a,#3
 474  010a 97            	ld	xl,a
 475  010b 4f            	clr	a
 476  010c 02            	rlwa	x,a
 477  010d a607          	ld	a,#7
 478  010f               L61:
 479  010f 54            	srlw	x
 480  0110 4a            	dec	a
 481  0111 26fc          	jrne	L61
 482  0113 9f            	ld	a,xl
 483  0114 6b04          	ld	(OFST-5,sp),a
 484  0116 7b14          	ld	a,(OFST+11,sp)
 485  0118 aa40          	or	a,#64
 486  011a 1a04          	or	a,(OFST-5,sp)
 487  011c c75214        	ld	21012,a
 488                     ; 167 }
 491  011f 5b09          	addw	sp,#9
 492  0121 81            	ret	
 547                     ; 175 void I2C_Cmd(FunctionalState NewState)
 547                     ; 176 {
 548                     .text:	section	.text,new
 549  0000               _I2C_Cmd:
 553                     ; 179   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 555                     ; 181   if (NewState != DISABLE)
 557  0000 4d            	tnz	a
 558  0001 2705          	jreq	L371
 559                     ; 184     I2C->CR1 |= I2C_CR1_PE;
 561  0003 72105210      	bset	21008,#0
 564  0007 81            	ret	
 565  0008               L371:
 566                     ; 189     I2C->CR1 &= (u8)(~I2C_CR1_PE);
 568  0008 72115210      	bres	21008,#0
 569                     ; 191 }
 572  000c 81            	ret	
 607                     ; 199 void I2C_GeneralCallCmd(FunctionalState NewState)
 607                     ; 200 {
 608                     .text:	section	.text,new
 609  0000               _I2C_GeneralCallCmd:
 613                     ; 203   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 615                     ; 205   if (NewState != DISABLE)
 617  0000 4d            	tnz	a
 618  0001 2705          	jreq	L512
 619                     ; 208     I2C->CR1 |= I2C_CR1_ENGC;
 621  0003 721c5210      	bset	21008,#6
 624  0007 81            	ret	
 625  0008               L512:
 626                     ; 213     I2C->CR1 &= (u8)(~I2C_CR1_ENGC);
 628  0008 721d5210      	bres	21008,#6
 629                     ; 215 }
 632  000c 81            	ret	
 667                     ; 225 void I2C_GenerateSTART(FunctionalState NewState)
 667                     ; 226 {
 668                     .text:	section	.text,new
 669  0000               _I2C_GenerateSTART:
 673                     ; 229   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 675                     ; 231   if (NewState != DISABLE)
 677  0000 4d            	tnz	a
 678  0001 2705          	jreq	L732
 679                     ; 234     I2C->CR2 |= I2C_CR2_START;
 681  0003 72105211      	bset	21009,#0
 684  0007 81            	ret	
 685  0008               L732:
 686                     ; 239     I2C->CR2 &= (u8)(~I2C_CR2_START);
 688  0008 72115211      	bres	21009,#0
 689                     ; 241 }
 692  000c 81            	ret	
 727                     ; 249 void I2C_GenerateSTOP(FunctionalState NewState)
 727                     ; 250 {
 728                     .text:	section	.text,new
 729  0000               _I2C_GenerateSTOP:
 733                     ; 253   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 735                     ; 255   if (NewState != DISABLE)
 737  0000 4d            	tnz	a
 738  0001 2705          	jreq	L162
 739                     ; 258     I2C->CR2 |= I2C_CR2_STOP;
 741  0003 72125211      	bset	21009,#1
 744  0007 81            	ret	
 745  0008               L162:
 746                     ; 263     I2C->CR2 &= (u8)(~I2C_CR2_STOP);
 748  0008 72135211      	bres	21009,#1
 749                     ; 265 }
 752  000c 81            	ret	
 788                     ; 273 void I2C_SoftwareResetCmd(FunctionalState NewState)
 788                     ; 274 {
 789                     .text:	section	.text,new
 790  0000               _I2C_SoftwareResetCmd:
 794                     ; 276   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 796                     ; 278   if (NewState != DISABLE)
 798  0000 4d            	tnz	a
 799  0001 2705          	jreq	L303
 800                     ; 281     I2C->CR2 |= I2C_CR2_SWRST;
 802  0003 721e5211      	bset	21009,#7
 805  0007 81            	ret	
 806  0008               L303:
 807                     ; 286     I2C->CR2 &= (u8)(~I2C_CR2_SWRST);
 809  0008 721f5211      	bres	21009,#7
 810                     ; 288 }
 813  000c 81            	ret	
 849                     ; 297 void I2C_StretchClockCmd(FunctionalState NewState)
 849                     ; 298 {
 850                     .text:	section	.text,new
 851  0000               _I2C_StretchClockCmd:
 855                     ; 300   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 857                     ; 302   if (NewState != DISABLE)
 859  0000 4d            	tnz	a
 860  0001 2705          	jreq	L523
 861                     ; 305     I2C->CR1 &= (u8)(~I2C_CR1_NOSTRETCH);
 863  0003 721f5210      	bres	21008,#7
 866  0007 81            	ret	
 867  0008               L523:
 868                     ; 311     I2C->CR1 |= I2C_CR1_NOSTRETCH;
 870  0008 721e5210      	bset	21008,#7
 871                     ; 313 }
 874  000c 81            	ret	
 910                     ; 323 void I2C_AcknowledgeConfig(I2C_Ack_TypeDef Ack)
 910                     ; 324 {
 911                     .text:	section	.text,new
 912  0000               _I2C_AcknowledgeConfig:
 914  0000 88            	push	a
 915       00000000      OFST:	set	0
 918                     ; 327   assert_param(IS_I2C_ACK_OK(Ack));
 920                     ; 329   if (Ack == I2C_ACK_NONE)
 922  0001 4d            	tnz	a
 923  0002 2606          	jrne	L743
 924                     ; 332     I2C->CR2 &= (u8)(~I2C_CR2_ACK);
 926  0004 72155211      	bres	21009,#2
 928  0008 2013          	jra	L153
 929  000a               L743:
 930                     ; 337     I2C->CR2 |= I2C_CR2_ACK;
 932  000a 72145211      	bset	21009,#2
 933                     ; 339     if (Ack == I2C_ACK_CURR)
 935  000e 7b01          	ld	a,(OFST+1,sp)
 936  0010 4a            	dec	a
 937  0011 2606          	jrne	L353
 938                     ; 342       I2C->CR2 &= (u8)(~I2C_CR2_POS);
 940  0013 72175211      	bres	21009,#3
 942  0017 2004          	jra	L153
 943  0019               L353:
 944                     ; 347       I2C->CR2 |= I2C_CR2_POS;
 946  0019 72165211      	bset	21009,#3
 947  001d               L153:
 948                     ; 351 }
 951  001d 84            	pop	a
 952  001e 81            	ret	
1024                     ; 361 void I2C_ITConfig(I2C_IT_TypeDef ITName, FunctionalState NewState)
1024                     ; 362 {
1025                     .text:	section	.text,new
1026  0000               _I2C_ITConfig:
1028  0000 89            	pushw	x
1029       00000000      OFST:	set	0
1032                     ; 365   assert_param(IS_I2C_INTERRUPT_OK(ITName));
1034                     ; 366   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1036                     ; 368   if (NewState != DISABLE)
1038  0001 9f            	ld	a,xl
1039  0002 4d            	tnz	a
1040  0003 2706          	jreq	L314
1041                     ; 371     I2C->ITR |= (u8)ITName;
1043  0005 9e            	ld	a,xh
1044  0006 ca521a        	or	a,21018
1046  0009 2006          	jra	L514
1047  000b               L314:
1048                     ; 376     I2C->ITR &= (u8)(~(u8)ITName);
1050  000b 7b01          	ld	a,(OFST+1,sp)
1051  000d 43            	cpl	a
1052  000e c4521a        	and	a,21018
1053  0011               L514:
1054  0011 c7521a        	ld	21018,a
1055                     ; 378 }
1058  0014 85            	popw	x
1059  0015 81            	ret	
1095                     ; 386 void I2C_FastModeDutyCycleConfig(I2C_DutyCycle_TypeDef DutyCycle)
1095                     ; 387 {
1096                     .text:	section	.text,new
1097  0000               _I2C_FastModeDutyCycleConfig:
1101                     ; 390   assert_param(IS_I2C_DUTYCYCLE_OK(DutyCycle));
1103                     ; 392   if (DutyCycle == I2C_DUTYCYCLE_16_9)
1105  0000 a140          	cp	a,#64
1106  0002 2605          	jrne	L534
1107                     ; 395     I2C->CCRH |= I2C_CCRH_DUTY;
1109  0004 721c521c      	bset	21020,#6
1112  0008 81            	ret	
1113  0009               L534:
1114                     ; 400     I2C->CCRH &= (u8)(~I2C_CCRH_DUTY);
1116  0009 721d521c      	bres	21020,#6
1117                     ; 402 }
1120  000d 81            	ret	
1298                     ; 414 ErrorStatus I2C_CheckEvent(I2C_Event_TypeDef I2C_Event)
1298                     ; 415 {
1299                     .text:	section	.text,new
1300  0000               _I2C_CheckEvent:
1302  0000 89            	pushw	x
1303  0001 89            	pushw	x
1304       00000002      OFST:	set	2
1307                     ; 417   u8 flag1 = 0;
1309                     ; 418   u8 flag2 = 0;
1311                     ; 419   ErrorStatus status = ERROR;
1313                     ; 422   assert_param(IS_I2C_EVENT_OK(I2C_Event));
1315                     ; 424   flag1 = I2C->SR1;
1317  0002 c65217        	ld	a,21015
1318  0005 6b01          	ld	(OFST-1,sp),a
1319                     ; 425   flag2 = I2C->SR2;
1321  0007 c65218        	ld	a,21016
1322  000a 6b02          	ld	(OFST+0,sp),a
1323                     ; 428   if (((u16)I2C_Event & (u16)0x0F00) == 0x0700)
1325  000c 7b03          	ld	a,(OFST+1,sp)
1326  000e a40f          	and	a,#15
1327  0010 97            	ld	xl,a
1328  0011 4f            	clr	a
1329  0012 02            	rlwa	x,a
1330  0013 a30700        	cpw	x,#1792
1331  0016 2608          	jrne	L535
1332                     ; 431     if (flag1 & (u8)I2C_Event)
1334  0018 7b04          	ld	a,(OFST+2,sp)
1335  001a 1501          	bcp	a,(OFST-1,sp)
1336  001c 270c          	jreq	L545
1337                     ; 434       status = SUCCESS;
1339  001e 2006          	jp	LC002
1340                     ; 439       status = ERROR;
1341  0020               L535:
1342                     ; 444     if (flag2 & (u8)I2C_Event)
1344  0020 7b04          	ld	a,(OFST+2,sp)
1345  0022 1502          	bcp	a,(OFST+0,sp)
1346  0024 2704          	jreq	L545
1347                     ; 447       status = SUCCESS;
1349  0026               LC002:
1351  0026 a601          	ld	a,#1
1353  0028 2001          	jra	L345
1354  002a               L545:
1355                     ; 452       status = ERROR;
1358  002a 4f            	clr	a
1359  002b               L345:
1360                     ; 457   return status;
1364  002b 5b04          	addw	sp,#4
1365  002d 81            	ret	
1388                     ; 467 u8 I2C_ReceiveData(void)
1388                     ; 468 {
1389                     .text:	section	.text,new
1390  0000               _I2C_ReceiveData:
1394                     ; 470   return ((u8)I2C->DR);
1396  0000 c65216        	ld	a,21014
1399  0003 81            	ret	
1464                     ; 480 void I2C_Send7bitAddress(u8 Address, I2C_Direction_TypeDef Direction)
1464                     ; 481 {
1465                     .text:	section	.text,new
1466  0000               _I2C_Send7bitAddress:
1468  0000 89            	pushw	x
1469       00000000      OFST:	set	0
1472                     ; 483   assert_param(IS_I2C_ADDRESS_OK(Address));
1474                     ; 484   assert_param(IS_I2C_DIRECTION_OK(Direction));
1476                     ; 487   Address &= (u8)0xFE;
1478  0001 7b01          	ld	a,(OFST+1,sp)
1479  0003 a4fe          	and	a,#254
1480  0005 6b01          	ld	(OFST+1,sp),a
1481                     ; 490   I2C->DR = (u8)(Address | (u8)Direction);
1483  0007 1a02          	or	a,(OFST+2,sp)
1484  0009 c75216        	ld	21014,a
1485                     ; 491 }
1488  000c 85            	popw	x
1489  000d 81            	ret	
1523                     ; 498 void I2C_SendData(u8 Data)
1523                     ; 499 {
1524                     .text:	section	.text,new
1525  0000               _I2C_SendData:
1529                     ; 501   I2C->DR = Data;
1531  0000 c75216        	ld	21014,a
1532                     ; 502 }
1535  0003 81            	ret	
1732                     ; 511 FlagStatus I2C_GetFlagStatus(I2C_Flag_TypeDef Flag)
1732                     ; 512 {
1733                     .text:	section	.text,new
1734  0000               _I2C_GetFlagStatus:
1736  0000 89            	pushw	x
1737  0001 88            	push	a
1738       00000001      OFST:	set	1
1741                     ; 514   FlagStatus bitstatus = RESET;
1743  0002 0f01          	clr	(OFST+0,sp)
1744                     ; 517   assert_param(IS_I2C_FLAG_OK(Flag));
1746                     ; 520   switch ((u16)Flag & (u16)0xF000)
1748  0004 01            	rrwa	x,a
1749  0005 9f            	ld	a,xl
1750  0006 a4f0          	and	a,#240
1751  0008 97            	ld	xl,a
1752  0009 4f            	clr	a
1753  000a 02            	rlwa	x,a
1755                     ; 568     default:
1755                     ; 569       break;
1756  000b 1d1000        	subw	x,#4096
1757  000e 270c          	jreq	L136
1758  0010 1d1000        	subw	x,#4096
1759  0013 270c          	jreq	L336
1760  0015 1d1000        	subw	x,#4096
1761  0018 2714          	jreq	L536
1762  001a 201b          	jra	L147
1763  001c               L136:
1764                     ; 524     case 0x1000:
1764                     ; 525       /* Check the status of the specified I2C flag */
1764                     ; 526       if ((I2C->SR1 & (u8)Flag) != 0)
1766  001c c65217        	ld	a,21015
1767                     ; 529         bitstatus = SET;
1769  001f 2003          	jp	LC005
1770                     ; 534         bitstatus = RESET;
1771  0021               L336:
1772                     ; 539     case 0x2000:
1772                     ; 540       /* Check the status of the specified I2C flag */
1772                     ; 541       if ((I2C->SR2 & (u8)Flag) != 0)
1774  0021 c65218        	ld	a,21016
1775  0024               LC005:
1776  0024 1503          	bcp	a,(OFST+2,sp)
1777  0026 270d          	jreq	L357
1778                     ; 544         bitstatus = SET;
1780  0028               LC004:
1783  0028 a601          	ld	a,#1
1784  002a 6b01          	ld	(OFST+0,sp),a
1786  002c 2009          	jra	L147
1787                     ; 549         bitstatus = RESET;
1788  002e               L536:
1789                     ; 554     case 0x3000:
1789                     ; 555       /* Check the status of the specified I2C flag */
1789                     ; 556       if ((I2C->SR3 & (u8)Flag) != 0)
1791  002e c65219        	ld	a,21017
1792  0031 1503          	bcp	a,(OFST+2,sp)
1793                     ; 559         bitstatus = SET;
1795  0033 26f3          	jrne	LC004
1796  0035               L357:
1797                     ; 564         bitstatus = RESET;
1801  0035 0f01          	clr	(OFST+0,sp)
1802                     ; 568     default:
1802                     ; 569       break;
1804  0037               L147:
1805                     ; 573   return bitstatus;
1807  0037 7b01          	ld	a,(OFST+0,sp)
1810  0039 5b03          	addw	sp,#3
1811  003b 81            	ret	
1873                     ; 592 void I2C_ClearFlag(I2C_Flag_TypeDef Flag)
1873                     ; 593 {
1874                     .text:	section	.text,new
1875  0000               _I2C_ClearFlag:
1877  0000 89            	pushw	x
1878  0001 5204          	subw	sp,#4
1879       00000004      OFST:	set	4
1882                     ; 594   u8 tmp1 = 0;
1884                     ; 595   u8 tmp2 = 0;
1886                     ; 596   u16 tmp3 = 0;
1888                     ; 599   assert_param(IS_I2C_CLEAR_FLAG_OK(Flag));
1890                     ; 602   tmp3 = ((u16)Flag & (u16)0x0F00);
1892  0003 7b05          	ld	a,(OFST+1,sp)
1893  0005 a40f          	and	a,#15
1894  0007 97            	ld	xl,a
1895  0008 4f            	clr	a
1896  0009 02            	rlwa	x,a
1897  000a 1f03          	ldw	(OFST-1,sp),x
1898                     ; 605   if(tmp3 == 0x0100)
1900  000c a30100        	cpw	x,#256
1901  000f 2608          	jrne	L1101
1902                     ; 608       I2C->SR2 = (u8)(~(u8)Flag);
1904  0011 7b06          	ld	a,(OFST+2,sp)
1905  0013 43            	cpl	a
1906  0014 c75218        	ld	21016,a
1908  0017 2028          	jra	L3101
1909  0019               L1101:
1910                     ; 611   else if(tmp3 == 0x0200)
1912  0019 a30200        	cpw	x,#512
1913  001c 260a          	jrne	L5101
1914                     ; 614       tmp1 = I2C->SR1;
1916  001e c65217        	ld	a,21015
1917                     ; 616       I2C->CR2 = I2C->CR2;
1919  0021 5552115211    	mov	21009,21009
1921  0026 2019          	jra	L3101
1922  0028               L5101:
1923                     ; 619   else if(tmp3 == 0x0300)
1925  0028 a30300        	cpw	x,#768
1926  002b 2608          	jrne	L1201
1927                     ; 623       tmp1 = I2C->SR1;
1929  002d c65217        	ld	a,21015
1930                     ; 625       tmp2 = I2C->SR3;
1932  0030 c65219        	ld	a,21017
1934  0033 200c          	jra	L3101
1935  0035               L1201:
1936                     ; 628   else if(tmp3 == 0x0400)
1938  0035 a30400        	cpw	x,#1024
1939  0038 2607          	jrne	L3101
1940                     ; 632       tmp1 = I2C->SR1;
1942  003a c65217        	ld	a,21015
1943                     ; 634       tmp2 = I2C->DR;
1945  003d c65216        	ld	a,21014
1946  0040 97            	ld	xl,a
1947  0041               L3101:
1948                     ; 636 }
1951  0041 5b06          	addw	sp,#6
1952  0043 81            	ret	
2100                     ; 645 ITStatus I2C_GetITStatus(I2C_ITPendingBit_TypeDef ITPendingBit)
2100                     ; 646 {
2101                     .text:	section	.text,new
2102  0000               _I2C_GetITStatus:
2104  0000 89            	pushw	x
2105  0001 88            	push	a
2106       00000001      OFST:	set	1
2109                     ; 647     ITStatus itstatus = RESET;
2111  0002 0f01          	clr	(OFST+0,sp)
2112                     ; 650     assert_param(IS_I2C_ITPENDINGBIT_OK(ITPendingBit));
2114                     ; 653     if (((u16)ITPendingBit & 0xF000) == 0x1000) /* Returns whether the status register to check is SR1 */
2116  0004 01            	rrwa	x,a
2117  0005 9f            	ld	a,xl
2118  0006 a4f0          	and	a,#240
2119  0008 97            	ld	xl,a
2120  0009 4f            	clr	a
2121  000a 02            	rlwa	x,a
2122  000b a31000        	cpw	x,#4096
2123  000e 2609          	jrne	L5011
2124                     ; 656         if ((I2C->SR1 & (u8)ITPendingBit) != 0)
2126  0010 c65217        	ld	a,21015
2127  0013 1503          	bcp	a,(OFST+2,sp)
2128  0015 270d          	jreq	L5111
2129                     ; 659             itstatus = SET;
2131  0017 2007          	jp	LC007
2132                     ; 664             itstatus = RESET;
2133  0019               L5011:
2134                     ; 670         if ((I2C->SR2 & (u8)ITPendingBit) != 0)
2136  0019 c65218        	ld	a,21016
2137  001c 1503          	bcp	a,(OFST+2,sp)
2138  001e 2704          	jreq	L5111
2139                     ; 673             itstatus = SET;
2141  0020               LC007:
2143  0020 a601          	ld	a,#1
2145  0022 2001          	jra	L3111
2146  0024               L5111:
2147                     ; 678             itstatus = RESET;
2150  0024 4f            	clr	a
2151  0025               L3111:
2152                     ; 683     return itstatus;
2156  0025 5b03          	addw	sp,#3
2157  0027 81            	ret	
2220                     ; 703 void I2C_ClearITPendingBit(I2C_ITPendingBit_TypeDef ITPendingBit)
2220                     ; 704 {
2221                     .text:	section	.text,new
2222  0000               _I2C_ClearITPendingBit:
2224  0000 89            	pushw	x
2225  0001 5204          	subw	sp,#4
2226       00000004      OFST:	set	4
2229                     ; 705   u8 tmp1 = 0;
2231                     ; 706   u8 tmp2 = 0;
2233                     ; 707   u16 tmp3 = 0;
2235                     ; 710   assert_param(IS_I2C_ITPENDINGBIT_OK(ITPendingBit));
2237                     ; 713   tmp3 = ((u16)ITPendingBit & (u16)0x0F00);
2239  0003 7b05          	ld	a,(OFST+1,sp)
2240  0005 a40f          	and	a,#15
2241  0007 97            	ld	xl,a
2242  0008 4f            	clr	a
2243  0009 02            	rlwa	x,a
2244  000a 1f03          	ldw	(OFST-1,sp),x
2245                     ; 716   if(tmp3 == 0x0100)
2247  000c a30100        	cpw	x,#256
2248  000f 2608          	jrne	L3511
2249                     ; 719       I2C->SR2 = (u8)(~(u8)ITPendingBit);
2251  0011 7b06          	ld	a,(OFST+2,sp)
2252  0013 43            	cpl	a
2253  0014 c75218        	ld	21016,a
2255  0017 2028          	jra	L5511
2256  0019               L3511:
2257                     ; 722   else if(tmp3 == 0x0200)
2259  0019 a30200        	cpw	x,#512
2260  001c 260a          	jrne	L7511
2261                     ; 725       tmp1 = I2C->SR1;
2263  001e c65217        	ld	a,21015
2264                     ; 727       I2C->CR2 = I2C->CR2;
2266  0021 5552115211    	mov	21009,21009
2268  0026 2019          	jra	L5511
2269  0028               L7511:
2270                     ; 730   else if(tmp3 == 0x0300)
2272  0028 a30300        	cpw	x,#768
2273  002b 2608          	jrne	L3611
2274                     ; 734       tmp1 = I2C->SR1;
2276  002d c65217        	ld	a,21015
2277                     ; 736       tmp2 = I2C->SR3;
2279  0030 c65219        	ld	a,21017
2281  0033 200c          	jra	L5511
2282  0035               L3611:
2283                     ; 739   else if(tmp3 == 0x0400)
2285  0035 a30400        	cpw	x,#1024
2286  0038 2607          	jrne	L5511
2287                     ; 743       tmp1 = I2C->SR1;
2289  003a c65217        	ld	a,21015
2290                     ; 745       tmp2 = I2C->DR;
2292  003d c65216        	ld	a,21014
2293  0040 97            	ld	xl,a
2294  0041               L5511:
2295                     ; 747 }
2298  0041 5b06          	addw	sp,#6
2299  0043 81            	ret	
2312                     	xdef	_I2C_ClearITPendingBit
2313                     	xdef	_I2C_GetITStatus
2314                     	xdef	_I2C_ClearFlag
2315                     	xdef	_I2C_GetFlagStatus
2316                     	xdef	_I2C_SendData
2317                     	xdef	_I2C_Send7bitAddress
2318                     	xdef	_I2C_ReceiveData
2319                     	xdef	_I2C_CheckEvent
2320                     	xdef	_I2C_ITConfig
2321                     	xdef	_I2C_FastModeDutyCycleConfig
2322                     	xdef	_I2C_AcknowledgeConfig
2323                     	xdef	_I2C_StretchClockCmd
2324                     	xdef	_I2C_SoftwareResetCmd
2325                     	xdef	_I2C_GenerateSTOP
2326                     	xdef	_I2C_GenerateSTART
2327                     	xdef	_I2C_GeneralCallCmd
2328                     	xdef	_I2C_Cmd
2329                     	xdef	_I2C_Init
2330                     	xdef	_I2C_DeInit
2331                     	xref.b	c_lreg
2332                     	xref.b	c_x
2351                     	xref	c_sdivx
2352                     	xref	c_ludv
2353                     	xref	c_rtol
2354                     	xref	c_smul
2355                     	xref	c_lmul
2356                     	xref	c_lcmp
2357                     	xref	c_ltor
2358                     	end
