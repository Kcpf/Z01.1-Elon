; Arquivo: SWeLED2.nasm
; Curso: Elementos de Sistemas
; Criado por: Rafael Corsi
;
; Faça os LEDs exibirem 
; LED = SW[8] !SW[7] OFF ON ON RAM[5][3] ON SW[0] OFF
;
;                                ^            ^
;    
;                            | TRUQUE!    | TRUQUE!

; Zera LED  
leaw $0, %A
movw %A, %D
leaw $21184, %A
movw %D, (%A)

; LED's ON e OFF
leaw $21184, %A
movw (%A), %D
leaw $52, %A
addw %A, %D, %D
leaw $21184, %A
movw %D, (%A)

; SW[8] -> LED[8]
leaw $21185, %A
movw (%A), %D
leaw $256, %A
andw %A, %D, %D
leaw $21184, %A
movw (%A),%A
addw %A, %D, %D
leaw $21184, %A
movw %D, (%A)

; !SW[7] -> LED[7]
leaw $21185, %A
movw (%A), %D
notw %D
leaw $128, %A
andw %A, %D, %D
leaw $21184, %A
movw (%A),%A
addw %A, %D, %D
leaw $21184, %A
movw %D, (%A)

; SW[0] -> LED[1]
leaw $21185, %A
movw (%A), %D
leaw $1, %A
andw %A, %D, %D
incw %D
leaw $2, %A
andw %A, %D, %D
leaw $21184, %A
movw (%A),%A
addw %A, %D, %D
leaw $21184, %A
movw %D, (%A)

; RAM5(3) -> LED[3]
leaw $5, %A
movw (%A), %D
leaw $8, %A
andw %A, %D, %D
leaw $21184, %A
movw (%A), %A
addw %A, %D, %D
leaw $21184, %A
movw %D, (%A)



;s8 s!7 0 1 1 5(3) 1 s0 0