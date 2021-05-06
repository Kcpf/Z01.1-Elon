; ------------------------------------------------------------
; Arquivo: Mod.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017
;
; Calcula o resto da divisão (modulus) entre RAM[0] por RAM[1]
; e armazena o resultado na RAM[2].
;
; 4  % 3 = 1
; 10 % 7 = 3
; ------------------------------------------------------------

; Decrementa o valor de R1
 
INICIO:
leaw $R0, %A
movw (%A), %D
leaw $R1, %A

subw %D, (%A), %A
movw %A, %D

; Checa se sai do loop
leaw $END2, %A
jle %D
nop

MODULO: 

; Salva estado anterior em R3
leaw $R3, %A
movw %D, (%A)

leaw $R1, %A
subw %D, (%A), %A
movw %A, %D

; Checa se sai do loop
leaw $END1, %A
jl %D
nop

; Checa se sai do loop
leaw $END2, %A
je %D
nop

; Repete o loop
leaw $MODULO, %A
jmp
nop

END1:
; Recebe o modulo
leaw $R3, %A
movw (%A), %D
leaw $R2, %A
movw %D, (%A)
; Vai pro fim
leaw $END, %A
jmp
nop

END2:
leaw $R10, %A
movw (%A), %D
leaw $R2, %A
movw %D, (%A)

END:
