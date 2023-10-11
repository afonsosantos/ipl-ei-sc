; **********************************
; Guess game for 2 players.
; **********************************

.data

    CR:                     .word32             0x10000
    DR:                     .word32             0x10008

    MensPedeSegredo:        .asciiz             "Jogador 1, introduza o numero secreto: "
    MensJogador2:           .asciiz             "Jogador 2, tente adivinhar o numero:\n"
    MensParabens:           .asciiz             "Parabens, acertou!\n"
    MensTentativa:          .asciiz             "Tentiva #"
    MensSegredoMenor:       .asciiz             "O segredo e menor\n"
    MensSegredoMaior:       .asciiz             "O segredo e maior\n"
    MudaLinha:              .asciiz             "\n"

.text

    lwu r1, CR(r0)
    lwu r2, DR(r0)

    ; 1. Pedir segredo ao jogador 1

        daddi r11, r0, MensPedeSegredo
        sd r11, (r2)
        
        daddi r10, r0, 4
        sd r10, (r1)

    ; 2. Ler o segredo do jogador 1

        daddi r10, r0, 8
        sd r10, (r1)

        ld r4, (r2) ;  guarda o valor inserido no r4

    ; 3. Limpar o ecrã

        daddi r10, r0, 6
        sd r10, (r1)

    ; 6. Pedir ao jogador 2 a tentativa

        daddi r11, r0, MensJogador2
        sd r11, (r2)
        
        daddi r10, r0, 4
        sd r10, (r1)

    ; 7. Repetir enquanto não acerta

Repetir:

    ; 7.1. Número de tentativas

        daddi r3, r3, 1

    ; 7.2. Mostrar número da tentativa

        daddi r11, r0, MensTentativa
        sd r11, (r2)
        
        daddi r10, r0, 4
        sd r10, (r1)

        daddi r10, r0, 2 ; mostra número de tentativa (valor inteiro, integer)
        sd r3, (r2)
        sd r10, (r1)

    ; 7.3. Ler a tentativa do jogador 2

        daddi r10, r0, 8
        sd r10, (r1)

        ld r5, (r2) ;  guarda o valor inserido no r5

    ; 7.4. Ver se acertou

        bne r4, r5, Diferentes

    ; 7.4.1. Mostrar mensagem de parabéns

        daddi r11, r0, MudaLinha
        sd r11, (r2)

        daddi r10, r0, 4
        sd r10, (r1)

        daddi r11, r0, MensParabens
        sd r11, (r2)
        sd r10, (r1)

    ; 7.4.2. Acertou, logo r6 = 1

        daddi r6, r0, 1
        j Continua

    ; 7.5. Jogador não acertou

Diferentes:

    ; se r5 < r4 -> r7 = 1 | r5 >= r4 -> r7 = 0
    slt r7, r5, r4

    beqz r7, SegredoMenor ; se r7 = 0, salta para a etiqueta SegredoMenor

    ; Mostrar o segredo é maior

    daddi r11, r0, MensSegredoMaior
    sd r11, (r2)

    daddi r10, r0, 4
    sd r10, (r1)

    j Continua

    ; Mostrar o segredo é menor

SegredoMenor:

    daddi r11, r0, MensSegredoMenor
    sd r11, (r2)

    daddi r10, r0, 4
    sd r10, (r1)

    ; 8. Enquanto r6 = 0, salta para a etiqueta Repetir

Continua:

    beqz r6, Repetir ; se r6 = 0, salta para a etiqueta Repetir

    halt