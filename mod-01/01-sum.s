.data ; variable declaration

    A: .word 10 ; word holds 64 bits
    B: .word 8
    C: .word 0

.text ; code declaration

    ld r1, A(r0) ; load the value of A into r1
    ld r2, B(r0)
    ld r3, C(r0)

    dadd r3, r2, r1 ; r3 = r4 + r5

    sd r3, C(r0) ; store r3 into C 

    halt ; stop execution