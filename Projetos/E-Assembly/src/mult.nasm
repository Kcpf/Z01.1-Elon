; Arquivo: Abs.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017

; Multiplica o valor de RAM[1] com RAM[0] salvando em RAM[3]

LOOP:
leaw $1, %A     ;   faz %A apontar para RAM[1]
movw (%A), %D   ; carrega o valor de RAM[1] em %D
leaw $FIM, %A   ; precisamos carregar em %A o valor do salto
je %D          ; salta se valor em %D for menor ou igual a zero
nop             ; 

