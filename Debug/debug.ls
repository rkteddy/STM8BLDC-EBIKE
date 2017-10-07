   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
   3                     ; Optimizer V4.2.8 - 03 Dec 2008
  37                     ; 4 void DebugInit(void)
  37                     ; 5 {
  39                     	switch	.text
  40  0000               _DebugInit:
  44                     ; 6   UART1_DeInit();
  46  0000 cd0000        	call	_UART1_DeInit
  48                     ; 7   UART1_Init((u32)460800, UART1_WORDLENGTH_8D, UART1_STOPBITS_1, \
  48                     ; 8     	UART1_PARITY_NO , UART1_SYNCMODE_CLOCK_DISABLE , UART1_MODE_TX_ENABLE);
  50  0003 4b04          	push	#4
  51  0005 4b80          	push	#128
  52  0007 4b00          	push	#0
  53  0009 4b00          	push	#0
  54  000b 4b00          	push	#0
  55  000d ae0800        	ldw	x,#2048
  56  0010 89            	pushw	x
  57  0011 ae0007        	ldw	x,#7
  58  0014 89            	pushw	x
  59  0015 cd0000        	call	_UART1_Init
  61  0018 5b09          	addw	sp,#9
  62                     ; 9   UART1_Cmd(ENABLE);
  64  001a a601          	ld	a,#1
  65  001c cd0000        	call	_UART1_Cmd
  67                     ; 10 	UART1_ClearFlag(UART1_FLAG_TXE);
  69  001f ae0080        	ldw	x,#128
  71                     ; 11 }
  74  0022 cc0000        	jp	_UART1_ClearFlag
 110                     ; 13 void SendChar(u8 data)
 110                     ; 14 {
 111                     	switch	.text
 112  0025               _SendChar:
 114  0025 88            	push	a
 115       00000000      OFST:	set	0
 118  0026               L14:
 119                     ; 15   while (UART1_GetFlagStatus(UART1_FLAG_TXE) == RESET);
 121  0026 ae0080        	ldw	x,#128
 122  0029 cd0000        	call	_UART1_GetFlagStatus
 124  002c 4d            	tnz	a
 125  002d 27f7          	jreq	L14
 126                     ; 16 	UART1_SendData8((unsigned char)data);
 128  002f 7b01          	ld	a,(OFST+1,sp)
 129  0031 cd0000        	call	_UART1_SendData8
 131                     ; 17 }
 134  0034 84            	pop	a
 135  0035 81            	ret	
 171                     ; 19 void SendString(unsigned char * p)
 171                     ; 20 {
 172                     	switch	.text
 173  0036               _SendString:
 175  0036 89            	pushw	x
 176       00000000      OFST:	set	0
 179  0037 2007          	jra	L56
 180  0039               L36:
 181                     ; 22 		SendChar(*(p++));
 183  0039 5c            	incw	x
 184  003a 1f01          	ldw	(OFST+1,sp),x
 185  003c 5a            	decw	x
 186  003d f6            	ld	a,(x)
 187  003e ade5          	call	_SendChar
 189  0040               L56:
 190                     ; 21 	while(*p)
 192  0040 1e01          	ldw	x,(OFST+1,sp)
 193  0042 f6            	ld	a,(x)
 194  0043 26f4          	jrne	L36
 195                     ; 23 	SendChar('\r');
 197  0045 a60d          	ld	a,#13
 198  0047 addc          	call	_SendChar
 200                     ; 24 	SendChar('\n');
 202  0049 a60a          	ld	a,#10
 203  004b add8          	call	_SendChar
 205                     ; 25 }
 208  004d 85            	popw	x
 209  004e 81            	ret	
 244                     ; 27 void  SendInt(int num)
 244                     ; 28 {
 245                     	switch	.text
 246  004f               _SendInt:
 248  004f 89            	pushw	x
 249       00000000      OFST:	set	0
 252                     ; 29         if(num>=0)
 254  0050 5d            	tnzw	x
 255  0051 2b08          	jrmi	L701
 256                     ; 31                 SendChar('+');
 258  0053 a62b          	ld	a,#43
 259  0055 adce          	call	_SendChar
 262  0057 1e01          	ldw	x,(OFST+1,sp)
 263  0059 2009          	jra	L111
 264  005b               L701:
 265                     ; 35                 SendChar('-');
 267  005b a62d          	ld	a,#45
 268  005d adc6          	call	_SendChar
 270                     ; 36                 num=-num;
 272  005f 1e01          	ldw	x,(OFST+1,sp)
 273  0061 50            	negw	x
 274  0062 1f01          	ldw	(OFST+1,sp),x
 275  0064               L111:
 276                     ; 38        SendChar((unsigned char)(num/10000)+'0');
 278  0064 90ae2710      	ldw	y,#10000
 279  0068 cd0000        	call	c_idiv
 281  006b 9f            	ld	a,xl
 282  006c ab30          	add	a,#48
 283  006e adb5          	call	_SendChar
 285                     ; 39        SendChar((unsigned char)(num%10000/1000)+'0');
 287  0070 1e01          	ldw	x,(OFST+1,sp)
 288  0072 90ae2710      	ldw	y,#10000
 289  0076 cd0000        	call	c_idiv
 291  0079 93            	ldw	x,y
 292  007a 90ae03e8      	ldw	y,#1000
 293  007e cd0000        	call	c_idiv
 295  0081 9f            	ld	a,xl
 296  0082 ab30          	add	a,#48
 297  0084 ad9f          	call	_SendChar
 299                     ; 40        SendChar((unsigned char)(num%1000/100)+'0');
 301  0086 1e01          	ldw	x,(OFST+1,sp)
 302  0088 90ae03e8      	ldw	y,#1000
 303  008c cd0000        	call	c_idiv
 305  008f 93            	ldw	x,y
 306  0090 a664          	ld	a,#100
 307  0092 cd0000        	call	c_sdivx
 309  0095 9f            	ld	a,xl
 310  0096 ab30          	add	a,#48
 311  0098 ad8b          	call	_SendChar
 313                     ; 41        SendChar((unsigned char)(num%100/10)+'0');
 315  009a 1e01          	ldw	x,(OFST+1,sp)
 316  009c a664          	ld	a,#100
 317  009e cd0000        	call	c_smodx
 319  00a1 a60a          	ld	a,#10
 320  00a3 cd0000        	call	c_sdivx
 322  00a6 9f            	ld	a,xl
 323  00a7 ab30          	add	a,#48
 324  00a9 cd0025        	call	_SendChar
 326                     ; 42        SendChar((unsigned char)(num%10)+'0');
 328  00ac 1e01          	ldw	x,(OFST+1,sp)
 329  00ae a60a          	ld	a,#10
 330  00b0 cd0000        	call	c_smodx
 332  00b3 9f            	ld	a,xl
 333  00b4 ab30          	add	a,#48
 334  00b6 cd0025        	call	_SendChar
 336                     ; 43        SendChar(' ');
 338  00b9 a620          	ld	a,#32
 339  00bb cd0025        	call	_SendChar
 341                     ; 44 }
 344  00be 85            	popw	x
 345  00bf 81            	ret	
 380                     ; 46 void  SendUInt(u16 num)
 380                     ; 47 {
 381                     	switch	.text
 382  00c0               _SendUInt:
 384  00c0 89            	pushw	x
 385       00000000      OFST:	set	0
 388                     ; 48        SendChar((unsigned char)(num/10000)+'0');
 390  00c1 90ae2710      	ldw	y,#10000
 391  00c5 65            	divw	x,y
 392  00c6 9f            	ld	a,xl
 393  00c7 ab30          	add	a,#48
 394  00c9 cd0025        	call	_SendChar
 396                     ; 49        SendChar((unsigned char)(num%10000/1000)+'0');
 398  00cc 1e01          	ldw	x,(OFST+1,sp)
 399  00ce 90ae2710      	ldw	y,#10000
 400  00d2 65            	divw	x,y
 401  00d3 93            	ldw	x,y
 402  00d4 90ae03e8      	ldw	y,#1000
 403  00d8 65            	divw	x,y
 404  00d9 9f            	ld	a,xl
 405  00da ab30          	add	a,#48
 406  00dc cd0025        	call	_SendChar
 408                     ; 50        SendChar((unsigned char)(num%1000/100)+'0');
 410  00df 1e01          	ldw	x,(OFST+1,sp)
 411  00e1 90ae03e8      	ldw	y,#1000
 412  00e5 65            	divw	x,y
 413  00e6 93            	ldw	x,y
 414  00e7 a664          	ld	a,#100
 415  00e9 62            	div	x,a
 416  00ea 9f            	ld	a,xl
 417  00eb ab30          	add	a,#48
 418  00ed cd0025        	call	_SendChar
 420                     ; 51        SendChar((unsigned char)(num%100/10)+'0');
 422  00f0 1e01          	ldw	x,(OFST+1,sp)
 423  00f2 a664          	ld	a,#100
 424  00f4 62            	div	x,a
 425  00f5 5f            	clrw	x
 426  00f6 97            	ld	xl,a
 427  00f7 a60a          	ld	a,#10
 428  00f9 62            	div	x,a
 429  00fa 9f            	ld	a,xl
 430  00fb ab30          	add	a,#48
 431  00fd cd0025        	call	_SendChar
 433                     ; 52        SendChar((unsigned char)(num%10)+'0');
 435  0100 1e01          	ldw	x,(OFST+1,sp)
 436  0102 a60a          	ld	a,#10
 437  0104 62            	div	x,a
 438  0105 5f            	clrw	x
 439  0106 97            	ld	xl,a
 440  0107 ab30          	add	a,#48
 441  0109 cd0025        	call	_SendChar
 443                     ; 53        SendChar(' ');
 445  010c a620          	ld	a,#32
 446  010e cd0025        	call	_SendChar
 448                     ; 54 }
 451  0111 85            	popw	x
 452  0112 81            	ret	
 487                     ; 56 void  SendUchar(unsigned char num)
 487                     ; 57 {
 488                     	switch	.text
 489  0113               _SendUchar:
 491  0113 88            	push	a
 492       00000000      OFST:	set	0
 495                     ; 58        SendChar((unsigned char)(num/100)+'0');
 497  0114 ae0064        	ldw	x,#100
 498  0117 9093          	ldw	y,x
 499  0119 5f            	clrw	x
 500  011a 97            	ld	xl,a
 501  011b 65            	divw	x,y
 502  011c 9f            	ld	a,xl
 503  011d ab30          	add	a,#48
 504  011f cd0025        	call	_SendChar
 506                     ; 59        SendChar((unsigned char)(num%100/10)+'0');
 508  0122 7b01          	ld	a,(OFST+1,sp)
 509  0124 5f            	clrw	x
 510  0125 97            	ld	xl,a
 511  0126 a664          	ld	a,#100
 512  0128 cd0000        	call	c_smodx
 514  012b a60a          	ld	a,#10
 515  012d cd0000        	call	c_sdivx
 517  0130 9f            	ld	a,xl
 518  0131 ab30          	add	a,#48
 519  0133 cd0025        	call	_SendChar
 521                     ; 60        SendChar((unsigned char)(num%10)+'0');
 523  0136 7b01          	ld	a,(OFST+1,sp)
 524  0138 ae000a        	ldw	x,#10
 525  013b 9093          	ldw	y,x
 526  013d 5f            	clrw	x
 527  013e 97            	ld	xl,a
 528  013f 65            	divw	x,y
 529  0140 909f          	ld	a,yl
 530  0142 ab30          	add	a,#48
 531  0144 cd0025        	call	_SendChar
 533                     ; 61        SendChar(' ');
 535  0147 a620          	ld	a,#32
 536  0149 cd0025        	call	_SendChar
 538                     ; 62 }
 541  014c 84            	pop	a
 542  014d 81            	ret	
 555                     	xdef	_SendUInt
 556                     	xdef	_SendString
 557                     	xdef	_SendInt
 558                     	xdef	_SendUchar
 559                     	xdef	_SendChar
 560                     	xdef	_DebugInit
 561                     	xref	_UART1_ClearFlag
 562                     	xref	_UART1_GetFlagStatus
 563                     	xref	_UART1_SendData8
 564                     	xref	_UART1_Cmd
 565                     	xref	_UART1_Init
 566                     	xref	_UART1_DeInit
 567                     	xref.b	c_x
 586                     	xref	c_smodx
 587                     	xref	c_sdivx
 588                     	xref	c_idiv
 589                     	end
