; switch var1 to var2 and var2 to var1
; using registry and sums with r0 (which is always 0)

.data

    A: .word 10
    B: .word 8

.text

    ld r1, A(r0)
    ld r2, B(r0)

    dadd r3, r1, r0                 ; r3 = r1 + 0
    dadd r1, r2, r0                 ; r1 = r2 + 0
    dadd r2, r3, r0                 ; r2 = r3 + 0

    sd r1, A(r0)
    sd r2, B(r0)

    halt