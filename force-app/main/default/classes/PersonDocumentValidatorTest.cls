@isTest
public class PersonDocumentValidatorTest {
    
    @isTest
    public static void shouldReturnFalseForNullOrEmptyCPF(){

        PersonDocumentValidator validator = new PersonDocumentValidator();

        System.assert(!validator.isCpf(null), 'CPF Nulo NÂO é válido');

        Assert.isFalse(validator.isCPF(null), 'CPF Nulo NÂO é válido');

        System.assert(!validator.isCPF(''), 'CPF vazio NÂO é válido');

        Assert.isFalse(validator.isCPF(''), 'CPF vazio NÂO é válido');

    }

    @isTest
    public static void shouldRemoveMaskChars(){
        PersonDocumentValidator validator = new PersonDocumentValidator();

        String result = validator.removeMaskChars('XXX.XXX-AAA');

        Assert.areEqual('XXXXXXAAA', result);

        result = validator.removeMaskChars('111/ZZZ-XX');

        Assert.areEqual('111/ZZZXX', result);
    }

    @isTest
    public static void shouldReturnFalseForCpfWithText(){

        PersonDocumentValidator validator = new PersonDocumentValidator();

        String cpf = '111.444.777-XX';

        Boolean result = validator.isCPF(cpf);

        Assert.isFalse(result, 'CPF 111.444.777-XX NÃO é válido');

        cpf = '111.444/777-11';

        Assert.isFalse(result, 'CPF 111.444/777-11 NÃO é válido');
    }

    @isTest
    public static void shouldReturnInvalidLengthForCpf (){

        PersonDocumentValidator validator = new PersonDocumentValidator();

        String cpf = '111.444.777-111';

        Boolean result = validator.isCPF(cpf);

        Assert.isFalse(result, 'CPF 111.444.777-111 NÃO é válido');

        cpf = '9111.444.777-11';

        Assert.isFalse(validator.isCPF(cpf), 'CPF 9111.444.777-11 NÃO é válido');

    }

    @isTest
    public static void shouldRejectSameDigits(){

        PersonDocumentValidator validator = new PersonDocumentValidator();

        String cpf = '###.###.###-##';
        
        for (Integer i=0; i <10; i++){

            Boolean result = validator.isCPF(cpf.replaceAll('#', i + ''));

            Assert.isFalse(result, 'CPF é inválido');

        }

    }
}