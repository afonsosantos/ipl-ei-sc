; switch var1 to var2 and var2 to var1

.data

    A: .word 10
    B: .word 8

.text

    ld r1, A(r0)
    ld r2, B(r0)

    sd r1, B(r0)
    sd r2, A(r0)

    halt