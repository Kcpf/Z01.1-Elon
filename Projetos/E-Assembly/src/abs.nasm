INICIO:
leaw $R1, %A
movw (%A), %D
leaw $END, %A
jg %D
nop
negw %D
END:
leaw $R0, %A
movw %D, (%A)












































































































































































































































