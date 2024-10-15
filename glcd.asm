
#define __GLCD_COMP__
#include <xc.inc>
#include "spi.inc"
#include "delays.inc"
#include "glcd.inc"
	
PSECT glcdData,space=1,class=COMRAM
DTEMP:	
    ds 1
COLUMNA:
    ds 1
DATO:
    ds 1
CONT:
    ds 1
		
	global COLUMNA
		
psect code

GLCD_Comando_Serial:
	global GLCD_Comando_Serial
	bsf PORTD, PORTD_RD3_POSN, a
	movwf DTEMP, a
	SPI_envia 0F8h
	movlw 0F0h
	andwf DTEMP, W, a
	call SPI_Tranceive
	swapf DTEMP, W, a
	andlw 0F0h
	call SPI_Tranceive
	bcf PORTD, PORTD_RD3_POSN, a
	Delay100 4
	return
	
GLCD_Dato_Serial:
	global GLCD_Dato_Serial
	bsf PORTD, PORTD_RD3_POSN, a
	movwf DTEMP, a
	SPI_envia 0FAh
	movlw 0F0h
	andwf DTEMP, W, a
	call SPI_Tranceive
	swapf DTEMP, W, a
	andlw 0F0h
	call SPI_Tranceive
	bcf PORTD, PORTD_RD3_POSN, a
	Delay100 4
	return

GLCD_Inicializa_Serial:
	global GLCD_Inicializa_Serial 
	Delay1K 0FFh
	movlw FUNCTION_SET | FUNCTION_8BIT
	call GLCD_Comando_Serial
	movlw DISPLAY_CONTROL | DISPLAY_ON
	call GLCD_Comando_Serial
	movlw CLEAR
	call GLCD_Comando_Serial
	movlw ENTRY_MODE | ENTRY_SHIFT_INCREASE
	call GLCD_Comando_Serial
	return
	
GLCD_Dibuja_Columna_Serial:
	global GLCD_Dibuja_Columna_Serial
	movwf DATO, a
	movlw FUNCTION_SET | FUNCTION_8BIT | FUNCTION_EXTENDED
	call GLCD_Comando_Serial
	movlw EXTENDED_FUNCTION_SET | EXTENDED_8BIT | EXTENDED_SET | GRAPHIC_DISPLAY
	call GLCD_Comando_Serial

	movlw 32
	cpfslt COLUMNA, a
	goto sxts2

	movf COLUMNA, w, a
	iorlw SET_Y
	call GLCD_Comando_Serial
	movlw SET_X1
	call GLCD_Comando_Serial
	goto siguedibujandotablas
sxts2:
	movlw 32
	subwf COLUMNA, w, a
	iorlw SET_Y
	call GLCD_Comando_Serial
	movlw SET_X2
	call GLCD_Comando_Serial

siguedibujandotablas:
	movlw EXTENDED_FUNCTION_SET | EXTENDED_8BIT | GRAPHIC_DISPLAY
	call GLCD_Comando_Serial
	movlw 16
	movwf CONT, a
ciclodibujacoltablas:
	tblrd *+
	movf TABLAT, w, a
	call GLCD_Dato_Serial
	decfsz CONT, f, a
	goto ciclodibujacoltablas
	return
	
	end