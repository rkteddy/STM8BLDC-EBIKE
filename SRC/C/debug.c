#include "stm8s_lib.h"
#include <debug.h>

void DebugInit(void)
{
  UART1_DeInit();
  UART1_Init((u32)460800, UART1_WORDLENGTH_8D, UART1_STOPBITS_1, \
    	UART1_PARITY_NO , UART1_SYNCMODE_CLOCK_DISABLE , UART1_MODE_TX_ENABLE);
  UART1_Cmd(ENABLE);
	UART1_ClearFlag(UART1_FLAG_TXE);
}

void SendChar(u8 data)
{
  while (UART1_GetFlagStatus(UART1_FLAG_TXE) == RESET);
	UART1_SendData8((unsigned char)data);
}

void SendString(unsigned char * p)
{
	while(*p)
		SendChar(*(p++));
	SendChar('\r');
	SendChar('\n');
}

void  SendInt(int num)
{
        if(num>=0)
        {
                SendChar('+');
        }
        else 
        {
                SendChar('-');
                num=-num;
        }
       SendChar((unsigned char)(num/10000)+'0');
       SendChar((unsigned char)(num%10000/1000)+'0');
       SendChar((unsigned char)(num%1000/100)+'0');
       SendChar((unsigned char)(num%100/10)+'0');
       SendChar((unsigned char)(num%10)+'0');
       SendChar(' ');
}

void  SendUInt(u16 num)
{
       SendChar((unsigned char)(num/10000)+'0');
       SendChar((unsigned char)(num%10000/1000)+'0');
       SendChar((unsigned char)(num%1000/100)+'0');
       SendChar((unsigned char)(num%100/10)+'0');
       SendChar((unsigned char)(num%10)+'0');
       SendChar(' ');
}
                
void  SendUchar(unsigned char num)
{
       SendChar((unsigned char)(num/100)+'0');
       SendChar((unsigned char)(num%100/10)+'0');
       SendChar((unsigned char)(num%10)+'0');
       SendChar(' ');
}