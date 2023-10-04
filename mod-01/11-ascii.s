; print ASCII string

.data

    CR:             .word32     0x10000
    DR:             .word32     0x10008

    mensagem:       .asciiz     "Hello, World!"

.text

    lwu r1, CR(r0)
    lwu r2, DR(r0)

    daddi r3, r0, 4             ; 4 to show string
    daddi r4, r0, mensagem      ; variable to show in terminal

    sd r4, (r2)
    sd r3, (r1)

    halt