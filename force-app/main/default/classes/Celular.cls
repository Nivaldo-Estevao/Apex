public class Celular {
    
    public Integer numeroNucleosProcessador;
    public Long numero;
    public String marca;
    public String modelo;
    public String fabricante;
    public Boolean ligado;

    public Celular (){
        ligado = false;
    }

    public Celular (Long numero){
        this.numero = numero;
    }

    public void discar (String numeroDestino){

        System.debug ('Ligando para ' 
                + numeroDestino 
                + '\n De : ' + numeroDestino
                + '\n Marca/Modelo : '
                + marca + '/' + modelo);
    }

    public void enviarMensagem (String numero
                             , String mensagem){

        System.debug('[ ' + numero + ' ]\n'
                    + 'Mensagem : ' + mensagem);
    }

}