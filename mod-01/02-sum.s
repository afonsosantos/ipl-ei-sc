.data

    AB: .word 12
    BC: .word 1
    D: .word 0

.text

    ld r1, AB(r0)
    ld r2, BC(r0)
    ld r3, D(r0)

    dadd r3, r2, r1

    sd r3, D(r0)

    halt