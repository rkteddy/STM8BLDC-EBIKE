   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
   3                     ; Optimizer V4.2.8 - 03 Dec 2008
  33                     ; 46 void ADC1_DeInit(void)
  33                     ; 47 {
  35                     .text:	section	.text,new
  36  0000               _ADC1_DeInit:
  40                     ; 48     ADC1->CSR  = ADC1_CSR_RESET_VALUE;
  42  0000 725f5400      	clr	21504
  43                     ; 49     ADC1->CR1  = ADC1_CR1_RESET_VALUE;
  45  0004 725f5401      	clr	21505
  46                     ; 50     ADC1->CR2  = ADC1_CR2_RESET_VALUE;
  48  0008 725f5402      	clr	21506
  49                     ; 51     ADC1->CR3  = ADC1_CR3_RESET_VALUE;
  51  000c 725f5403      	clr	21507
  52                     ; 52     ADC1->TDRH = ADC1_TDRH_RESET_VALUE;
  54  0010 725f5406      	clr	21510
  55                     ; 53     ADC1->TDRL = ADC1_TDRL_RESET_VALUE;
  57  0014 725f5407      	clr	21511
  58                     ; 54     ADC1->HTRH = ADC1_HTRH_RESET_VALUE;
  60  0018 35ff5408      	mov	21512,#255
  61                     ; 55     ADC1->HTRL = ADC1_HTRL_RESET_VALUE;
  63  001c 35035409      	mov	21513,#3
  64                     ; 56     ADC1->LTRH = ADC1_LTRH_RESET_VALUE;
  66  0020 725f540a      	clr	21514
  67                     ; 57     ADC1->LTRL = ADC1_LTRL_RESET_VALUE;
  69  0024 725f540b      	clr	21515
  70                     ; 58     ADC1->AWCRH = ADC1_AWCRH_RESET_VALUE;
  72  0028 725f540e      	clr	21518
  73                     ; 59     ADC1->AWCRL = ADC1_AWCRL_RESET_VALUE;
  75  002c 725f540f      	clr	21519
  76                     ; 60 }
  79  0030 81            	ret	
 515                     ; 83 void ADC1_Init(ADC1_ConvMode_TypeDef ADC1_ConversionMode, ADC1_Channel_TypeDef ADC1_Channel, ADC1_PresSel_TypeDef ADC1_PrescalerSelection, ADC1_ExtTrig_TypeDef ADC1_ExtTrigger, FunctionalState ADC1_ExtTriggerState, ADC1_Align_TypeDef ADC1_Align, ADC1_SchmittTrigg_TypeDef ADC1_SchmittTriggerChannel, FunctionalState ADC1_SchmittTriggerState)
 515                     ; 84 {
 516                     .text:	section	.text,new
 517  0000               _ADC1_Init:
 519  0000 89            	pushw	x
 520       00000000      OFST:	set	0
 523                     ; 87     assert_param(IS_ADC1_CONVERSIONMODE_OK(ADC1_ConversionMode));
 525                     ; 88     assert_param(IS_ADC1_CHANNEL_OK(ADC1_Channel));
 527                     ; 89     assert_param(IS_ADC1_PRESSEL_OK(ADC1_PrescalerSelection));
 529                     ; 90     assert_param(IS_ADC1_EXTTRIG_OK(ADC1_ExtTrigger));
 531                     ; 91     assert_param(IS_FUNCTIONALSTATE_OK(((ADC1_ExtTriggerState))));
 533                     ; 92     assert_param(IS_ADC1_ALIGN_OK(ADC1_Align));
 535                     ; 93     assert_param(IS_ADC1_SCHMITTTRIG_OK(ADC1_SchmittTriggerChannel));
 537                     ; 94     assert_param(IS_FUNCTIONALSTATE_OK(ADC1_SchmittTriggerState));
 539                     ; 99     ADC1_ConversionConfig(ADC1_ConversionMode, ADC1_Channel, ADC1_Align);
 541  0001 7b08          	ld	a,(OFST+8,sp)
 542  0003 88            	push	a
 543  0004 7b02          	ld	a,(OFST+2,sp)
 544  0006 95            	ld	xh,a
 545  0007 cd0000        	call	_ADC1_ConversionConfig
 547  000a 84            	pop	a
 548                     ; 101     ADC1_PrescalerConfig(ADC1_PrescalerSelection);
 550  000b 7b05          	ld	a,(OFST+5,sp)
 551  000d cd0000        	call	_ADC1_PrescalerConfig
 553                     ; 106     ADC1_ExternalTriggerConfig(ADC1_ExtTrigger, ADC1_ExtTriggerState);
 555  0010 7b07          	ld	a,(OFST+7,sp)
 556  0012 97            	ld	xl,a
 557  0013 7b06          	ld	a,(OFST+6,sp)
 558  0015 95            	ld	xh,a
 559  0016 cd0000        	call	_ADC1_ExternalTriggerConfig
 561                     ; 111     ADC1_SchmittTriggerConfig(ADC1_SchmittTriggerChannel, ADC1_SchmittTriggerState);
 563  0019 7b0a          	ld	a,(OFST+10,sp)
 564  001b 97            	ld	xl,a
 565  001c 7b09          	ld	a,(OFST+9,sp)
 566  001e 95            	ld	xh,a
 567  001f cd0000        	call	_ADC1_SchmittTriggerConfig
 569                     ; 114     ADC1->CR1 |= ADC1_CR1_ADON;
 571  0022 72105401      	bset	21505,#0
 572                     ; 116 }
 575  0026 85            	popw	x
 576  0027 81            	ret	
 611                     ; 124 void ADC1_Cmd(FunctionalState NewState)
 611                     ; 125 {
 612                     .text:	section	.text,new
 613  0000               _ADC1_Cmd:
 617                     ; 128     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 619                     ; 130     if (NewState != DISABLE)
 621  0000 4d            	tnz	a
 622  0001 2705          	jreq	L752
 623                     ; 132         ADC1->CR1 |= ADC1_CR1_ADON;
 625  0003 72105401      	bset	21505,#0
 628  0007 81            	ret	
 629  0008               L752:
 630                     ; 136         ADC1->CR1 &= (u8)(~ADC1_CR1_ADON);
 632  0008 72115401      	bres	21505,#0
 633                     ; 139 }
 636  000c 81            	ret	
 671                     ; 146 void ADC1_ScanModeCmd(FunctionalState NewState)
 671                     ; 147 {
 672                     .text:	section	.text,new
 673  0000               _ADC1_ScanModeCmd:
 677                     ; 150     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 679                     ; 152     if (NewState != DISABLE)
 681  0000 4d            	tnz	a
 682  0001 2705          	jreq	L103
 683                     ; 154         ADC1->CR2 |= ADC1_CR2_SCAN;
 685  0003 72125402      	bset	21506,#1
 688  0007 81            	ret	
 689  0008               L103:
 690                     ; 158         ADC1->CR2 &= (u8)(~ADC1_CR2_SCAN);
 692  0008 72135402      	bres	21506,#1
 693                     ; 161 }
 696  000c 81            	ret	
 731                     ; 168 void ADC1_DataBufferCmd(FunctionalState NewState)
 731                     ; 169 {
 732                     .text:	section	.text,new
 733  0000               _ADC1_DataBufferCmd:
 737                     ; 172     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 739                     ; 174     if (NewState != DISABLE)
 741  0000 4d            	tnz	a
 742  0001 2705          	jreq	L323
 743                     ; 176         ADC1->CR3 |= ADC1_CR3_DBUF;
 745  0003 721e5403      	bset	21507,#7
 748  0007 81            	ret	
 749  0008               L323:
 750                     ; 180         ADC1->CR3 &= (u8)(~ADC1_CR3_DBUF);
 752  0008 721f5403      	bres	21507,#7
 753                     ; 183 }
 756  000c 81            	ret	
 905                     ; 194 void ADC1_ITConfig(ADC1_IT_TypeDef ADC1_IT, FunctionalState NewState)
 905                     ; 195 {
 906                     .text:	section	.text,new
 907  0000               _ADC1_ITConfig:
 909  0000 89            	pushw	x
 910       00000000      OFST:	set	0
 913                     ; 198     assert_param(IS_ADC1_IT_OK(ADC1_IT));
 915                     ; 199     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 917                     ; 201     if (NewState != DISABLE)
 919  0001 7b05          	ld	a,(OFST+5,sp)
 920  0003 2706          	jreq	L114
 921                     ; 204         ADC1->CSR |= (u8)ADC1_IT;
 923  0005 9f            	ld	a,xl
 924  0006 ca5400        	or	a,21504
 926  0009 2006          	jra	L314
 927  000b               L114:
 928                     ; 209         ADC1->CSR &= (u8)(~ADC1_IT);
 930  000b 7b02          	ld	a,(OFST+2,sp)
 931  000d 43            	cpl	a
 932  000e c45400        	and	a,21504
 933  0011               L314:
 934  0011 c75400        	ld	21504,a
 935                     ; 212 }
 938  0014 85            	popw	x
 939  0015 81            	ret	
 975                     ; 220 void ADC1_PrescalerConfig(ADC1_PresSel_TypeDef ADC1_Prescaler)
 975                     ; 221 {
 976                     .text:	section	.text,new
 977  0000               _ADC1_PrescalerConfig:
 979  0000 88            	push	a
 980       00000000      OFST:	set	0
 983                     ; 224     assert_param(IS_ADC1_PRESSEL_OK(ADC1_Prescaler));
 985                     ; 227     ADC1->CR1 &= (u8)(~ADC1_CR1_SPSEL);
 987  0001 c65401        	ld	a,21505
 988  0004 a48f          	and	a,#143
 989  0006 c75401        	ld	21505,a
 990                     ; 229     ADC1->CR1 |= (u8)(ADC1_Prescaler);
 992  0009 c65401        	ld	a,21505
 993  000c 1a01          	or	a,(OFST+1,sp)
 994  000e c75401        	ld	21505,a
 995                     ; 231 }
 998  0011 84            	pop	a
 999  0012 81            	ret	
