public with sharing class ItemPedido {
    
    private Decimal quantidade;
    private Decimal preco;
    private Decimal precoLiquido;
    
    public ItemPedido() {

        this.quantidade = 0;
        this.preco = 0;
        this.precoLiquido = 0;

    }

    public Decimal getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(Decimal quantidade) {
        this.quantidade = quantidade;
    }

    public Decimal getPreco() {
        return preco;
    }

    public void setPreco(Decimal preco) {
        this.preco = preco;
    }

    public Decimal getPrecoLiquido() {
        return precoLiquido;
    }

    public void setPrecoLiquido(Decimal precoLiquido) {
        this.precoLiquido = precoLiquido;
    }

    public Decimal getTotal(){
        return preco * quantidade;
    }

    public Decimal getTotalLiquido(){
        return precoLiquido * quantidade;
    }
}