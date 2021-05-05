; Arquivo: multiploDeDois.nasm
; Curso: Elementos de Sistemas
; Criado por: Rafael Corsi
; Data: 28/3/2019
;
; Verifica se o valor salvo no endereço RAM[5] é
; multiplo de dois, se for verdadeiro, salva 1
; em RAM[0] e 0 caso contrário.

leaw $5, %A
move (%A), %D
leaw $1, %A
andw %A, %D, %D
leaw $IMPAR, %A
jne %D
nop

PAR:
leaw $0, %A
movw $1, (%A)
leaw $FIM, %A
jmp
nop

IMPAR:
leaw $0, %A
movw $0, (%A)

FIM: