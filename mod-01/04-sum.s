.data

    ABC: .word 3
    D: .word 4
    E: .word 5
    Z: .word 0                      ; result

.text

    ld r1, ABC(r0)
    ld r2, D(r0)
    ld r3, E(r0)
    # ld r10, Z(r0)

    dadd r10, r1, r2                ; r10 = r1 + r2
    dadd r10, r10, r3               ; r10 = r10 + r3

    daddi r10, r10, 3               ; r10 = r10 + 3

    sd r10, Z(r0)                   ; store r10 in Z

    halt