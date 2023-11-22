.data

	i:		.word	0
	C:		.word	7
	A:		.space	800
	B:		.space	800

.text

	daddi	R1,R0,0			; inicializa i
	ld	R5,C(R0)			; carrega o valor de C
	daddi	R9,R0,8			; tamanho da dword para multiplicação pelo índice
	
loop:

	dmul	R2,R1,R9		; R2 = offset de i

	; 6 bolhas (r2)
	ld	R4,B(R2)			; carrega o valor de B[i]
	
	; 1 bolha (r4)
	dadd	R6,R4,R5		; B[i] + C 
	sd	r6,A(r2)			; A[i] = B[i] + C 
	daddi	R1,R1,1			; incrementa i 
	daddi	R8,R1,-100		; o contador chegou a 100? 

	; 1 bolha (r8)
	bnez	R8,loop			; se não chegou, repete o ciclo 
	
	; 1 bolha de conflito de controlo
	sd	r1,i(R0)			; armazena i 

	halt					; termina a execucao 
