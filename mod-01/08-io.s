; output values to the MIPS terminal

.data

    CR:     .word32     0x10000
    DR:     .word32     0x10008

    A:      .word       10
    B:      .word       8
    C:      .word       0

.text

    lwu r20, CR(r0)
    lwu r21, DR(r0)

    ld r1, A(r0)
    ld r2, B(r0)
    ld r3, C(r0)

    dadd r3, r2, r1

    ; ouput to console
    sd r3, (r21)                    ; save r3 in memory address of r21
    daddi r4, r0, 1                 ; assign 1 (unsigned integer) to r4
    sd r4, (r20)                    ; save r4 in memory address of r20

    sd r3, C(r0)

    halt