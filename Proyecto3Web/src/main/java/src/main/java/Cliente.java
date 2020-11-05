package src.main.java;

public class Cliente {
    private int idCliente;
    private static int idSiguiente = 1;
    private String nombreCliente;
    private String apellidoCliente;
    private String direccion;

    public static int sigIdCLiente() {
        return idSiguiente++;

    }

    public Cliente() {// Default
        idCliente = Cliente.sigIdCLiente();
    }
    /**
     * Constructor para la clase cliente
     *
     * @param nombreCliente
     * @param apellidoCliente
     * @param direccion
     */

    public Cliente(String nombreCliente, String apellidoCliente, String direccion) {
        this();
        this.nombreCliente = nombreCliente;
        this.apellidoCliente = apellidoCliente;
        this.direccion = direccion;
    }


    public Cliente(int codigo,String nombreCliente, String apellidoCliente, String direccion) {
        this.idCliente=codigo;
        this.nombreCliente = nombreCliente;
        this.apellidoCliente = apellidoCliente;
        this.direccion = direccion;
    }

    // cierre del constructor

    /**
     * metodo que devuelve nombre,apellido y direccion
     *
     * @return
     */

    public int getIdCliente() {
        return idCliente;
    }
    /**
     * Se le asignara un id al cliente para poderlo localizar mejor
     *
     * @param idCliente
     */



    public void setIdCliente(int idCliente) {
        this.idCliente = idCliente;
    }
    /**
     * devuele al cliente
     *
     * @return cliente
     */

    public String getNombreCliente() {
        return nombreCliente;
    }
    /**
     * Guardara el nombre del cliente
     *
     * @param nombreCliente
     */

    public void setNombreCliente(String nombreCliente) {
        this.nombreCliente = nombreCliente;
    }

    /**
     * regresara al cliente
     *
     * @return nombre cliente
     */

    public String getApellidoCliente() {
        return apellidoCliente;
    }
    /**
     * Apellido del cliente
     *
     * @param apellidoCliente
     */

    public void setApellidoCliente(String apellidoCliente) {
        this.apellidoCliente = apellidoCliente;
    }

    /**
     * regresa el apellido del cliente
     *
     * @return apellido cliente
     */

    public String getDireccion() {
        return direccion;
    }
    /**
     * direccion del cleiente
     *
     * @param direccion
     */

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    @Override
    public String toString() {
        return "idCliente=" + idCliente + ", nombreCliente=" + nombreCliente + ", apellidoCliente=" + apellidoCliente
                + ", direccion=" + direccion + ", ";
    }
    /**
     * constructor dpi que tomara esa informacion para mostrarla luego
     *
     * @param dpi
     */


    public void setDpipadre(String dpi) {
        // TODO Auto-generated method stub

    }
    /**
     * como se contactara con el cliente
     *
     * @param contacto
     */
    public void setDContactopadre(String contacto) {
        // TODO Auto-generated method stub

    }
    /**
     * El descuento que se le realizara al cliente
     *
     * @param descuentoEmpresa
     */
    public void setDescuentopadre(int descuentoEmpresa) {
        // TODO Auto-generated method stub

    }
    /**
     * regresara el descuento aplicado
     *
     * @return descuento
     */

    public String getContactopadre() {
        // TODO Auto-generated method stub
        return null;
    }
    /**
     * Regresara el contacto a hijo
     *
     * @return contacto
     */

    public int getDescuentoEmpresaPadre() {
        // TODO Auto-generated method stub
        return 0;
    }
    /**
     * regresara descuento
     *
     * @return descuento
     */
    public String getDpipadre() {
        // TODO Auto-generated method stub
        return null;
    }
}
