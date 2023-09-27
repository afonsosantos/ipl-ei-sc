.data

    ABC: .word 7
    OO: .word 9

.text

    ld r1, ABC(r0)
    sd r1, OO(r0)

    halt