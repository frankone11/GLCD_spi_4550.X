#ifndef __KT_SPI_MODULE__
#define __KT_SPI_MODULE__

EXTRN SPI_Inicializa
EXTRN SPI_Tranceive
	
SPI_envia	macro dato
	movlw dato
	call SPI_Tranceive
	endm
	
SPI_recibe	macro
	movlw H'FF'
	call SPI_Tranceive
	endm
	
#endif


