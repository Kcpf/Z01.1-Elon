; Arquivo: LCDletraGrupo.nasm
; Curso: Elementos de Sistemas
; Criado por: Rafael Corsi
; Data: 28/3/2018
;
; Escreva no LCD a letra do grupo de vocês
;  - Valide no hardawre
;  - Bata uma foto!

E:
leaw $16384, %A
movw $-1, (%A)

leaw $49152, %A
movw %A, %D

leaw $16404, %A
movw %D, (%A)

leaw $16424, %A
movw %D, (%A)

leaw $16444, %A
movw %D, (%A)

leaw $16464, %A
movw %D, (%A)

leaw $16484, %A
movw %D, (%A)

leaw $16504, %A
movw %D, (%A)

leaw $16524, %A
movw %D, (%A)

leaw $16544, %A
movw %D, (%A)

leaw $16564, %A
movw $-1, (%A)

leaw $16584, %A
movw %D, (%A)

leaw $16604, %A
movw %D, (%A)

leaw $16624, %A
movw %D, (%A)

leaw $16644, %A
movw %D, (%A)

leaw $16664, %A
movw %D, (%A)

leaw $16684, %A
movw %D, (%A)

leaw $16704, %A
movw %D, (%A)

leaw $16724, %A
movw $-1, (%A)
