public with sharing class Pedido {
    
    private String tipoPedido;
    private Decimal total;
    private Decimal totalLiquido;
    private List<ItemPedido> items;

    public Pedido(){
        this.tipoPedido = '';
        this.total = 0;
        this.totalLiquido = 0;
        this.items = new List<ItemPedido>();
    }

    public void adicionarItem ( ItemPedido item ) {

        this.items.add(item);

        this.total += item.getTotal();
        this.totalLiquido += item.getTotalLiquido();

    }

    public Decimal calculaValorTaxa() {
        
        if (tipoPedido == 'SERVIÇO'){
            return 0.2;
        } else if (tipoPedido == 'VENDA PADRÃO') {
            return 0.1;
        }
        return 0;
    }
    
    public Decimal getTotal () {
        return this.total;
    }

    public Decimal getTotalLiquido () {
        return this.totalLiquido;
    }

}