; **********************************
; compare two values
;
; if equal, show message
; if different, show the greatest
; **********************************

.data

    CR:             .word32     0x10000
    DR:             .word32     0x10008

    EqualMessage:   .asciiz     "Iguais!"
    GreaterMessage: .asciiz     "O maior: "

.text

    lwu r1, CR(r0)
    lwu r2, DR(r0)

    ; 8 to get value from user
    daddi r3, r0, 8

    ; get first value from user
    sd r3, (r1)
    ld r5, (r2)

    ; get second value from user
    sd r3, (r1)
    ld r6, (r2)

    ; compare the values in r5 and r6
    bne r5, r6, different                   ; jumps to tag different if r5 != r6

    daddi r4, r0, EqualMessage              ; variable to show in terminal
    daddi r3, r0, 4                         ; 4 to show string

    sd r4, (r2)
    sd r3, (r1)

    j end

different:                                  ; code to execute is below

    daddi r4, r0, GreaterMessage
    daddi r3, r0, 4

    sd r4, (r2)
    sd r3, (r1)

    ; find which value is the greater

    dadd r7, r0, r5
    slt r3, r5, r6                          ; r3 = 1 if r5 < r6

    beq r3, r0, show

    dadd r7, r0, r6

show:

    daddi r0, r0, 2
    sd r7, (r2)                             ; value for DR
    sd r3, (r1)                             ; value for CR

end:                                        ; jumping to this tag will halt the program

    halt