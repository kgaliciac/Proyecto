package src.main.java;

public class Factura {

    private int numerodefactura;
    private int idcliente;
    private double totalprecio;

    public double getTotalprecio() {
        return totalprecio;
    }

    public void setTotalprecio(int totalprecio) {
        this.totalprecio = totalprecio;
    }



    public Factura(int numerodefactura, int idcliente,double totalprecio) {
        this.numerodefactura = numerodefactura;
        this.idcliente = idcliente;
        this.totalprecio = totalprecio;
    }

    public int getNumerodefactura() {
        return numerodefactura;
    }

    public void setNumerodefactura(int numerodefactura) {
        this.numerodefactura = numerodefactura;
    }

    public int getIdcliente() {
        return idcliente;
    }

    public void setIdcliente(int idcliente) {
        this.idcliente = idcliente;
    }

    public Factura(int numerodefactura, int idcliente) {
        this.numerodefactura = numerodefactura;
        this.idcliente = idcliente;
    }
}
