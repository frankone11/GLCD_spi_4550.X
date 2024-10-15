
PSECT delaysData,space=1,class=COMRAM
retardo:
    ds 1
ret1:
    ds 1
ret2:
    ds 1

	psect code
 
delay_10:
	global delay_10
	movwf retardo,a
ciclo0_10:
	movlw 5
	movwf ret1, a
ciclo1_10:
	decfsz ret1, a
	bra ciclo1_10
	decfsz retardo, a
	bra ciclo0_10
	return

delay_100:
	global delay_100
	movwf retardo, a
ciclo0_100:
	movlw 50
	movwf ret1, a
ciclo1_100:
	decfsz ret1, a
	bra ciclo1_100
	decfsz retardo, a
	bra ciclo0_100
	return

delay_1k:
	global delay_1k
	movwf retardo, a
ciclo0_1k:
	movlw 10
	movwf ret1, a
ciclo1_1k:
	movlw 50
	movwf ret2, a
ciclo2_1k:
	decfsz ret2, f, a
	bra ciclo2_1k
	decfsz ret1, f, a
	bra ciclo1_1k
	decfsz retardo, f, a
	bra ciclo0_1k
	return

delay_10k:
	global delay_10k
	movwf retardo, a
ciclo0_10k:
	movlw 50
	movwf ret1, a
ciclo1_10k:
	movlw 100
	movwf ret2, a
ciclo2_10k:
	decfsz ret2, f, a
	bra ciclo2_10k
	decfsz ret1, f, a
	bra ciclo1_10k
	decfsz retardo, f, a
	bra ciclo0_10k
	return
	
	end