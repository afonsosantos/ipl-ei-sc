
; 10-a) Parâmetros de entrada em $a0 e $a1; Saída em $v0

.data

CR:   .word32 0x10000
DR:   .word32 0x10008

.text

main:
	lwu $s1,CR($zero)
	lwu $s2,DR($zero)

; pedir a
	daddi $s3,$zero,8 ; pedir a
	sd $s3,($s1)
	ld $a0,0($s2)

; pedir b	
	sd $s3,($s1)
	ld $a1,0($s2)

	jal Max

; mostrar maior
	sd $v0,($s2)
	daddi $s3,$zero,1
	sd $s3,($s1)
	
	halt  

; Rotina Max
; Parâmetros de entrada: 2 inteiros em $a0 e $a1
; Saída: Maior em $v0

Max:
;Algoritmo
; if $a0 < $a1
;	Maior <- $a1
; else
;	Maior <- $a0
; Output Maior

	slt $t0, $a0, $a1
	bnez $t0, $a1MaiorOuIgual
	
; $a0 >= $a1
	dadd $v0, $a0, $zero	; Maior <- $a0
	j FimMax 

$a1MaiorOuIgual:
	dadd $v0, $a1, $zero	; Maior <- $a1

FimMax:
	jr $ra
