; Arquivo: Pow.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017

; Eleva ao quadrado o valor da RAM[1] e armazena o resultado na RAM[0].
; Só funciona com números positivos

leaw $1, %A
movw (%A), %D   ; copiando RAM[1] para RAM[2]
leaw $2, %a
movw %D, (%A)

LOOP:
leaw $1, %A     ;   faz %A apontar para RAM[1]
movw (%A), %D   ; carrega o valor de RAM[1] em %D
leaw $FIM, %A   ; precisamos carregar em %A o valor do salto
je %D           ; salta se valor em %D for menor ou igual a zero
nop             ; 

leaw $2, %A
movw (%A), %D
leaw $0, %A
addw (%A), %D, %D  ; faz RAM[3] + RAM[0] e salva em %D
leaw $0, %A
movw %D, (%A)

leaw $1,%A         ; decrementa RAM[1]
movw (%A), %D
decw %D
movw %D, (%A)


leaw $LOOP, %A    
jmp
nop

FIM:

