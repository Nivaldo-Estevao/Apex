public class AccessModifiersTraining {
    
    //<<<<<< MODIFICADORES DE ACESSO EM VARIÁVEIS>>>>>
    
    /*é possível acessá-lo por outra classe diretamente se criarmos uma instância dessa classe*/
    public String firstName =   'João';

    /*só pode ser acessada dentro dessa classe, por uma classe que exntenda essa classe ou dentro do mesmo namespace 
    Ao tentar acessá-la ocorre o erro: 
    Variable is not visible:: AccessModifiersTraining.cpf*/
    protected String cpf = '123.456.789-00'; 
    
    /*só pode ser acessada dentro dessa classe. Ao tentar acessá-la ocorre o erro: 
    Variable is not visible:: AccessModifiersTraining.lastName*/
    private String lastName =   'José';    
    
    //Ao não declarar o modificador de acesso ele assume que é private
    String alias = 'jj';  
}