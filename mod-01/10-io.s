; get the values from the MIPS terminal

.data

    CR:     .word32     0x10000
    DR:     .word32     0x10008

.text

    lwu r20, CR(r0)
    lwu r21, DR(r0)

    ; ask user for the 1st value
    daddi r10, r0, 8
    sd r10, (r20) ; start waiting for value
    ld r11, (r20)

    ; ask user for the 2nd value
    sd r10, (r20) ; start waiting for value
    ld r12, (r20)

    dadd r1, r11, r12 ; sum the values

    ; ouput to console
    sd r1, (r21)                    ; save r3 in memory address of r21
    daddi r4, r0, 1                 ; assign 1 (unsigned integer) to r4
    sd r4, (r20)                    ; save r4 in memory address of r20

    halt