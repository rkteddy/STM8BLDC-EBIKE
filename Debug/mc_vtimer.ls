   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
   3                     ; Optimizer V4.2.8 - 03 Dec 2008
  45                     ; 31 void vtimer_init()
  45                     ; 32 {
  47                     .text:	section	.text,new
  48  0000               _vtimer_init:
  50  0000 88            	push	a
  51       00000001      OFST:	set	1
  54                     ; 34 	for (i = 0; i < VTIMER_NUM; i++)
  56  0001 4f            	clr	a
  57  0002 6b01          	ld	(OFST+0,sp),a
  58  0004               L13:
  59                     ; 36 		sVtimer[i].msec = 0;
  61  0004 97            	ld	xl,a
  62  0005 a604          	ld	a,#4
  63  0007 42            	mul	x,a
  64  0008 905f          	clrw	y
  65  000a df0000        	ldw	(L3_sVtimer,x),y
  66                     ; 37 		sVtimer[i].pCallback = 0;
  68  000d df0002        	ldw	(L3_sVtimer+2,x),y
  69                     ; 34 	for (i = 0; i < VTIMER_NUM; i++)
  71  0010 0c01          	inc	(OFST+0,sp)
  74  0012 7b01          	ld	a,(OFST+0,sp)
  75  0014 a10b          	cp	a,#11
  76  0016 25ec          	jrult	L13
  77                     ; 39 }
  80  0018 84            	pop	a
  81  0019 81            	ret	
 226                     ; 41 void vtimer_SetTimer(VtimerName_t name,timer_res_t  msec,void* pCallback)
 226                     ; 42 {
 227                     .text:	section	.text,new
 228  0000               _vtimer_SetTimer:
 230  0000 88            	push	a
 231       00000000      OFST:	set	0
 234                     ; 43 	sVtimer[name].msec = msec;
 236  0001 97            	ld	xl,a
 237  0002 a604          	ld	a,#4
 238  0004 42            	mul	x,a
 239  0005 1604          	ldw	y,(OFST+4,sp)
 240  0007 df0000        	ldw	(L3_sVtimer,x),y
 241                     ; 44 	sVtimer[name].pCallback = pCallback;
 243  000a 7b01          	ld	a,(OFST+1,sp)
 244  000c 97            	ld	xl,a
 245  000d a604          	ld	a,#4
 246  000f 42            	mul	x,a
 247  0010 1606          	ldw	y,(OFST+6,sp)
 248  0012 df0002        	ldw	(L3_sVtimer+2,x),y
 249                     ; 45 }
 252  0015 84            	pop	a
 253  0016 81            	ret	
 289                     ; 47 void vtimer_KillTimer(VtimerName_t name)
 289                     ; 48 {
 290                     .text:	section	.text,new
 291  0000               _vtimer_KillTimer:
 293  0000 88            	push	a
 294       00000000      OFST:	set	0
 297                     ; 49 	sVtimer[name].msec = 0;
 299  0001 97            	ld	xl,a
 300  0002 a604          	ld	a,#4
 301  0004 42            	mul	x,a
 302  0005 905f          	clrw	y
 303  0007 df0000        	ldw	(L3_sVtimer,x),y
 304                     ; 50 	sVtimer[name].pCallback = 0;
 306  000a 7b01          	ld	a,(OFST+1,sp)
 307  000c 97            	ld	xl,a
 308  000d a604          	ld	a,#4
 309  000f 42            	mul	x,a
 310                     ; 51 }
 313  0010 84            	pop	a
 314  0011 df0002        	ldw	(L3_sVtimer+2,x),y
 315  0014 81            	ret	
 352                     ; 53 u8 vtimer_TimerElapsed(VtimerName_t name)
 352                     ; 54 {
 353                     .text:	section	.text,new
 354  0000               _vtimer_TimerElapsed:
 358                     ; 55 	if (sVtimer[name].msec == 0)
 360  0000 97            	ld	xl,a
 361  0001 a604          	ld	a,#4
 362  0003 42            	mul	x,a
 363  0004 d60001        	ld	a,(L3_sVtimer+1,x)
 364  0007 da0000        	or	a,(L3_sVtimer,x)
 365  000a 2602          	jrne	L551
 366                     ; 56 		return TRUE;
 368  000c 4c            	inc	a
 371  000d 81            	ret	
 372  000e               L551:
 373                     ; 58 		return FALSE;
 375  000e 4f            	clr	a
 378  000f 81            	ret	
 414                     ; 63 void vtimer_UpdateHandler(void)
 414                     ; 64 {
 415                     .text:	section	.text,new
 416  0000               _vtimer_UpdateHandler:
 418  0000 88            	push	a
 419       00000001      OFST:	set	1
 422                     ; 68 	for (i = 0; i < VTIMER_NUM; i++)
 424  0001 4f            	clr	a
 425  0002 6b01          	ld	(OFST+0,sp),a
 426  0004               L771:
 427                     ; 70 		if (sVtimer[i].msec != 0)
 429  0004 97            	ld	xl,a
 430  0005 a604          	ld	a,#4
 431  0007 42            	mul	x,a
 432  0008 d60001        	ld	a,(L3_sVtimer+1,x)
 433  000b da0000        	or	a,(L3_sVtimer,x)
 434  000e 2724          	jreq	L502
 435                     ; 72 			sVtimer[i].msec--;
 437  0010 9093          	ldw	y,x
 438  0012 de0000        	ldw	x,(L3_sVtimer,x)
 439  0015 5a            	decw	x
 440  0016 90df0000      	ldw	(L3_sVtimer,y),x
 441                     ; 73 			if (sVtimer[i].pCallback != 0)
 443  001a 7b01          	ld	a,(OFST+0,sp)
 444  001c 97            	ld	xl,a
 445  001d a604          	ld	a,#4
 446  001f 42            	mul	x,a
 447  0020 d60003        	ld	a,(L3_sVtimer+3,x)
 448  0023 da0002        	or	a,(L3_sVtimer+2,x)
 449  0026 270c          	jreq	L502
 450                     ; 75 				if (sVtimer[i].msec == 0) 
 452  0028 d60001        	ld	a,(L3_sVtimer+1,x)
 453  002b da0000        	or	a,(L3_sVtimer,x)
 454  002e 2604          	jrne	L502
 455                     ; 77 					((PFN_Callback_t)sVtimer[i].pCallback)();
 457  0030 de0002        	ldw	x,(L3_sVtimer+2,x)
 458  0033 fd            	call	(x)
 460  0034               L502:
 461                     ; 68 	for (i = 0; i < VTIMER_NUM; i++)
 463  0034 0c01          	inc	(OFST+0,sp)
 466  0036 7b01          	ld	a,(OFST+0,sp)
 467  0038 a10b          	cp	a,#11
 468  003a 25c8          	jrult	L771
 469                     ; 82 }
 472  003c 84            	pop	a
 473  003d 81            	ret	
 524                     	switch	.bss
 525  0000               L3_sVtimer:
 526  0000 000000000000  	ds.b	44
 527                     	xdef	_vtimer_UpdateHandler
 528                     	xdef	_vtimer_TimerElapsed
 529                     	xdef	_vtimer_KillTimer
 530                     	xdef	_vtimer_SetTimer
 531                     	xdef	_vtimer_init
 551                     	end
