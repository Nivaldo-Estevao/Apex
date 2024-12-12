public with sharing class ApexCollections {
        
    //<<<<< EXEMPLOS DA UTLIZAÇÃO DE LIST >>>>>
    
    public List<String> listExemples(){
        
        //Declaração da lista diretamente no momento da instanciação
        List<String> fruits = new List<String>{'banana', 'apple', 'orange'};

        /*Declaração de lista vazia
        Listas são ordenadas e aceitam itens duplicados*/
        List<String> anyFruits = new List<String>();

        //método para adicionar itens na lista individualmente
        anyFruits.add('strawberry');
        anyFruits.add('strawberry');
        anyFruits.add('pineapple');

        //método para adicionar um um item em uma posição específica
        anyFruits.add(0, 'watermelon');

        //método para adicionar uma lista dentro da outra
        anyFruits.addAll(fruits);

        //método para retornar o valor de uma posição da lista
        String fruiut = anyFruits.get(0);
        
        //método para retornar o tamanho da lista
        Integer sizeList = anyFruits.size();

        //método para identificar se a lista tem um referido objeto dentro dela
        Boolean isFruit = anyFruits.contains('strawberry');

        //método para fazer uma cópia da lista
        List<String> fruitsCopy = fruits.clone();

        /*método para converter os valores de uma lista em um String única
        Inclusive Lista de valores que não são string*/
        String fruitsToString = fruits.toString();

        //limpa a lista limpando todos os valores
        anyFruits.clear();
    }

    
    //<<<<< Exemplos de utilização de Set >>>>>
    
    public Set<String> setExemps() {
    
        /*Basicamente funciona como uma lista
        A diferença é que não permite itens duplicados e não é ordenado
        Os mesmo métodos citados acima para as listas servem para ele
        vamos acrescentar alguns exclusivo para coleções do tipo set*/

        List<String> vegetables = new List<String> {'cucumber', 'spinach', 'tomato'};

        Set<String> anyVegitories = new Set<String>();

        /*O método add pode agora ser usado também para inserir uma lista em um set 
        e também outro set dentro de um set*/
        vegetables.addAll(anyVegitories);

        //método que retorna true ou false caso o set contenha uma lista ou ouro set dentro dele
        Boolean isVeg = anyVegitories.contains(vegetables);

        //método usado para remover apenas elementos de uma outra lista ou set dentro de um set
        anyVegitories.removeAll(vegetables);

        //método usado para reter somente somente os elementos que não estiverem na lista ou set passado como parâmetro
        anyVegitories.retainAll(vegetables);


    //<<<<< Exemplos de utilização de Map >>>>>


}