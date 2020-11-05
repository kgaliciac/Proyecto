package src.main.java;

import java.util.ArrayList;
import java.util.List;

public class Cadenproducto {

    public static List<Producto> producto=new ArrayList<Producto>();

    public static List<Producto> getProducto() {
        return producto;
    }

    public void agregarProducto(Producto p){
        producto.add(p);
    }

    public static void setProducto(List<Producto> producto) {
        Cadenproducto.producto = producto;
    }
}
