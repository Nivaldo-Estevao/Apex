public with sharing class ApexCollections {
        
    //<<<<< EXEMPLOS DA UTLIZAÇÃO DE LIST >>>>>
    
    public void listExamples(){
        
       //Construtores da classe list
       
        /*Declaração de instância de lista vazia
        Listas são ordenadas e aceitam itens duplicados*/
        List<String> anyFruits = new List<String>();

        //Declaração de itens de uma lista diretamente no momento da instanciação
        List<String> fruits = new List<String>{'banana', 'apple', 'orange'};

        // Declaração de lista que recebendo set ou outra lista no momento da instanciação
        Set<String> fruitSet = new Set<String>{'pear', 'grape'};
        List<String> fuitList = new List<String>(fruitSet);
        


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

    
    //<<<<< EXEMPLOS DE UTILIZAÇÃO DO SET >>>>>
    
    public void setExamples() {
    
        /*Basicamente funciona como uma lista
        A diferença é que não permite itens duplicados e não é ordenado
        Os mesmos construtores e métodos citados acima para as listas servem para ele
        vamos acrescentar alguns exclusivo para coleções do tipo set*/

        List<String> vegetables = new List<String> {'cucumber', 'spinach', 'tomato'};

        Set<String> anyVegitories = new Set<String>();

        /*O método add pode agora ser usado também para inserir uma lista em um set 
        e também outro set dentro de um set*/
        vegetables.addAll(anyVegitories);

        //método que retorna true ou false caso o set contenha um outro set ou uma lista dentro dele
        Boolean isVeg = anyVegitories.containsAll(vegetables);

        //método usado para remover apenas elementos de uma outra lista ou set dentro de um set
        anyVegitories.removeAll(vegetables);

        //método usado para reter somente somente os elementos que não estiverem na lista ou set passado como parâmetro
        anyVegitories.retainAll(vegetables);
    }

    //<<<<< EXEMPLOS DA UTLIZAÇÃO DE MAP >>>>>
    
    public void mapExamples() {
        
        /*Map é como se fosse um vetor de duas colunas, chave e valor,
        não permite chaves duplicas, mas permite valores duplicados e não é ordenado
        */
        
        //Construtores da classe map

        //Criando uma instancia de um map vazio
        Map<Integer, String> foods = new Map<Integer, String>();

        //Declaração de itens de um map diretamente no momento da instanciação
        //É utilizado "chave" => "valor" e outras chaves e valores separados por vírgula
        Map<Integer, String> foodsMap = new Map<Integer, String>{
            1 => 'Hamburguer', 
            2 => 'Pizza',
            3 => 'Fries'
        };

        //Declaração de map através de um SELECT em um SObject
        //O Id do SObject é transformado na chave e ele mesmo é o valor
        //O id é tanto convertido na chave como também será um campo no valor
        Map<Id, Account> foodsSearch = new Map<Id, Food__c>(
            [SELECT Id, Name 
            FROM Account]
        );    

        //Método para inserir chave/valor dentro
        foods.add(0,'meat');
        foods.add(1,'milk');

        //Método que retorna um set com todas as chaves
        Set<Integer> keys = foods.keySet();
    }
    
}