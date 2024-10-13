;********************************************************************************
;	Biblioteca para manejar el LCD Gráfico de 128x64			*
;										*
;	Autor: García Olmos Francisco Javier					*
;	Fecha: 24 de Mayo de 2012						*
;	Archivo: glcd.inc							*
;	Es necesario el archivo glcd.asm					*
;********************************************************************************
	
#ifndef __KT_GLCD_MODULE__
#define __KT_GLCD_MODULE__

;--------------------------------------------------------------------------------
; Comandos básicos

CLEAR			EQU	01h
HOME			EQU	02h
ENTRY_MODE		EQU	04h
DISPLAY_CONTROL		EQU	08h
CURSOR_DISPLAY_CONTROL	EQU	10h
FUNCTION_SET		EQU	20h
SET_CGRAM_ADDR		EQU	40h
SET_DDRAM_ADDR		EQU	80h

;--------------------------------------------------------------------------------
; Instrucciones Extendidas

STAND_BY		EQU	01h
SET_SCROLL_OR_RAM	EQU	02h
REVERSE			EQU	04h
GLCD_SLEEP		EQU	08h
EXTENDED_FUNCTION_SET	EQU	20h
SET_SCROLL_OR_RAM_ADDR	EQU	40h
SET_GRAM_ADDR		EQU	80h


;--------------------------------------------------------------------------------
; Control de Modo (ENTRY MODE)

ENTRY_SHIFT_DECREASE	EQU	01h
ENTRY_SHIFT_INCREASE	EQU	02h

;--------------------------------------------------------------------------------
; Control del Display

BLINK_ON		EQU	01h
CURSOR_ON		EQU	02h
DISPLAY_ON		EQU	04h

;--------------------------------------------------------------------------------
; Control del Cursor

CURSOR_SHIFT		EQU	08h
CURSOR_RIGHT		EQU	04h

;--------------------------------------------------------------------------------
; Control de la Función

FUNCTION_8BIT		EQU	10h
FUNCTION_EXTENDED	EQU	04h

;--------------------------------------------------------------------------------
; Control de SCROLL

SCROLL_ENABLE		EQU	01h
RAM_ENABLE		EQU	00h

;--------------------------------------------------------------------------------
; Control de SLEEP

SLEEP_LEAVE		EQU	01h
SLEEP_ENTER		EQU	00h

;--------------------------------------------------------------------------------
; Control de la DDRAM

LINE_1			EQU	00h
LINE_2			EQU	10h
LINE_3			EQU	08h
LINE_4			EQU	18h

;--------------------------------------------------------------------------------
;Control por líneas de la DDRAM

DDRAM_L1		EQU	80h
DDRAM_L2		EQU	90h
DDRAM_L3		EQU	88h
DDRAM_L4		EQU	98h

;--------------------------------------------------------------------------------
; Control de las funciones extendidas

EXTENDED_8BIT		EQU	10h
EXTENDED_SET		EQU	04h
BASIC_SET		EQU	00h
GRAPHIC_DISPLAY		EQU	02h

;--------------------------------------------------------------------------------
; Control por coordenadas de la RAM Gráfica

SET_Y			EQU	80h
SET_X1			EQU	80h
SET_X2			EQU	88h


#ifndef __GLCD_COMP__
EXTRN GLCD_Comando_Serial
EXTRN GLCD_Dato_Serial
EXTRN GLCD_Inicializa_Serial
EXTRN GLCD_Dibuja_Columna_Serial
EXTRN COLUMNA
#endif

#endif


