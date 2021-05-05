; Arquivo: Abs.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017

; Multiplica o valor de RAM[1] com RAM[0] salvando em RAM[3]

LOOP:
leaw $1, %A     ;   faz %A apontar para RAM[1]
movw (%A), %D   ; carrega o valor de RAM[1] em %D
leaw $FIM, %A   ; precisamos carregar em %A o valor do salto
je %D           ; salta se valor em %D for menor ou igual a zero
nop             ; 

leaw $3, %A
movw (%A), %D 
leaw $0, %A
addw (%A), %D, %D  ; faz RAM[3] + RAM[0] e salva em %D
leaw $3, %A
movw %D, (%A)
leaw $1, %A

leaw $1,%A         ; decrementa RAM[1]
movw (%A), %D
decw %D
movw %D, (%A)


leaw $LOOP, %A    ; Aqui, $LOOP seria substituido por 0 pelo montador
jmp
nop

FIM:


; falta subtrair da ram(1) e corrigir %D