   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
   3                     ; Optimizer V4.2.8 - 03 Dec 2008
  67                     ; 31 void dev_optInit(void)
  67                     ; 32 {
  69                     	switch	.text
  70  0000               _dev_optInit:
  72  0000 5203          	subw	sp,#3
  73       00000003      OFST:	set	3
  76                     ; 38 	for (i=0;i<5000;i++);
  78  0002 5f            	clrw	x
  79  0003               L73:
  83  0003 5c            	incw	x
  86  0004 a31388        	cpw	x,#5000
  87  0007 25fa          	jrult	L73
  88  0009 1f02          	ldw	(OFST-1,sp),x
  89                     ; 41 	FLASH_SetProgrammingTime(FLASH_PROGRAMTIME_STANDARD);
  91  000b 4f            	clr	a
  92  000c cd0000        	call	_FLASH_SetProgrammingTime
  94                     ; 44 	FLASH_Unlock(FLASH_MEMTYPE_DATA);
  96  000f a601          	ld	a,#1
  97  0011 cd0000        	call	_FLASH_Unlock
  99                     ; 52 		if (FLASH_ReadOptionByte(0x480D) != 0x00FF)
 101  0014 ae480d        	ldw	x,#18445
 102  0017 cd0000        	call	_FLASH_ReadOptionByte
 104  001a a300ff        	cpw	x,#255
 105  001d 2709          	jreq	L54
 106                     ; 54 			FLASH_ProgramOptionByte(0x480D, 0x00); // Set 0 Wait State
 108  001f 4b00          	push	#0
 109  0021 ae480d        	ldw	x,#18445
 110  0024 cd0000        	call	_FLASH_ProgramOptionByte
 112  0027 84            	pop	a
 113  0028               L54:
 114                     ; 58 	Opt =0;//  FLASH_ReadOptionByte(0x4803);
 116                     ; 62 		Opt |= 0x02;
 118  0028 a602          	ld	a,#2
 119                     ; 70 		Opt &= (u8)(~0x01);
 121  002a a4fe          	and	a,#254
 122  002c 6b01          	ld	(OFST-2,sp),a
 123                     ; 73 	OptComp = (u8)(~Opt) | (Opt << 8);
 125  002e ae02fd        	ldw	x,#765
 126  0031 1f02          	ldw	(OFST-1,sp),x
 127                     ; 75 	if (OptComp != FLASH_ReadOptionByte(0x4803))
 129  0033 ae4803        	ldw	x,#18435
 130  0036 cd0000        	call	_FLASH_ReadOptionByte
 132  0039 1302          	cpw	x,(OFST-1,sp)
 133  003b 270a          	jreq	L74
 134                     ; 77 		FLASH_ProgramOptionByte(0x4803, Opt );
 136  003d 7b01          	ld	a,(OFST-2,sp)
 137  003f 88            	push	a
 138  0040 ae4803        	ldw	x,#18435
 139  0043 cd0000        	call	_FLASH_ProgramOptionByte
 141  0046 84            	pop	a
 142  0047               L74:
 143                     ; 81 	FLASH_Lock(FLASH_MEMTYPE_DATA);
 145  0047 a601          	ld	a,#1
 146  0049 cd0000        	call	_FLASH_Lock
 148                     ; 82 }
 151  004c 5b03          	addw	sp,#3
 152  004e 81            	ret	
 165                     	xdef	_dev_optInit
 166                     	xref	_FLASH_SetProgrammingTime
 167                     	xref	_FLASH_ProgramOptionByte
 168                     	xref	_FLASH_ReadOptionByte
 169                     	xref	_FLASH_Lock
 170                     	xref	_FLASH_Unlock
 189                     	end
