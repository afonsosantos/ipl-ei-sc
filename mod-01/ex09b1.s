; **********************************
; SC - Ex. 9 - b) - 1)
; **********************************

.data

    CR:                     .word32             0x10000
    DR:                     .word32             0x10008

    String:                 .asciiz             "SC EI IPLeiria"

.text

    lwu r1, CR(r0)                              ; control
    lwu r2, DR(r0)                              ; data

    

    halt