1046                     ; 242 void ADC1_SchmittTriggerConfig(ADC1_SchmittTrigg_TypeDef ADC1_SchmittTriggerChannel, FunctionalState NewState)
1046                     ; 243 {
1047                     .text:	section	.text,new
1048  0000               _ADC1_SchmittTriggerConfig:
1050  0000 89            	pushw	x
1051       00000000      OFST:	set	0
1054                     ; 246     assert_param(IS_ADC1_SCHMITTTRIG_OK(ADC1_SchmittTriggerChannel));
1056                     ; 247     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1058                     ; 249     if (ADC1_SchmittTriggerChannel == ADC1_SCHMITTTRIG_ALL)
1060  0001 9e            	ld	a,xh
1061  0002 4c            	inc	a
1062  0003 261d          	jrne	L554
1063                     ; 251         if (NewState != DISABLE)
1065  0005 9f            	ld	a,xl
1066  0006 4d            	tnz	a
1067  0007 270a          	jreq	L754
1068                     ; 253             ADC1->TDRL &= (u8)0x0;
1070  0009 725f5407      	clr	21511
1071                     ; 254             ADC1->TDRH &= (u8)0x0;
1073  000d 725f5406      	clr	21510
1075  0011 2065          	jra	L364
1076  0013               L754:
1077                     ; 258             ADC1->TDRL |= (u8)0xFF;
1079  0013 c65407        	ld	a,21511
1080  0016 aaff          	or	a,#255
1081  0018 c75407        	ld	21511,a
1082                     ; 259             ADC1->TDRH |= (u8)0xFF;
1084  001b c65406        	ld	a,21510
1085  001e aaff          	or	a,#255
1086  0020 2053          	jp	LC001
1087  0022               L554:
1088                     ; 262     else if (ADC1_SchmittTriggerChannel < ADC1_SCHMITTTRIG_CHANNEL8)
1090  0022 7b01          	ld	a,(OFST+1,sp)
1091  0024 a108          	cp	a,#8
1092  0026 0d02          	tnz	(OFST+2,sp)
1093  0028 2426          	jruge	L564
1094                     ; 264         if (NewState != DISABLE)
1096  002a 2714          	jreq	L764
1097                     ; 266             ADC1->TDRL &= (u8)(~(u8)((u8)0x01 << (u8)ADC1_SchmittTriggerChannel));
1099  002c 5f            	clrw	x
1100  002d 97            	ld	xl,a
1101  002e a601          	ld	a,#1
1102  0030 5d            	tnzw	x
1103  0031 2704          	jreq	L43
1104  0033               L63:
1105  0033 48            	sll	a
1106  0034 5a            	decw	x
1107  0035 26fc          	jrne	L63
1108  0037               L43:
1109  0037 43            	cpl	a
1110  0038 c45407        	and	a,21511
1111  003b               LC002:
1112  003b c75407        	ld	21511,a
1114  003e 2038          	jra	L364
1115  0040               L764:
1116                     ; 270             ADC1->TDRL |= (u8)((u8)0x01 << (u8)ADC1_SchmittTriggerChannel);
1118  0040 5f            	clrw	x
1119  0041 97            	ld	xl,a
1120  0042 a601          	ld	a,#1
1121  0044 5d            	tnzw	x
1122  0045 2704          	jreq	L04
1123  0047               L24:
1124  0047 48            	sll	a
1125  0048 5a            	decw	x
1126  0049 26fc          	jrne	L24
1127  004b               L04:
1128  004b ca5407        	or	a,21511
1129  004e 20eb          	jp	LC002
1130  0050               L564:
1131                     ; 275         if (NewState != DISABLE)
1133  0050 2713          	jreq	L574
1134                     ; 277             ADC1->TDRH &= (u8)(~(u8)((u8)0x01 << ((u8)ADC1_SchmittTriggerChannel - (u8)8)));
1136  0052 a008          	sub	a,#8
1137  0054 5f            	clrw	x
1138  0055 97            	ld	xl,a
1139  0056 a601          	ld	a,#1
1140  0058 5d            	tnzw	x
1141  0059 2704          	jreq	L44
1142  005b               L64:
1143  005b 48            	sll	a
1144  005c 5a            	decw	x
1145  005d 26fc          	jrne	L64
1146  005f               L44:
1147  005f 43            	cpl	a
1148  0060 c45406        	and	a,21510
1150  0063 2010          	jp	LC001
1151  0065               L574:
1152                     ; 281             ADC1->TDRH |= (u8)((u8)0x01 << ((u8)ADC1_SchmittTriggerChannel - (u8)8));
1154  0065 a008          	sub	a,#8
1155  0067 5f            	clrw	x
1156  0068 97            	ld	xl,a
1157  0069 a601          	ld	a,#1
1158  006b 5d            	tnzw	x
1159  006c 2704          	jreq	L05
1160  006e               L25:
1161  006e 48            	sll	a
1162  006f 5a            	decw	x
1163  0070 26fc          	jrne	L25
1164  0072               L05:
1165  0072 ca5406        	or	a,21510
1166  0075               LC001:
1167  0075 c75406        	ld	21510,a
1168  0078               L364:
1169                     ; 285 }
1172  0078 85            	popw	x
1173  0079 81            	ret	
1230                     ; 298 void ADC1_ConversionConfig(ADC1_ConvMode_TypeDef ADC1_ConversionMode, ADC1_Channel_TypeDef ADC1_Channel, ADC1_Align_TypeDef ADC1_Align)
1230                     ; 299 {
1231                     .text:	section	.text,new
1232  0000               _ADC1_ConversionConfig:
1234       00000000      OFST:	set	0
1237                     ; 302     assert_param(IS_ADC1_CONVERSIONMODE_OK(ADC1_ConversionMode));
1239                     ; 303     assert_param(IS_ADC1_CHANNEL_OK(ADC1_Channel));
1241                     ; 304     assert_param(IS_ADC1_ALIGN_OK(ADC1_Align));
1243                     ; 307     ADC1->CR2 &= (u8)(~ADC1_CR2_ALIGN);
1245  0000 72175402      	bres	21506,#3
1246  0004 89            	pushw	x
1247                     ; 309     ADC1->CR2 |= (u8)(ADC1_Align);
1249  0005 c65402        	ld	a,21506
1250  0008 1a05          	or	a,(OFST+5,sp)
1251  000a c75402        	ld	21506,a
1252                     ; 311     if (ADC1_ConversionMode == ADC1_CONVERSIONMODE_CONTINUOUS)
1254  000d 9e            	ld	a,xh
1255  000e 4a            	dec	a
1256  000f 2606          	jrne	L725
1257                     ; 314         ADC1->CR1 |= ADC1_CR1_CONT;
1259  0011 72125401      	bset	21505,#1
1261  0015 2004          	jra	L135
1262  0017               L725:
1263                     ; 319         ADC1->CR1 &= (u8)(~ADC1_CR1_CONT);
1265  0017 72135401      	bres	21505,#1
1266  001b               L135:
1267                     ; 323     ADC1->CSR &= (u8)(~ADC1_CSR_CH);
1269  001b c65400        	ld	a,21504
1270  001e a4f0          	and	a,#240
1271  0020 c75400        	ld	21504,a
1272                     ; 325     ADC1->CSR |= (u8)(ADC1_Channel);
1274  0023 c65400        	ld	a,21504
1275  0026 1a02          	or	a,(OFST+2,sp)
1276  0028 c75400        	ld	21504,a
1277                     ; 327 }
1280  002b 85            	popw	x
1281  002c 81            	ret	
1327                     ; 340 void ADC1_ExternalTriggerConfig(ADC1_ExtTrig_TypeDef ADC1_ExtTrigger, FunctionalState NewState)
1327                     ; 341 {
1328                     .text:	section	.text,new
1329  0000               _ADC1_ExternalTriggerConfig:
1331  0000 89            	pushw	x
1332       00000000      OFST:	set	0
1335                     ; 344     assert_param(IS_ADC1_EXTTRIG_OK(ADC1_ExtTrigger));
1337                     ; 345     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1339                     ; 348     ADC1->CR2 &= (u8)(~ADC1_CR2_EXTSEL);
1341  0001 c65402        	ld	a,21506
1342  0004 a4cf          	and	a,#207
1343  0006 c75402        	ld	21506,a
1344                     ; 350     if (NewState != DISABLE)
1346  0009 9f            	ld	a,xl
1347  000a 4d            	tnz	a
1348  000b 2706          	jreq	L555
1349                     ; 353         ADC1->CR2 |= (u8)(ADC1_CR2_EXTTRIG);
1351  000d 721c5402      	bset	21506,#6
1353  0011 2004          	jra	L755
1354  0013               L555:
1355                     ; 358         ADC1->CR2 &= (u8)(~ADC1_CR2_EXTTRIG);
1357  0013 721d5402      	bres	21506,#6
1358  0017               L755:
1359                     ; 362     ADC1->CR2 |= (u8)(ADC1_ExtTrigger);
1361  0017 c65402        	ld	a,21506
1362  001a 1a01          	or	a,(OFST+1,sp)
1363  001c c75402        	ld	21506,a
1364                     ; 364 }
1367  001f 85            	popw	x
1368  0020 81            	ret	
1392                     ; 377 void ADC1_StartConversion(void)
1392                     ; 378 {
1393                     .text:	section	.text,new
1394  0000               _ADC1_StartConversion:
1398                     ; 379     ADC1->CR1 |= ADC1_CR1_ADON;
1400  0000 72105401      	bset	21505,#0
1401                     ; 380 }
1404  0004 81            	ret	
1448                     ; 390 u16 ADC1_GetConversionValue(void)
1448                     ; 391 {
1449                     .text:	section	.text,new
1450  0000               _ADC1_GetConversionValue:
1452  0000 5205          	subw	sp,#5
1453       00000005      OFST:	set	5
1456                     ; 393     u16 temph = 0;
1458                     ; 394     u8 templ = 0;
1460                     ; 396     if (ADC1->CR2 & ADC1_CR2_ALIGN) /* Right alignment */
1462  0002 720754020e    	btjf	21506,#3,L316
1463                     ; 399         templ = ADC1->DRL;
1465  0007 c65405        	ld	a,21509
1466  000a 6b03          	ld	(OFST-2,sp),a
1467                     ; 401         temph = ADC1->DRH;
1469  000c c65404        	ld	a,21508
1470  000f 97            	ld	xl,a
1471                     ; 403         temph = (u16)(templ | (u16)(temph << (u8)8));
1473  0010 7b03          	ld	a,(OFST-2,sp)
1474  0012 02            	rlwa	x,a
1476  0013 201a          	jra	L516
1477  0015               L316:
1478                     ; 408         temph = ADC1->DRH;
1480  0015 c65404        	ld	a,21508
1481  0018 97            	ld	xl,a
1482                     ; 410         templ = ADC1->DRL;
1484  0019 c65405        	ld	a,21509
1485  001c 6b03          	ld	(OFST-2,sp),a
1486                     ; 412         temph = (u16)((u16)(templ << (u8)6) | (u16)(temph << (u8)8));
1488  001e 4f            	clr	a
1489  001f 02            	rlwa	x,a
1490  0020 1f01          	ldw	(OFST-4,sp),x
1491  0022 7b03          	ld	a,(OFST-2,sp)
1492  0024 97            	ld	xl,a
1493  0025 a640          	ld	a,#64
1494  0027 42            	mul	x,a
1495  0028 01            	rrwa	x,a
1496  0029 1a02          	or	a,(OFST-3,sp)
1497  002b 01            	rrwa	x,a
1498  002c 1a01          	or	a,(OFST-4,sp)
1499  002e 01            	rrwa	x,a
1500  002f               L516:
1501                     ; 415     return ((u16)temph);
1505  002f 5b05          	addw	sp,#5
1506  0031 81            	ret	
1552                     ; 427 void ADC1_AWDChannelConfig(ADC1_Channel_TypeDef Channel, FunctionalState NewState)
1552                     ; 428 {
1553                     .text:	section	.text,new
1554  0000               _ADC1_AWDChannelConfig:
1556  0000 89            	pushw	x
1557       00000000      OFST:	set	0
1560                     ; 430     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1562                     ; 431     assert_param(IS_ADC1_CHANNEL_OK(Channel));
1564                     ; 433     if (Channel < (u8)8)
1566  0001 9e            	ld	a,xh
1567  0002 a108          	cp	a,#8
1568  0004 242b          	jruge	L146
1569                     ; 435         if (NewState != DISABLE)
1571  0006 9f            	ld	a,xl
1572  0007 4d            	tnz	a
1573  0008 2711          	jreq	L346
1574                     ; 437             ADC1->AWCRL |= (u8)((u8)1 << Channel);
1576  000a 9e            	ld	a,xh
1577  000b 5f            	clrw	x
1578  000c 97            	ld	xl,a
1579  000d a601          	ld	a,#1
1580  000f 5d            	tnzw	x
1581  0010 2704          	jreq	L66
1582  0012               L07:
1583  0012 48            	sll	a
1584  0013 5a            	decw	x
1585  0014 26fc          	jrne	L07
1586  0016               L66:
1587  0016 ca540f        	or	a,21519
1589  0019 2011          	jp	LC004
1590  001b               L346:
1591                     ; 441             ADC1->AWCRL &= (u8)(~((u8)1 << Channel));
1593  001b 7b01          	ld	a,(OFST+1,sp)
1594  001d 5f            	clrw	x
1595  001e 97            	ld	xl,a
1596  001f a601          	ld	a,#1
1597  0021 5d            	tnzw	x
1598  0022 2704          	jreq	L27
1599  0024               L47:
1600  0024 48            	sll	a
1601  0025 5a            	decw	x
1602  0026 26fc          	jrne	L47
1603  0028               L27:
1604  0028 43            	cpl	a
1605  0029 c4540f        	and	a,21519
1606  002c               LC004:
1607  002c c7540f        	ld	21519,a
1608  002f 202e          	jra	L746
1609  0031               L146:
1610                     ; 446         if (NewState != DISABLE)
1612  0031 7b02          	ld	a,(OFST+2,sp)
1613  0033 2714          	jreq	L156
1614                     ; 448             ADC1->AWCRH |= (u8)((u8)1 << (Channel - (u8)8));
1616  0035 7b01          	ld	a,(OFST+1,sp)
1617  0037 a008          	sub	a,#8
1618  0039 5f            	clrw	x
1619  003a 97            	ld	xl,a
1620  003b a601          	ld	a,#1
1621  003d 5d            	tnzw	x
1622  003e 2704          	jreq	L67
1623  0040               L001:
1624  0040 48            	sll	a
1625  0041 5a            	decw	x
1626  0042 26fc          	jrne	L001
1627  0044               L67:
1628  0044 ca540e        	or	a,21518
1630  0047 2013          	jp	LC003
1631  0049               L156:
1632                     ; 452             ADC1->AWCRH &= (u8)(~((u8)1 << (Channel - (u8)8)));
1634  0049 7b01          	ld	a,(OFST+1,sp)
1635  004b a008          	sub	a,#8
1636  004d 5f            	clrw	x
1637  004e 97            	ld	xl,a
1638  004f a601          	ld	a,#1
1639  0051 5d            	tnzw	x
1640  0052 2704          	jreq	L201
1641  0054               L401:
1642  0054 48            	sll	a
1643  0055 5a            	decw	x
1644  0056 26fc          	jrne	L401
1645  0058               L201:
1646  0058 43            	cpl	a
1647  0059 c4540e        	and	a,21518
1648  005c               LC003:
1649  005c c7540e        	ld	21518,a
1650  005f               L746:
1651                     ; 455 }
1654  005f 85            	popw	x
1655  0060 81            	ret	
1690                     ; 463 void ADC1_SetHighThreshold(u16 Threshold)
1690                     ; 464 {
1691                     .text:	section	.text,new
1692  0000               _ADC1_SetHighThreshold:
1696                     ; 465     ADC1->HTRH = (u8)(Threshold >> (u8)8);
1698  0000 9e            	ld	a,xh
1699  0001 c75408        	ld	21512,a
1700                     ; 466     ADC1->HTRL = (u8)Threshold;
1702  0004 9f            	ld	a,xl
1703  0005 c75409        	ld	21513,a
1704                     ; 467 }
1707  0008 81            	ret	
1742                     ; 475 void ADC1_SetLowThreshold(u16 Threshold)
1742                     ; 476 {
1743                     .text:	section	.text,new
1744  0000               _ADC1_SetLowThreshold:
1748                     ; 477     ADC1->LTRL = (u8)Threshold;
1750  0000 9f            	ld	a,xl
1751  0001 c7540b        	ld	21515,a
1752                     ; 478     ADC1->LTRH = (u8)(Threshold >> (u8)8);
1754  0004 9e            	ld	a,xh
1755  0005 c7540a        	ld	21514,a
1756                     ; 479 }
1759  0008 81            	ret	
1812                     ; 488 u16 ADC1_GetBufferValue(u8 Buffer)
1812                     ; 489 {
1813                     .text:	section	.text,new
1814  0000               _ADC1_GetBufferValue:
1816  0000 88            	push	a
1817  0001 5205          	subw	sp,#5
1818       00000005      OFST:	set	5
1821                     ; 491     u16 temph = 0;
1823                     ; 492     u8 templ = 0;
1825                     ; 495     assert_param(IS_ADC1_BUFFER_OK(Buffer));
1827                     ; 497     if (ADC1->CR2 & ADC1_CR2_ALIGN) /* Right alignment */
1829  0003 7b06          	ld	a,(OFST+1,sp)
1830  0005 5f            	clrw	x
1831  0006 97            	ld	xl,a
1832  0007 58            	sllw	x
1833  0008 720754020e    	btjf	21506,#3,L737
1834                     ; 500         templ = *(u8*)(ADC1_BaseAddress + (Buffer << 1) + 1);
1836  000d d653e1        	ld	a,(21473,x)
1837  0010 6b03          	ld	(OFST-2,sp),a
1838                     ; 502         temph = *(u8*)(ADC1_BaseAddress + (Buffer << 1));
1840  0012 d653e0        	ld	a,(21472,x)
1841  0015 97            	ld	xl,a
1842                     ; 504         temph = (u16)(templ | (u16)(temph << (u8)8));
1844  0016 7b03          	ld	a,(OFST-2,sp)
1845  0018 02            	rlwa	x,a
1847  0019 2024          	jra	L147
1848  001b               L737:
1849                     ; 509         temph = *(u8*)(ADC1_BaseAddress + (Buffer << 1));
1851  001b d653e0        	ld	a,(21472,x)
1852  001e 5f            	clrw	x
1853  001f 97            	ld	xl,a
1854  0020 1f04          	ldw	(OFST-1,sp),x
1855                     ; 511         templ = *(u8*)(ADC1_BaseAddress + (Buffer << 1) + 1);
1857  0022 5f            	clrw	x
1858  0023 7b06          	ld	a,(OFST+1,sp)
1859  0025 97            	ld	xl,a
1860  0026 58            	sllw	x
1861  0027 d653e1        	ld	a,(21473,x)
1862  002a 6b03          	ld	(OFST-2,sp),a
1863                     ; 513         temph = (u16)((u16)(templ << (u8)6) | (u16)(temph << (u8)8));
1865  002c 4f            	clr	a
1866  002d 1e04          	ldw	x,(OFST-1,sp)
1867  002f 02            	rlwa	x,a
1868  0030 1f01          	ldw	(OFST-4,sp),x
1869  0032 7b03          	ld	a,(OFST-2,sp)
1870  0034 97            	ld	xl,a
1871  0035 a640          	ld	a,#64
1872  0037 42            	mul	x,a
1873  0038 01            	rrwa	x,a
1874  0039 1a02          	or	a,(OFST-3,sp)
1875  003b 01            	rrwa	x,a
1876  003c 1a01          	or	a,(OFST-4,sp)
1877  003e 01            	rrwa	x,a
1878  003f               L147:
1879                     ; 516     return ((u16)temph);
1883  003f 5b06          	addw	sp,#6
1884  0041 81            	ret	
1950                     ; 526 FlagStatus ADC1_GetAWDChannelStatus(ADC1_Channel_TypeDef Channel)
1950                     ; 527 {
1951                     .text:	section	.text,new
1952  0000               _ADC1_GetAWDChannelStatus:
1954  0000 88            	push	a
1955  0001 88            	push	a
1956       00000001      OFST:	set	1
1959                     ; 528     u8 status = 0;
1961  0002 0f01          	clr	(OFST+0,sp)
1962                     ; 531     assert_param(IS_ADC1_CHANNEL_OK(Channel));
1964                     ; 533     if (Channel < (u8)8)
1966  0004 a108          	cp	a,#8
1967  0006 2410          	jruge	L577
1968                     ; 535         status = (u8)(ADC1->AWSRL & ((u8)1 << Channel));
1970  0008 5f            	clrw	x
1971  0009 97            	ld	xl,a
1972  000a a601          	ld	a,#1
1973  000c 5d            	tnzw	x
1974  000d 2704          	jreq	L611
1975  000f               L021:
1976  000f 48            	sll	a
1977  0010 5a            	decw	x
1978  0011 26fc          	jrne	L021
1979  0013               L611:
1980  0013 c4540d        	and	a,21517
1982  0016 2012          	jra	L777
1983  0018               L577:
1984                     ; 539         status = (u8)(ADC1->AWSRH & ((u8)1 << (Channel - (u8)8)));
1986  0018 7b02          	ld	a,(OFST+1,sp)
1987  001a a008          	sub	a,#8
1988  001c 5f            	clrw	x
1989  001d 97            	ld	xl,a
1990  001e a601          	ld	a,#1
1991  0020 5d            	tnzw	x
1992  0021 2704          	jreq	L221
1993  0023               L421:
1994  0023 48            	sll	a
1995  0024 5a            	decw	x
1996  0025 26fc          	jrne	L421
1997  0027               L221:
1998  0027 c4540c        	and	a,21516
1999  002a               L777:
2000                     ; 542     return ((FlagStatus)status);
2004  002a 85            	popw	x
2005  002b 81            	ret	
2156                     ; 551 FlagStatus ADC1_GetFlagStatus(ADC1_Flag_TypeDef Flag)
2156                     ; 552 {
2157                     .text:	section	.text,new
2158  0000               _ADC1_GetFlagStatus:
2160  0000 88            	push	a
2161  0001 88            	push	a
2162       00000001      OFST:	set	1
2165                     ; 553     u8 flagstatus = 0;
2167                     ; 554     u8 temp = 0;
2169                     ; 557     assert_param(IS_ADC1_FLAG_OK(Flag));
2171                     ; 559     if ((Flag & 0x0F) == 0x01)
2173  0002 7b02          	ld	a,(OFST+1,sp)
2174  0004 a40f          	and	a,#15
2175  0006 4a            	dec	a
2176  0007 2607          	jrne	L5601
2177                     ; 562         flagstatus = (u8)(ADC1->CR3 & ADC1_CR3_OVR);
2179  0009 c65403        	ld	a,21507
2180  000c a440          	and	a,#64
2182  000e 2039          	jra	L7601
2183  0010               L5601:
2184                     ; 564     else if ((Flag & 0xF0) == 0x10)
2186  0010 7b02          	ld	a,(OFST+1,sp)
2187  0012 a4f0          	and	a,#240
2188  0014 a110          	cp	a,#16
2189  0016 262c          	jrne	L1701
2190                     ; 567         temp = (u8)(Flag & 0x0F);
2192  0018 7b02          	ld	a,(OFST+1,sp)
2193  001a a40f          	and	a,#15
2194  001c 6b01          	ld	(OFST+0,sp),a
2195                     ; 568         if (temp < 8)
2197  001e a108          	cp	a,#8
2198  0020 2410          	jruge	L3701
2199                     ; 570             flagstatus = (u8)(ADC1->AWSRL & (1 << temp));
2201  0022 5f            	clrw	x
2202  0023 97            	ld	xl,a
2203  0024 a601          	ld	a,#1
2204  0026 5d            	tnzw	x
2205  0027 2704          	jreq	L031
2206  0029               L231:
2207  0029 48            	sll	a
2208  002a 5a            	decw	x
2209  002b 26fc          	jrne	L231
2210  002d               L031:
2211  002d c4540d        	and	a,21517
2213  0030 2017          	jra	L7601
2214  0032               L3701:
2215                     ; 574             flagstatus = (u8)(ADC1->AWSRH & (1 << (temp - 8)));
2217  0032 a008          	sub	a,#8
2218  0034 5f            	clrw	x
2219  0035 97            	ld	xl,a
2220  0036 a601          	ld	a,#1
2221  0038 5d            	tnzw	x
2222  0039 2704          	jreq	L431
2223  003b               L631:
2224  003b 48            	sll	a
2225  003c 5a            	decw	x
2226  003d 26fc          	jrne	L631
2227  003f               L431:
2228  003f c4540c        	and	a,21516
2229  0042 2005          	jra	L7601
2230  0044               L1701:
2231                     ; 579         flagstatus = (u8)(ADC1->CSR & Flag);
2233  0044 c65400        	ld	a,21504
2234  0047 1402          	and	a,(OFST+1,sp)
2235  0049               L7601:
2236                     ; 581     return ((FlagStatus)flagstatus);
2240  0049 85            	popw	x
2241  004a 81            	ret	
2285                     ; 591 void ADC1_ClearFlag(ADC1_Flag_TypeDef Flag)
2285                     ; 592 {
2286                     .text:	section	.text,new
2287  0000               _ADC1_ClearFlag:
2289  0000 88            	push	a
2290  0001 88            	push	a
2291       00000001      OFST:	set	1
2294                     ; 593     u8 temp = 0;
2296  0002 0f01          	clr	(OFST+0,sp)
2297                     ; 596     assert_param(IS_ADC1_FLAG_OK(Flag));
2299                     ; 598     if ((Flag & 0x0F) == 0x01)
2301  0004 a40f          	and	a,#15
2302  0006 4a            	dec	a
2303  0007 2606          	jrne	L3211
2304                     ; 601         ADC1->CR3 &= (u8)(~ADC1_CR3_OVR);
2306  0009 721d5403      	bres	21507,#6
2308  000d 2045          	jra	L5211
2309  000f               L3211:
2310                     ; 603     else if ((Flag & 0xF0) == 0x10)
2312  000f 7b02          	ld	a,(OFST+1,sp)
2313  0011 a4f0          	and	a,#240
2314  0013 a110          	cp	a,#16
2315  0015 2634          	jrne	L7211
2316                     ; 606         temp = (u8)(Flag & 0x0F);
2318  0017 7b02          	ld	a,(OFST+1,sp)
2319  0019 a40f          	and	a,#15
2320  001b 6b01          	ld	(OFST+0,sp),a
2321                     ; 607         if (temp < 8)
2323  001d a108          	cp	a,#8
2324  001f 2414          	jruge	L1311
2325                     ; 609             ADC1->AWSRL &= (u8)(~((u8)1 << temp));
2327  0021 5f            	clrw	x
2328  0022 97            	ld	xl,a
2329  0023 a601          	ld	a,#1
2330  0025 5d            	tnzw	x
2331  0026 2704          	jreq	L241
2332  0028               L441:
2333  0028 48            	sll	a
2334  0029 5a            	decw	x
2335  002a 26fc          	jrne	L441
2336  002c               L241:
2337  002c 43            	cpl	a
2338  002d c4540d        	and	a,21517
2339  0030 c7540d        	ld	21517,a
2341  0033 201f          	jra	L5211
2342  0035               L1311:
2343                     ; 613             ADC1->AWSRH &= (u8)(~((u8)1 << (temp - 8)));
2345  0035 a008          	sub	a,#8
2346  0037 5f            	clrw	x
2347  0038 97            	ld	xl,a
2348  0039 a601          	ld	a,#1
2349  003b 5d            	tnzw	x
2350  003c 2704          	jreq	L641
2351  003e               L051:
2352  003e 48            	sll	a
2353  003f 5a            	decw	x
2354  0040 26fc          	jrne	L051
2355  0042               L641:
2356  0042 43            	cpl	a
2357  0043 c4540c        	and	a,21516
2358  0046 c7540c        	ld	21516,a
2359  0049 2009          	jra	L5211
2360  004b               L7211:
2361                     ; 618         ADC1->CSR &= (u8) (~Flag);
2363  004b 7b02          	ld	a,(OFST+1,sp)
2364  004d 43            	cpl	a
2365  004e c45400        	and	a,21504
2366  0051 c75400        	ld	21504,a
2367  0054               L5211:
2368                     ; 620 }
2371  0054 85            	popw	x
2372  0055 81            	ret	
2427                     ; 640 ITStatus ADC1_GetITStatus(ADC1_IT_TypeDef ITPendingBit)
2427                     ; 641 {
2428                     .text:	section	.text,new
2429  0000               _ADC1_GetITStatus:
2431  0000 89            	pushw	x
2432  0001 88            	push	a
2433       00000001      OFST:	set	1
2436                     ; 642     ITStatus itstatus = RESET;
2438                     ; 643     u8 temp = 0;
2440                     ; 646     assert_param(IS_ADC1_ITPENDINGBIT_OK(ITPendingBit));
2442                     ; 648     if ((ITPendingBit & 0xF0) == 0x10)
2444  0002 7b03          	ld	a,(OFST+2,sp)
2445  0004 a4f0          	and	a,#240
2446  0006 5f            	clrw	x
2447  0007 02            	rlwa	x,a
2448  0008 a30010        	cpw	x,#16
2449  000b 262c          	jrne	L5611
2450                     ; 651         temp = (u8)(ITPendingBit & 0x0F);
2452  000d 7b03          	ld	a,(OFST+2,sp)
2453  000f a40f          	and	a,#15
2454  0011 6b01          	ld	(OFST+0,sp),a
2455                     ; 652         if (temp < 8)
2457  0013 a108          	cp	a,#8
2458  0015 2410          	jruge	L7611
2459                     ; 654             itstatus = (u8)(ADC1->AWSRL & (u8)((u8)1 << temp));
2461  0017 5f            	clrw	x
2462  0018 97            	ld	xl,a
2463  0019 a601          	ld	a,#1
2464  001b 5d            	tnzw	x
2465  001c 2704          	jreq	L451
2466  001e               L651:
2467  001e 48            	sll	a
2468  001f 5a            	decw	x
2469  0020 26fc          	jrne	L651
2470  0022               L451:
2471  0022 c4540d        	and	a,21517
2473  0025 2017          	jra	L3711
2474  0027               L7611:
2475                     ; 658             itstatus = (u8)(ADC1->AWSRH & (u8)((u8)1 << (temp - 8)));
2477  0027 a008          	sub	a,#8
2478  0029 5f            	clrw	x
2479  002a 97            	ld	xl,a
2480  002b a601          	ld	a,#1
2481  002d 5d            	tnzw	x
2482  002e 2704          	jreq	L061
2483  0030               L261:
2484  0030 48            	sll	a
2485  0031 5a            	decw	x
2486  0032 26fc          	jrne	L261
2487  0034               L061:
2488  0034 c4540c        	and	a,21516
2489  0037 2005          	jra	L3711
2490  0039               L5611:
2491                     ; 663         itstatus = (u8)(ADC1->CSR & ITPendingBit);
2493  0039 c65400        	ld	a,21504
2494  003c 1403          	and	a,(OFST+2,sp)
2495  003e               L3711:
2496                     ; 665     return ((ITStatus)itstatus);
2500  003e 5b03          	addw	sp,#3
2501  0040 81            	ret	
2546                     ; 687 void ADC1_ClearITPendingBit(ADC1_IT_TypeDef ITPendingBit)
2546                     ; 688 {
2547                     .text:	section	.text,new
2548  0000               _ADC1_ClearITPendingBit:
2550  0000 89            	pushw	x
2551  0001 88            	push	a
2552       00000001      OFST:	set	1
2555                     ; 689     u8 temp = 0;
2557  0002 0f01          	clr	(OFST+0,sp)
2558                     ; 692     assert_param(IS_ADC1_ITPENDINGBIT_OK(ITPendingBit));
2560                     ; 694     if ((ITPendingBit& 0xF0) == 0x10)
2562  0004 01            	rrwa	x,a
2563  0005 a4f0          	and	a,#240
2564  0007 5f            	clrw	x
2565  0008 02            	rlwa	x,a
2566  0009 a30010        	cpw	x,#16
2567  000c 2634          	jrne	L7121
2568                     ; 697         temp = (u8)(ITPendingBit & 0x0F);
2570  000e 7b03          	ld	a,(OFST+2,sp)
2571  0010 a40f          	and	a,#15
2572  0012 6b01          	ld	(OFST+0,sp),a
2573                     ; 698         if (temp < 8)
2575  0014 a108          	cp	a,#8
2576  0016 2414          	jruge	L1221
2577                     ; 700             ADC1->AWSRL &= (u8)(~((u8)1 << temp));
2579  0018 5f            	clrw	x
2580  0019 97            	ld	xl,a
2581  001a a601          	ld	a,#1
2582  001c 5d            	tnzw	x
2583  001d 2704          	jreq	L661
2584  001f               L071:
2585  001f 48            	sll	a
2586  0020 5a            	decw	x
2587  0021 26fc          	jrne	L071
2588  0023               L661:
2589  0023 43            	cpl	a
2590  0024 c4540d        	and	a,21517
2591  0027 c7540d        	ld	21517,a
2593  002a 201f          	jra	L5221
2594  002c               L1221:
2595                     ; 704             ADC1->AWSRH &= (u8)(~((u8)1 << (temp - 8)));
2597  002c a008          	sub	a,#8
2598  002e 5f            	clrw	x
2599  002f 97            	ld	xl,a
2600  0030 a601          	ld	a,#1
2601  0032 5d            	tnzw	x
2602  0033 2704          	jreq	L271
2603  0035               L471:
2604  0035 48            	sll	a
2605  0036 5a            	decw	x
2606  0037 26fc          	jrne	L471
2607  0039               L271:
2608  0039 43            	cpl	a
2609  003a c4540c        	and	a,21516
2610  003d c7540c        	ld	21516,a
2611  0040 2009          	jra	L5221
2612  0042               L7121:
2613                     ; 709         ADC1->CSR &= (u8) (~ITPendingBit);
2615  0042 7b03          	ld	a,(OFST+2,sp)
2616  0044 43            	cpl	a
2617  0045 c45400        	and	a,21504
2618  0048 c75400        	ld	21504,a
2619  004b               L5221:
2620                     ; 711 }
2623  004b 5b03          	addw	sp,#3
2624  004d 81            	ret	
2637                     	xdef	_ADC1_ClearITPendingBit
2638                     	xdef	_ADC1_GetITStatus
2639                     	xdef	_ADC1_ClearFlag
2640                     	xdef	_ADC1_GetFlagStatus
2641                     	xdef	_ADC1_GetAWDChannelStatus
2642                     	xdef	_ADC1_GetBufferValue
2643                     	xdef	_ADC1_SetLowThreshold
2644                     	xdef	_ADC1_SetHighThreshold
2645                     	xdef	_ADC1_GetConversionValue
2646                     	xdef	_ADC1_StartConversion
2647                     	xdef	_ADC1_AWDChannelConfig
2648                     	xdef	_ADC1_ExternalTriggerConfig
2649                     	xdef	_ADC1_ConversionConfig
2650                     	xdef	_ADC1_SchmittTriggerConfig
2651                     	xdef	_ADC1_PrescalerConfig
2652                     	xdef	_ADC1_ITConfig
2653                     	xdef	_ADC1_DataBufferCmd
2654                     	xdef	_ADC1_ScanModeCmd
2655                     	xdef	_ADC1_Cmd
2656                     	xdef	_ADC1_Init
2657                     	xdef	_ADC1_DeInit
2676                     	end
