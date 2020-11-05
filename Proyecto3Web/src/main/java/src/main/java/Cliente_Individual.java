package src.main.java;

public class Cliente_Individual extends Cliente {
  
    private String dpi;

    public Cliente_Individual(int codigo,String nombreCliente, String apellidoCliente, String direccion, String dpi) {

        super(codigo,nombreCliente, apellidoCliente, direccion);
        this.dpi = dpi;
    }

    public String getDpi() {
        return dpi;
    }

    public void setDpi(String dpi) {
        this.dpi = dpi;
    }

    @Override
    public String toString() {
        return "[Cliente_Individual] " + super.toString() + "dpi=" + dpi + "";
    }

    @Override
    public void setDpipadre(String dpi) {
        this.dpi = dpi;
    }
    @Override
    public String getDpipadre() {
        return dpi;
    }

}
