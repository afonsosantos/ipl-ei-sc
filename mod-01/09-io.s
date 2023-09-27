; output values to the MIPS terminal

.data

    CR:     .word32     0x10000
    DR:     .word32     0x10008

    A:      .word       -4

.text

    lwu r1, CR(r0)                  ; output registries
    lwu r2, DR(r0)

    ld r3, A(r0)                    ; load A (-4) into r3

                                    ; ouput to console
    sd r3, (r2)
    daddi r4, r0, 2                 ; 2 is signed integer
    sd r4, (r1)                     ; store r4 into CR

    halt