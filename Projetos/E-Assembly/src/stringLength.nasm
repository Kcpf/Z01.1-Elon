; Arquivo: stringLength.nasm
; Curso: Elementos de Sistemas
; Criado por: Rafael Corsi 
; Data: 28/03/2018
;
; Assuma que uma string é um conjunto de caracteres terminado
; em NULL (0).
; 
; Supondo que temos uma string que começa no endereço 8 da RAM.
; Calcule o seu tamanho e salve o resultado na RAM[0].
;
; Os caracteres estão formatados em ASCII
; http://sticksandstones.kstrom.com/appen.html
; 
; Exemplo:
;
;   Convertido para ASCII
;             |
;             v
;  RAM[8]  = `o`
;  RAM[9]  = `i`
;  RAM[10] = ` `
;  RAM[11] = `b`
;  RAM[12] =  l`
;  RAM[13] = `z`
;  RAM[14] = `?`
;  RAM[15] = NULL = 0x0000

leaw $8, %A     ; verifica se inicia com null
movw (%A), %D   ; carrega o valor de RAM[1] em %D
leaw $FIM, %A   ; precisamos carregar em %A o valor do salto
je %D           ; salta se valor em %D for menor ou igual a zero
nop

leaw $0, %A     ; incrementa RAM[0]
addw $1, (%A), %D 
movw %D, (%A) 

leaw $8, %A     ; salva endereco do comeco da string na RAM[1]
movw %A, %D
leaw $1, %A
movw %D, (%A)

LOOP:           ; caso caractere incial nao for nulo, prossegue para loop principal  
leaw $1, %A
movw (%A), %D
incw %D
movw %D, (%A)

leaw $0, %A     ; incremente RAM[0]
addw $1, (%A), %D 
movw %D, (%A) 

leaw $1, %A
movw (%A), %A   ; carrega o valor de RAM[1] em %D
movw (%A), %D
leaw $FIM, %A  
je %D           ; salta se valor em %D for menor ou igual a zero
nop

leaw $LOOP, %A    ; Jump para o inicio do loop principal
jmp
nop


FIM:


