#ifndef __delays_inc__
#define __delays_inc__
	
EXTRN delay_100
EXTRN delay_1k
EXTRN delay_10k


Delay100 macro tiempo
	movlw tiempo
	call delay_100
	endm
Delay1K macro tiempo
	movlw tiempo
	call delay_1k
	endm
Delay10K macro tiempo
	movlw tiempo
	call delay_10k
	endm
	
#endif