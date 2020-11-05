package src.main.java;


public class Producto {

	private int idProducto;
	private String descripcion;
	private String nombreProducto;
	private int cantidadInventario;
	private double precio;


	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public int getCantidadInventario() {
		return cantidadInventario;
	}
	
	public void setCantidadInventario(int cantidadInventario) {
		this.cantidadInventario = cantidadInventario;
	}
	public Producto(String nombreProducto, String descripcion,int cantidadInventario, double precio) {
		this.nombreProducto = nombreProducto;
		this.descripcion=descripcion;
		this.cantidadInventario = cantidadInventario;
		this.precio = precio;
	}

	public Producto(int codigo,String nombreProducto, String descripcion,int cantidadInventario, double precio) {
		this.idProducto=codigo;
		this.nombreProducto = nombreProducto;
		this.descripcion=descripcion;
		this.cantidadInventario = cantidadInventario;
		this.precio = precio;
	}
	
	public int getIdProducto() {
		return idProducto;
	} 
	public void setIdProducto(int idProducto) {
		this.idProducto = idProducto;
	}
	public String getNombreProducto() {
		return nombreProducto;
	}

	public void setNombreProducto(String nombreProducto) {
		this.nombreProducto = nombreProducto;
	}
	public double getPrecio() {
		return precio;
	}
	
	public void setPrecio(double precio) {
		this.precio = precio;
	}
	
	public String toString() {
		return "[Producto] Id de Producto=" + idProducto + ", Nombre=" + nombreProducto + ", Stock="
				+ cantidadInventario + ", Tipo de Producto=" + ", precio=" + precio;
	}

}
