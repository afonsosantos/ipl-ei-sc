; **********************************
; SC - Ex. 8
; **********************************

.data

    CR:                     .word32             0x10000
    DR:                     .word32             0x10008

    Vetor:                  .word16             3, 15, 100, 7, 0xf5aa, 17, 5, 15, -100, 2023

.text

    lwu r1, CR(r0)
    lwu r2, DR(r0)

    daddi r5, r0, 0 ; counter variable (like i in C)

For:

    slt r3, r5, r0 ; set r3 to 1 if r5 < r10, else set to 0

    beqz r3, FimFor

    ; logic below

    daddi r3, r0, 2

    dmul r8, r5, r3

    lh r4, Vetor(r8)

    sd r4, (r2)

    daddi r3, r0, 2

    sh r3, (r1)

    daddi r5, r5, 1

    j For

FimFor:

    daddi r5, r5, 0

    halt
