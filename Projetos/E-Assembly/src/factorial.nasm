; Arquivo: Factorial.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017

; Calcula o fatorial do número em R0 e armazena o valor em R1.

leaw $0, %A
movw (%A), %D
leaw $FATORIAL0, %A
je
nop

INICIO:
    leaw $0, %A
    movw (%A), %D
    leaw $x, %A
    movw %D, (%A)
    leaw $f, %A
    movw %D, (%A)
    leaw $j, %A
    movw %D, (%A)

LOOP:
    leaw $j, %A
    movw (%A), %D
    leaw $FINAL, %A
    jle
    nop
    leaw $MULT, %A
    movw $0, (%A)
    leaw $f, %A
    movw (%A), %D
    leaw $1, %A
    movw %D, (%A)
    leaw $j, %A
    movw (%A) , %D
    decw %D
    leaw $b, %A
    movw %D, (%A)
    leaw $i, %A
    movw $0, (%A)

LOOP2:
    leaw $i, %A
    movw (%A), %D
    leaw $b, %A
    subw %D, (%A) , %D
    leaw $LOOPFINAL, %A
    jge
    nop
    leaw $1, %A
    movw (%A), %D
    leaw $MULT, %A
    addw (%A), %D, %D  
    movw %D, (%A)
    leaw $i, %A
    movw (%A), %D
    incw %D
    movw %D, (%A)
    leaw $LOOP2, %A
    jmp
    nop

LOOPFINAL:
    leaw $MULT, %A
    movw (%A), %D
    leaw $f, %A
    movw %D, (%A)
    leaw $j, %A
    movw (%A), %D
    decw %D
    movw %D, (%A)
    leaw $LOOP, %A
    jmp
    nop

FATORIAL0:
    leaw %1, %A
    movw $1, (%A)

FINAL: