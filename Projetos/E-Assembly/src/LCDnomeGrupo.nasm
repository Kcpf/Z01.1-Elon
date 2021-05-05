; Arquivo: LCDnomeGrupo.nasm
; Curso: Elementos de Sistemas
; Criado por: Rafael Corsi
; Data: 28/3/2018
;
; Escreva no LCD o nome do grupo

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

L:

leaw $16804, %A
movw %D, (%A)

leaw $16824, %A
movw %D, (%A)

leaw $16844, %A
movw %D, (%A)

leaw $16864, %A
movw %D, (%A)

leaw $16884, %A
movw %D, (%A)

leaw $16904, %A
movw %D, (%A)

leaw $16924, %A
movw %D, (%A)

leaw $16944, %A
movw %D, (%A)

leaw $16964, %A
movw %D, (%A)

leaw $16984, %A
movw %D, (%A)

leaw $17004, %A
movw %D, (%A)

leaw $17024, %A
movw %D, (%A)

leaw $17044, %A
movw %D, (%A)

leaw $17064, %A
movw %D, (%A)

leaw $17084, %A
movw %D, (%A)

leaw $17104, %A
movw %D, (%A)

leaw $17124, %A
movw %D, (%A)

leaw $17144, %A
movw %D, (%A)

leaw $17164, %A
movw $-1, (%A)

O:
leaw $17244, %A
movw $-1, (%A)

leaw $49155, %A
movw %A, %D

leaw $17264, %A
movw %D, (%A)

leaw $17284, %A
movw %D, (%A)

leaw $17304, %A
movw %D, (%A)

leaw $17324, %A
movw %D, (%A)

leaw $17344, %A
movw %D, (%A)

leaw $17364, %A
movw %D, (%A)

leaw $17384, %A
movw %D, (%A)

leaw $17404, %A
movw %D, (%A)

leaw $17424, %A
movw %D, (%A)

leaw $17444, %A
movw %D, (%A)

leaw $17464, %A
movw %D, (%A)

leaw $17484, %A
movw %D, (%A)

leaw $17504, %A
movw %D, (%A)

leaw $17524, %A
movw %D, (%A)

leaw $17544, %A
movw %D, (%A)

leaw $17564, %A
movw %D, (%A)

leaw $17584, %A
movw $-1, (%A)

N:
leaw $49155, %A
movw %A, %D

leaw $17664, %A
movw %D, (%A)

leaw $49155, %A
movw %A, %D

leaw $17684, %A
movw %D, (%A)

leaw $49155, %A
movw %A, %D

leaw $17704, %A
movw %D, (%A)

leaw $49155, %A
movw %A, %D

leaw $17724, %A
movw %D, (%A)

leaw $57347, %A
movw %A, %D

leaw $17744, %A
movw %D, (%A)

leaw $53251, %A
movw %A, %D

leaw $17764, %A
movw %D, (%A)

leaw $51203, %A
movw %A, %D

leaw $17784, %A
movw %D, (%A)

leaw $50179, %A
movw %A, %D

leaw $17804, %A
movw %D, (%A)

leaw $49667, %A
movw %A, %D

leaw $17824, %A
movw %D, (%A)

leaw $49411, %A
movw %A, %D

leaw $17844, %A
movw %D, (%A)

leaw $49283, %A
movw %A, %D

leaw $17864, %A
movw %D, (%A)

leaw $49219, %A
movw %A, %D

leaw $17884, %A
movw %D, (%A)

leaw $49187, %A
movw %A, %D

leaw $17904, %A
movw %D, (%A)

leaw $49171, %A
movw %A, %D

leaw $17924, %A
movw %D, (%A)

leaw $49163, %A
movw %A, %D

leaw $17944, %A
movw %D, (%A)

leaw $49159, %A
movw %A, %D

leaw $17964, %A
movw %D, (%A)

leaw $49159, %A
movw %A, %D

leaw $17984, %A
movw %D, (%A)

leaw $49155, %A
movw %A, %D

leaw $18004, %A
movw %D, (%A)