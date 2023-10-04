; print ASCII string, comparison, working with numbers

.data

    CR:                 .word32     0x10000
    DR:                 .word32     0x10008

    EqualMessage:       .asciiz     "Igual a 15"
    NotEqualMessage:    .asciiz     "Diferente de 15"

.text

    lwu r1, CR(r0)
    lwu r2, DR(r0)

    ; 8 to get value from user
    daddi r3, r0, 8

    ; get first value from user
    sd r3, (r1)
    ld r5, (r2)

    daddi r6, r0, 15                                    ; store 15 into r6 (to compare below)

    ; compare the values in r5 and r6
    bne r5, r6, neq

    daddi r4, r0, EqualMessage
    daddi r3, r0, 4

    sd r4, (r2)
    sd r3, (r1)

    j end

neq:                                                    ; branch to execute if r5 != r6

    daddi r4, r0, NotEqualMessage
    daddi r3, r0, 4

    sd r4, (r2)
    sd r3, (r1)

end:

    halt