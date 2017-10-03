#ifndef __DEBUG_H__
#define __DEBUG_H__

void DebugInit(void);
void SendChar(u8);
void SendUchar(unsigned char num);
void SendInt(int num);
void SendString(unsigned char * p);
void SendUInt(u16 num);

#endif