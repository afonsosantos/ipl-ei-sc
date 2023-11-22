.data

	i:		.word	0
	C:		.word	7
	A:		.space	800
	B:		.space	800

.text

	daddi	R1,R0,0			; inicializa i a 8
	ld	R5,C(R0)			; carrega o valor de C
	
loop:

	ld	R4,B(R2)			; carrega o valor de B[i]
	daddi	R8,R1,-792		; o contador chegou a 800? 
	dadd	R6,R4,R5		; B[i] + C 
	sd	r6,A(r1)			; A[i] = B[i] + i 
	daddi	R1,R1,8			; incrementa i em 8

	; 1 bolha de conflito de controlo
	bnez	R8,loop			; se não chegou, repete o ciclo 

	dsra r1,r1,8			; divide valor por 8 para obter 100	
	sd	r1,i(R0)			; armazena i 

	halt					; termina a execucao 
