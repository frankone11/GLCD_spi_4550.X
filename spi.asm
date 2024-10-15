	#include <xc.inc>
	
psect code
	
SPI_Inicializa:
	global SPI_Inicializa
	movlw SSP1CON1_SSPEN_MASK | SSP1CON1_CKP_MASK
	movwf SSP1CON1, a
	return

SPI_Tranceive:
	global SPI_Tranceive
	movwf SSP1BUF, a
	btfss SSP1STAT, SSP1STAT_BF_POSN, a
	bra $-2
	movf SSP1BUF, w, a ;Regresamos el resultado en W
	return
	
	end


