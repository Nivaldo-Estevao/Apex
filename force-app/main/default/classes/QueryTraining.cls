public with sharing class QueryTraining {
    
    //<<<<< USO DAS DIVERSAS CLÁSULAS >>>>>

    //Exemplo de query ordenada por um campo colocando os camps null por último
    //Se quiser que os nulls apareçam primeiro basta colocar NULLS FIRST
    List<Account>  accountsNullsLast = [SELECT Id, Name FROM Account ORDER BY Name NULLS LAST];

    //Exemplo de query que pula os primeiros 3 registros da consulta (OFFSET)
    List<Contact> contactsJumpThree = [SELECT Id, Name FROM Contact LIMIT 5 OFFSET 3];
    
    //Exemplo de query com o uso de IN com lista de valores, 
    //Pode ser um ou vários valores
    List<Account> accountsIn = [
        SELECT Id, Name 
        FROM Account 
        WHERE Name IN ('GenePoint', 'University of Arizona')
    ];

    //Exemplo de query com o uso do LIKE e caractere coringa
    //Pode ser um valor apenas mas isso pode ser modificado colocando AND ou OR
    //Também aceita o wildcard '%' no ínico e/ou fim do wildcard 
    List<Contact> contactsLike = [
        SELECT Id, Name 
        FROM Contact 
        WHERE Name LIKE '%Rose%'
    ];

    //Exemplo de query agrupada por grupo
    //A função agregada é usada para identificar quantos registros existem, por isso o campo ID
    //AggregateReslt é o objeto utilizado para receber o resultado do GROUP BY
    List<AggregateResult> accountsGroupedByIndustry = [
        SELECT Industry, COUNT(Id) Quantity 
        FROM Account 
        GROUP BY Industry
    ];

    
    //Exemplo de query que permite o rastreio de campos visualizados para auditoria
    //Os registros visualizados na query atualizam o campo LastViewUpdate 
    //com o DateTime do momento da transação 
    List<Account> accountsTrack = [
        SELECT Name, CreatedDate 
        FROM Account
        FOR VIEW
    ];

    //Exemplo de query que bloqueia os registros no momento da transação
    List<Lead> leadsBlock = [
        SELECT Id, Name
        FROM Lead
        FOR UPDATE
    ];
    
    //Exemplo de query que força a consulta a respeitar todas as configurações de segurança,
    //mesmo que a classe seja without sharing
    List<Lead> leadsForce = [
        SELECT Id, Name
        FROM Lead
        WITH SECURITY_ENFORCED
    ];


    //<<<<< CONSULTAS AGREGADAS >>>>>

    //Função COUNT() sem parâmetros retorna o número de registro da consulta
    Integer accountsGrouped = [SELECT COUNT() FROM Account];

    //Função COUNT(nomeCampo) retorna a quantidade de registros com o campo não nulo
    List<AggregateResult> accountsGroupedNoNull = [SELECT COUNT(Name) FROM Account];

    //Função COUNT(nomeCampo) pode ser usada com outras funções e GROUP BY
    //O nome que aparece após o 'COUNT(NomeCampo) nomeColuna' será o nome da coluna com o resultado
    //Função SUM(nomeCampo) serve para somar os valores junto com a cláusula GROUP BY
    List<AggregateResult> countsByInstrudy = [SELECT Industry, COUNT(Id) TotalAccounts, SUM(AnnualRevenue) TotalRevenue
        FROM Account
        GROUP BY Industry
    ];

    //Função AVG(nomeCampo) retorna a média dos valores do campo especificado
    //Se fosse usada sem o COUNT() retornaria a média geral desse camp na org
    //Nesse caso ele retorna a média por grupo
    List<AggregateResult> averageRevenue = [
        SELECT Industry, COUNT(Id) Contas, AVG(AnnualRevenue) MediaFaturamentoAnual 
        FROM Account GROUP BY Industry
    ];

    //Função MIN(nomeCampo) retorna o valor mínimo daquele campo
    //Também pode ser usada com a função COUNT() e GROUP  BY
    List<AggregateResult> minimumRevenue = [
        SELECT Industry, MIN(AnnualRevenue) MinimoFaturamentoAnual
        FROM Account GROUP BY Industry
    ];
    
    //Função MAX(nomeCampo) retorna o valor mínimo daquele campo
    //Também pode ser usada com a função COUNT() e GROUP  BY
    List<AggregateResult> maxRevenue = [
        SELECT Industry, MAX(AnnualRevenue) MaximoFaturamentoAnual
        FROM Account GROUP BY Industry
    ];
    
    //Função GROUP BY ROLLUP(nomeCampo1, nomeCampo2) gera subtotais e totais gerais por grupo
    //Foi incrementado a ordenção por LeadSource para ajudar na visualização
    //As linhas que possue a coluna LeadSource preennchida e Status Vazio
    //representam o subtotal por LeadSource
    //A linha que não possue valor no LeadSource e no Status representam o total gerral
    List<AggregateResult> totalLeads = [
        SELECT LeadSource, Status, COUNT(Id) totalCount 
        FROM Lead 
        GROUP BY ROLLUP(LeadSource, Status)
        ORDER BY LeadSource NULLS LAST
    ];

    //Função GROUP BY CUBE(nomeCampo1, nomeCampo2) gera subtotais e totais gerais por grupo
    //No entanto ela gera mais subtotais que o ROLLUP
    //Neste caso ela gera o número de ocorrência iguais do campo status
    //Indepente do LeadSource
    //Representado na linha que possue status mas não pussui valor na coluna LeadSource
    List<AggregateResult> totalLeadsAndStatus = [
        SELECT LeadSource, Status, COUNT(Id) totalCount 
        FROM Lead 
        GROUP BY CUBE(LeadSource, Status)
        ORDER BY LeadSource NULLS LAST
    ];

    //Função HAVING usada para filtrar o resultado de uma consulta agregada
    //Neste caso mostra apenas os resultado de SUM(Amount) superior a 100 mil
    List<AggregateResult> accountsOneThousend = [
        SELECT LeadSource, SUM(Amount) totalAmount, COUNT(Id) 
        FROM Opportunity 
        GROUP BY LeadSource 
        HAVING SUM(Amount) > 100000
    ];


    //<<<<< Operações DML >>>>>

    //Exemplo simples do uso do merge com a classe Database
    //É interessante utilizar sempre a classe Database para maior controle das operações DML
    //Ela permite visualizar erros, processar parcialmente uma lista de registros
    //persistindo os registros válidos e retorna erro para os registros não válidos
    //permite também o uso do rollback
   
    public void mergeContacts(){
        
        Contact contact1 = new Contact(FirstName = 'John', LastName = 'Doe', Email = 'john.doe@example.com');
        Contact contact2 = new Contact(FirstName = 'Jane', LastName = 'Doe', Email = 'john.doe@example.com');

        // Inserindo os contatos
        Database.SaveResult[] insertResult = Database.insert(new List<Contact>{contact1, contact2}, false);

        // Mesclando os contatos
        Database.MergeResult mergeResult = Database.merge(contact1, contact2, false);
        
        if (mergeResult.isSuccess()) {
            System.debug('Contacts merged successfully.');
        } else {
            for (Database.Error error : mergeResult.getErrors()) {
                System.debug('Error merging contacts: ' + error.getMessage());
            }
        }

    }

}