.data

	i:		.word	0
	C:		.word	7
	A:		.space	800
	B:		.space	800

.text

	daddi	R1,R0,0			; inicializa i 
	sd	R1, i(R0)			; armazena i 
	
loop:

	ld	R1,i(R0)			; obtém o valor de i 
	daddi	R9,R0,8			; tamanho da dword para multiplicação pelo índice
	dmul	R2,R1,R9		; R2 = offset de i

	ld	R4,B(R2)			; carrega o valor de B[i] 
	ld	R5,C(R0)			; carrega o valor de C 

	dadd	R6,R4,R5		; B[i]+C 

	ld	R1,i(R0)			; obtém o valor de i 
	daddi	R9,R0,8			; tamanho da dword para multiplicação pelo índice
	dmul	R2,R1,R9		; R2 = offset de i
	sd	r6,A(r2)			; A[i] = B[i]+C 

	ld	R1,i(R0)			; obtém o valor de i 
	daddi	R1,R1,1			; incrementa i 
	sd	r1,i(R0)			; armazena i 

	ld	R1,i(R0)			; obtém o valor de i 
	daddi	R8,R1,-100		; o contador chegou a 100? 
	bnez	R8,loop			; se néo chegou, repete o ciclo 

	halt					; termina a execucao 
