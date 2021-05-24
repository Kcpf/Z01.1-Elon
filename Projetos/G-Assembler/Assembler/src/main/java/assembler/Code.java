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
        String command = mnemnonic[0];
        String firstDest = null;
        String seconDest = null;
        String thirdDest  = null;
        String fourtDest = null;

        if (mnemnonic.length == 2){
            firstDest = mnemnonic[1];
        }
        if (mnemnonic.length == 3){
            seconDest = mnemnonic[2];
        }
        if (mnemnonic.length == 4){
            thirdDest = mnemnonic[3];
        }
        if (mnemnonic.length == 5){
            fourtDest = mnemnonic[4];
        }

        if(command == "movw" || command == "orw" || command == "andw" || command == "subw" || command == "rsubw" || command == "add"){
            if (fourtDest != null) {
                return "0111";
            }

            if (thirdDest == "%D"){
                return "0110";
            } if (thirdDest == "%A"){
                if (seconDest == "%D"){
                    return  "0011";
                }
                if (seconDest == "(%A)"){
                    return  "0101";
                }
            }
            switch (seconDest){
                case "(%A)": return "0100";
                case "%D": return "0010";
                case "%A": return "0001";
                default: return "0000";
            }
        }
        if (command == "negw" || command == "incw" || command == "decw"){
            switch (firstDest){
                case "(%A)": return "0100";
                case "%D": return "0010";
                case "%A": return "0001";
                default: return "0000";
            }
        }
        return "0000";
    }

    /**
     * Retorna o código binário do mnemônico para realizar uma operação de cálculo.
     * @param  mnemnonic vetor de mnemônicos "instrução" a ser analisada.
     * @return Opcode (String de 7 bits) com código em linguagem de máquina para a instrução.
     */
    public static String comp(String[] mnemnonic) {
        /* TODO: implementar */
        return "";
    }

    /**
     * Retorna o código binário do mnemônico para realizar uma operação de jump (salto).
     * @param  mnemnonic vetor de mnemônicos "instrução" a ser analisada.
     * @return Opcode (String de 3 bits) com código em linguagem de máquina para a instrução.
     */
    public static String jump(String[] mnemnonic) {
        switch (mnemnonic[0]){
            case "jmp" : return "111";
            case "jle" : return "110";
            case "jne" : return "101";
            case "jl"  : return "100";
            case "jge" : return "011";
            case "je"  : return "010";
            case "jg"  : return "001";
            default    : return "000";
        }
    }

    /**
     * Retorna o código binário de um valor decimal armazenado numa String.
     * @param  symbol valor numérico decimal armazenado em uma String.
     * @return Valor em binário (String de 15 bits) representado com 0s e 1s.
     */
    public static String toBinary(String symbol) {
        /* code based on javatpoint.com
        * */
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
