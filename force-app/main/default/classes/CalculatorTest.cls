@isTest
public class CalculatorTest {

    @isTest
    static void sumTest(){
        
        Calculator calc = new Calculator();
        Integer result = calc.sum(2, 3);
        System.assertEquals(5,result,'Deu ruim');
    }
    
    @isTest
    static void evenNumberTrueTest(){
        Calculator calc = new Calculator();
        System.assert(calc.evenNumber(2)
                     , 'Número é impar');
    }
    
    @isTest
    static void evenNumberFalseTest(){
        Calculator calc = new Calculator();
        Assert.isFalse(calc.evenNumber(3)
                     , 'Número é par');
    }
    
    @isTest
    static void oddNumberTrueTest(){
        Calculator calc = new Calculator();
        System.equals(calc.oddNumber(3)
                     , 'Número é par');
    }
    
    @isTest
    static void oddNumberFalseTest(){
        Calculator calc = new Calculator();
        Assert.isFalse(calc.oddNumber(2)
                     , 'Número é ímpar');
    }
    
    @isTest
    static void haveSquareRootTrueTest(){
        Calculator calc = new Calculator();
        Assert.isTrue(calc.haveSquareRoot(4)
                     , 'Não tem raiz quadrada');
    }
    
    @isTest
    static void haveSquareRootFalseTest(){
        Calculator calc = new Calculator();
        Assert.isFalse(calc.haveSquareRoot(5)
                       , 'Tem raiz quadrada');
    }
    
    @isTest
    static void haveSquareRootZeroTest(){
        Calculator calc = new Calculator();
        System.assertNotEquals(calc.haveSquareRoot(-1), true
                              , 'Tem raiz quadrada');                    
    }
}