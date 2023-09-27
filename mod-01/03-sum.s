; sum of 3 variables

.data

    A: .word 10
    B: .word 8
    Z: .word 2
    C: .word 0

.text

    ld r1, A(r0)
    ld r2, B(r0)
    ld r3, Z(r0)

    dadd r6, r1, r2 ; r6 = r1 + r2
    dadd r6, r6, r3 ; r6 = r6 + r3

    daddi r6, r6, 5 ; sum 5 to r6

    sd r6, C(r0) ; store into C

    halt