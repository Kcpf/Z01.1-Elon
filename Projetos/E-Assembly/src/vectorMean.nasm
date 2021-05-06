; ------------------------------------
; Calcule a média dos valores de um vetor
; que possui inicio em RAM[5] e tamanho
; defindo em RAM[4],
;
; 1. Salve a soma em RAM[1]
; 2. Salve a média em RAM[0]
; 
; ------------------------------------
; antes       | depois
;             |
; RAM[0]:     | RAM[0]:  2  : média 
; RAM[1]:     | RAM[1]:  8  : soma
; RAM[2]:     | RAM[2]:  
; RAM[3]:     | RAM[3]:  
; RAM[4]:  4  | RAM[4]:  4 
; RAM[5]:  1  | RAM[5]:  1 - 
; RAM[6]:  2  | RAM[6]:  2 | vetor
; RAM[7]:  1  | RAM[7]:  1 |
; RAM[8]:  4  | RAM[8]:  4 -
; ------------------------------------


leaw $4, %A   ; Carrega o tamanhao do vetor no registrador A
movw (%A), %D ; Move para o registrador D
leaw $0, %A   ; Carrega o local da RAM da média no registrador A
movw %D, (%A)

leaw $1, %A
movw $0, (%A)



ADD:
leaw $0, %A
movw (%A), %D
leaw $FINALE, %A
jle
nop



leaw $0, %A
movw (%A), %D
decw %D
movw %D, (%A)
leaw $5, %A
addw %A, %D, %A
movw (%A), %D

leaw $1, %A
addw (%A), %D, %D
movw %D, (%A)

leaw $ADD, %A
jmp
nop


FINALE:
leaw $1, %A
movw (%A), %D
leaw $2, %A
movw %D, (%A)


div: 
leaw $R0, %A
movw $0, (%A)


loop:
leaw $R2, %A
movw (%A), %D ; valor R[0]


leaw $R4, %A
subw %D, (%A), %D ; R0 - R1
leaw $R2, %A
movw %D, (%A)

leaw $END, %A
jl %D
nop

leaw $R0, %A
movw (%A), %D
incw %D
movw %D, (%A)

leaw $loop, %A
jmp
nop

END: