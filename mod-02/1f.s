.data

	i:		.word	0
	C:		.word	7
	A:		.space	800
	B:		.space	800

.text

	daddi	R1,R0,0			; inicializa i a 8
	ld	R5,C(R0)			; carrega o valor de C
	
loop:

	ld	R10,B(R2)			; carrega o valor de B[i]
	ld	R11,B+8(R2)			; carrega o valor de B[i]+8
	ld	R12,B+16(R2)		; carrega o valor de B[i]+16
	ld	R13,B+24(R2)		; carrega o valor de B[i]+24

	daddi	R8,R1,-768		; o contador chegou a 800?

	dadd	R20,R10,R5		; B[i] + C
	dadd	R21,R11,R5		; B[i+1] + C
	dadd	R22,R12,R5		; B[i+2] + C
	dadd	R23,R13,R5		; B[i+3] + C
	
	sd	R20,A(r1)			; A[i] = B[i] + i
	sd	R21,A+8(r1)			; A[i+1] = B[i+1] + i
	sd	R22,A+16(r1)		; A[i+2] = B[i+2] + i
	sd	R23,A+24(r1)		; A[i+3] = B[i+3] + i

	daddi	R1,R1,32		; incrementa i em (8 x 4 =) 32
	bnez	R8,loop			; se não chegou, repete o ciclo

	dsra r1,r1,8			; divide valor por 8 para obter 100
	sd	r1,i(R0)			; armazena i

	halt					; termina a execucao
