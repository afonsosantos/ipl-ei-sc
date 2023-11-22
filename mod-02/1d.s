.data

	i:		.word	0
	C:		.word	7
	A:		.space	800
	B:		.space	800

.text

	daddi	R1,R0,8			; inicializa i a 8
	ld	R5,C(R0)			; carrega o valor de C
	
loop:

	dsll r2, r1, 3
	ld	R4,B(R2)			; carrega o valor de B[i]
	
	; 1 bolha (r4)
	dadd	R6,R4,R5		; B[i] + C 
	sd	r6,A(r2)			; A[i] = B[i] + C 
	daddi	R1,R1,8			; incrementa i em 8
	daddi	R8,R1,-800		; o contador chegou a 800? 

	; 1 bolha (r8)
	bnez	R8,loop			; se não chegou, repete o ciclo 
	
	; 1 bolha de conflito de controlo
	sd	r1,i(R0)			; armazena i 

	halt					; termina a execucao 
