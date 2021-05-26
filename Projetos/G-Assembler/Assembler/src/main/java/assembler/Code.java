/**
 * Curso: Elementos de Sistemas
 * Arquivo: Code.java
 */

package assembler;

/**
 * Traduz mnemônicos da linguagem assembly para códigos binários da arquitetura Z0.
 */
public class Code {

    /**
     * Retorna o código binário do(s) registrador(es) que vão receber o valor da instrução.
     * @param  mnemnonic vetor de mnemônicos "instrução" a ser analisada.
     * @return Opcode (String de 4 bits) com código em linguagem de máquina para a instrução.
     */
    public static String dest(String[] mnemnonic) {
        if (mnemnonic.length == 4 && mnemnonic[0] == "movw"){
            if (mnemnonic[2] == "%A") {
                switch (mnemnonic[3]) {
                    case "%D"   : return "0011";
                    default     : return "0101";
                }
            }
            if (mnemnonic[2] == "%D") {
                switch (mnemnonic[3]) {
                    case "%A"   : return "0011";
                    default     : return "0110";
                }
            }
            if (mnemnonic[2] == "(%A)") {
                switch (mnemnonic[3]) {
                    case "%A"   : return "0101";
                    default     : return "0110";
                }
            }
        }

        if ( mnemnonic.length == 2 || mnemnonic.length == 3 || mnemnonic.length == 4 ){
            switch (mnemnonic[mnemnonic.length-1]) {
                case "%A"   : return "0001";
                case "%D"   : return "0010";
                default     : return "0100";
            }
        }

        if (mnemnonic.length == 5 && mnemnonic[0] == "movw") {
            return "0111";
        }

        if (mnemnonic.length == 5) {
            if (mnemnonic[3] == "%A") {
                switch (mnemnonic[4]) {
                    case "%D"   : return "0011";
                    default     : return "0101";
                }
            }
            if (mnemnonic[3] == "%D") {
                switch (mnemnonic[4]) {
                    case "%A"   : return "0011";
                    default     : return "0110";
                }
            }
            if (mnemnonic[3] == "(%A)") {
                switch (mnemnonic[4]) {
                    case "%A"   : return "0101";
                    default     : return "0110";
                }
            }
        }

        if (mnemnonic.length == 6) {
            return "0111";
        }

        return "0000";
    }

    /**
     * Retorna o código binário do mnemônico para realizar uma operação de cálculo.
     * @param  mnemnonic vetor de mnemônicos "instrução" a ser analisada.
     * @return Opcode (String de 7 bits) com código em linguagem de máquina para a instrução.
     */
    public static String comp(String[] mnemnonic) {
        if (mnemnonic[0] == "movw") {
            switch (mnemnonic[1]) {
                case "%A"   : return "000110000";
                case "%D"   : return "000001100";
                default     : return "001110000";
            }
        }

        if (mnemnonic[0] == "addw") {
            if (mnemnonic[1] == "$1") {
                switch (mnemnonic[2]) {
                    case "%A"   : return "000110111";
                    case "%D"   : return "000011111";
                    default     : return "001110111";
                }
            }
            if (mnemnonic[2] == "%D") {
                switch (mnemnonic[1]) {
                    case "%A"   : return "000000010";
                    default     : return "001000010";
                }
            }
            if (mnemnonic[1] == "%D") {
                switch (mnemnonic[2]) {
                    case "%A"   : return "000000010";
                    default     : return "001000010";
                }
            }
        }

        if (mnemnonic[0] == "subw") {
            if (mnemnonic[2] == "$1") {
                switch (mnemnonic[1]) {
                    case "%A"   : return "000110010";
                    case "%D"   : return "000001110";
                    default     : return "001110010";
                }
            }
            if (mnemnonic[2] == "%D") {
                switch (mnemnonic[1]) {
                    case "%A"   : return "000000111";
                    default     : return "001000111";
                }
            }
            if (mnemnonic[1] == "%D") {
                switch (mnemnonic[2]) {
                    case "%A"   : return "000010011";
                    default     : return "001010011";
                }
            }
        }

        if (mnemnonic[0] == "rsubw") {
            if (mnemnonic[1] == "$1") {
                switch (mnemnonic[2]) {
                    case "%A"   : return "000110010";
                    case "%D"   : return "000001110";
                    default     : return "001110010";
                }
            }
            if (mnemnonic[1] == "%D") {
                switch (mnemnonic[2]) {
                    case "%A"   : return "000000111";
                    default     : return "001000111";
                }
            }
            if (mnemnonic[2] == "%D") {
                switch (mnemnonic[1]) {
                    case "%A"   : return "000010011";
                    default     : return "001010011";
                }
            }
        }

        if (mnemnonic[0] == "incw") {
            switch (mnemnonic[1]) {
                case "%A"   : return "000110111";
                case "%D"   : return "000011111";
                default     : return "001110111";
            }
        }

        if (mnemnonic[0] == "decw") {
            switch (mnemnonic[1]) {
                case "%A"   : return "000110010";
                case "%D"   : return "000001110";
                default     : return "001110010";
            }
        }

        if (mnemnonic[0] == "notw") {
            switch (mnemnonic[1]) {
                case "%A"   : return "000110001";
                case "%D"   : return "000001101";
                default     : return "001110001";
            }
        }

        if (mnemnonic[0] == "negw") {
            switch (mnemnonic[1]) {
                case "%A"   : return "000110011";
                case "%D"   : return "000001111";
                default     : return "001110011";
            }
        }

        if (mnemnonic[0] == "andw") {
            if (mnemnonic[1] == "%A") {
                return "000000000";
            }
            if (mnemnonic[1] == "(%A)") {
                return "001000000";
            }
            if (mnemnonic[1] == "%D") {
                switch (mnemnonic[2]) {
                    case "%A"   : return "000000000";
                    default     : return "001000000";
                }
            }
        }

        if (mnemnonic[0] == "orw") {
            if (mnemnonic[1] == "%A") {
                return "000010101";
            }
            if (mnemnonic[1] == "(%A)") {
                return "001010101";
            }
            if (mnemnonic[1] == "%D") {
                switch (mnemnonic[2]) {
                    case "%A"   : return "000010101";
                    default     : return "001010101";
                }
            }
        }
        return "000001100";
    }

    /**
     * Retorna o código binário do mnemônico para realizar uma operação de jump (salto).
     * @param  mnemnonic vetor de mnemônicos "instrução" a ser analisada.
     * @return Opcode (String de 3 bits) com código em linguagem de máquina para a instrução.
     */
    public static String jump(String[] mnemnonic) {
        switch (mnemnonic[0]) {
            case "jg"   : return "001";
            case "je"   : return "010";
            case "jge"  : return "011";
            case "jl"   : return "100";
            case "jne"  : return "101";
            case "jle"  : return "110";
            case "jmp"  : return "111";
            default     : return "000";
        }
    }

    /**
     * Retorna o código binário de um valor decimal armazenado numa String.
     * @param  symbol valor numérico decimal armazenado em uma String.
     * @return Valor em binário (String de 15 bits) representado com 0s e 1s.
     */
    public static String toBinary(String symbol) {
        int num = Integer.valueOf(symbol);
        String binFinal = "";
        int remainder = 0;

        while (num > 0){
            remainder = num % 2;
            binFinal = remainder + binFinal;
            num = num/2;
        }
        while (binFinal.length() != 16){
            binFinal = '0' + binFinal;
        }
        return binFinal;
    }

}
