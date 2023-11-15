; ex. 10 - d

.data

CR:   .word32 0x10000
DR:   .word32 0x10008

.text

main:

	lwu $s1,CR($zero)
	lwu $s2,DR($zero)

; guardar espaço na pilha

	daddi $sp, $zero, 0x200

; pedir a

	daddi $s3,$zero,8
	sd $s3,($s1)
	ld $s4, 0($s2)

; pedir b	

	sd $s3,($s1)
	ld $s5, 0($s2)

; pilha

	daddi $sp, $sp, -16 ; 2 elementos

	sd $s4, 0($sp)
	sd $s5, 8($sp)

; chama a rotina Max

	jal Max

; mostrar maior

	sd $v0,($s2)
	daddi $s3,$zero,1
	sd $s3,($s1)
	
	halt

; definição da rotina Max

Max:

	; inicialização do frame pointer

	daddi $fp, $sp, 0
	daddi $sp, $sp, 8

	; obtém os elementos da pilha

	ld $t1, 0($fp)
	ld $t2, 8($fp)

	daddi $t3, $0, 6
	sd $t3, -8($fp)

	daddi $t3, $t3, 1
	sd $t3, -8($fp)

	slt $t0, $t1, $t2

	bnez $t0, $a1MaiorOuIgual
	
	dadd $v0, $t1, $zero

	j FimMax

$a1MaiorOuIgual:

	dadd $v0, $t2, $zero

FimMax:

	daddi $sp, $sp, 8

	jr $ra
