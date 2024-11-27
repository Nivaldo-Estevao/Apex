public class Calculator {   
    
    public integer sum (Integer value1, Integer value2){
        
        return (value1 + value2);   
        
    }
    
    public boolean evenNumber(Integer value1){ 
        
        if(Math.mod(value1,2)==0){
            return true;
        }
        
        return false;
        
    }
    
    public boolean oddNumber(Integer value1){
        
        if(Math.mod(value1,2)!=0){
            return true;
        }
        
        return false;
    }
    
    public boolean haveSquareRoot(Integer value1){
        
        if (value1 < 0) {
            return false; // Números negativos não têm raiz quadrada real
        }
        
        Double raiz = Math.sqrt(value1);
        return (raiz * raiz == value1); // Verifica se o quadrado da raiz é igual ao número original
        
    }    
}