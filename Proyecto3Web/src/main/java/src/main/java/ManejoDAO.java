package src.main.java;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ManejoDAO {

    public void grabarProducto() {
        try {
            Statement statement = VariablesGlobales.conn.createStatement();
            String nombre1 = "hola";
            Integer precio = 25;
       
            String dml = "INSERT INTO detallefactura(idproducto,idfactura,cantidadcompra,subtotal) VALUES("+"8"+","+"8"+","+"8,"+"5"+")";
            System.out.println("dml = " + dml);
            statement.executeUpdate(dml);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }


    public Factura grabarFactura(int codigocliente) {
        Factura factura=null;
        List<Factura> fac = new ArrayList<Factura>();
        try {
            Statement statement = VariablesGlobales.conn.createStatement();
            String dml = "INSERT INTO factura(idcliente) VALUES('"+codigocliente+"')";
            statement.executeUpdate(dml);

            String consulta = "SELECT idfactura"+
                    " FROM factura";
            ResultSet rs = statement.executeQuery(consulta);

            while (rs.next()) {
                fac.add(new Factura(rs.getInt("idfactura"),codigocliente));
            }

            int mayor=0;
            if(fac.size()!=1){
            for (int i=0;i<fac.size();i++){

                for (int j=1;j<fac.size();j++){

                     if (fac.get(i).getNumerodefactura()>fac.get(j).getNumerodefactura()){
                        mayor=fac.get(i).getNumerodefactura();
                    }
                     if(fac.size()==2){
                         mayor=fac.get(j).getNumerodefactura();
                     }
                }
            }}else {
                mayor=1;
            }

            System.out.println(mayor);
            factura=new Factura(mayor,codigocliente);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return factura;
    }


    public Producto grabarProducto(String nombre, String descripcion, int cantidad, double precio) {
        Producto producto=null;
        try {
            Statement statement = VariablesGlobales.conn.createStatement();
            producto=new Producto(nombre,descripcion,cantidad,precio);
            String dml = "INSERT INTO producto(nombre,descripcion,cantidad,precio) VALUES("+"'"+nombre+"',"+"'"+descripcion+"',"+cantidad+","+precio+")";
            System.out.println("dml = " + dml);
            statement.executeUpdate(dml);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return producto;
    }


    public Producto grabarDetalle(int codigo,int numerodefactura, int cantidad) {
        Producto producto=null;
        try {
            Statement statement = VariablesGlobales.conn.createStatement();
            producto=getDBbuscarproducto(codigo);
            Double subtotal=(cantidad*producto.getPrecio());
            String dml = "INSERT INTO detallefactura(idproducto,idfactura,cantidadcompra,subtotal) VALUES("+producto.getIdProducto()+","+numerodefactura+","+cantidad+","+subtotal+")";
            System.out.println("dml = " + dml);
            statement.executeUpdate(dml);
            producto.setCantidadInventario(cantidad);
            producto.setPrecio(subtotal);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return producto;
    }


    public Cliente_Individual grabarClienteIndi(String nombre, String apellido, String direccion, String dpi) {
        Cliente_Individual cliente=null;
        try {
            Statement statement = VariablesGlobales.conn.createStatement();
            cliente=new Cliente_Individual(1,nombre,apellido,direccion,dpi);
            String dml = "INSERT INTO clienteindividual(nombre,apellido,direccion,dpi) VALUES("+"'"+nombre+"',"+"'"+apellido+"',"+"'"+direccion+"',"+"'"+dpi+"'"+")";
            statement.executeUpdate(dml);
            System.out.println("dml = " + dml);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return cliente;
    }


    public Cliente_Empresa grabarClienteEmpre(String nombre, String direccion, String contacto,int descuento) {
        Cliente_Empresa cliente=null;
        try {
            Statement statement = VariablesGlobales.conn.createStatement();
            cliente=new Cliente_Empresa(1,nombre,"SA",direccion,contacto,descuento);
            String dml = "INSERT INTO clienteempresa(nombre,direccion,contacto,descuento,sociedad) VALUES("+"'"+nombre+"',"+"'"+direccion+"',"+"'"+contacto+"',"+
                    descuento+","+"'"+"sa"+"'"+")";
            System.out.println("dml = " + dml);
            statement.executeUpdate(dml);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return cliente;
    }


    public List<Cliente_Individual> getDBclienteindividual() {
        List<Cliente_Individual> clienteindi = new ArrayList<Cliente_Individual>();
        try {
            Statement statement = VariablesGlobales.conn.createStatement();
            String consulta = " SELECT codigoclienteindividual, nombre,apellido, direccion,dpi" +
                    " FROM clienteindividual";
            ResultSet rs = statement.executeQuery(consulta);
            while (rs.next()) {
                clienteindi.add(new Cliente_Individual(rs.getInt("codigoclienteindividual"), rs.getString("nombre"), rs.getString("apellido"), rs.getString("direccion"), rs.getString("dpi")));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return clienteindi;
    }


    public List<Producto> getDBproducto() {
        List<Producto> productos = new ArrayList<Producto>();
        try {
            Statement statement = VariablesGlobales.conn.createStatement();
            String consulta = "SELECT codigo,nombre,descripcion,cantidad,precio"+
                    " FROM producto";
            ResultSet rs = statement.executeQuery(consulta);
            while (rs.next()) {
                productos.add(new Producto(Integer.parseInt(rs.getString("codigo")),rs.getString("nombre"), rs.getString("descripcion"), Integer.parseInt(rs.getString("cantidad")),Double.parseDouble(rs.getString("precio"))));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return productos;
    }


    public List<Factura> getDBfactura() {
        List<Factura> facturas = new ArrayList<Factura>();
        try {
            Statement statement = VariablesGlobales.conn.createStatement();
            String consulta = "SELECT idfactura,idcliente,totalprecio"+
                    " FROM factura";
            ResultSet rs = statement.executeQuery(consulta);
            while (rs.next()) {
                facturas.add(new Factura(Integer.parseInt(rs.getString("idfactura")),Integer.parseInt(rs.getString("idcliente")),(rs.getDouble("totalprecio")/1.00)));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        System.out.println(facturas.toString());
        return facturas;
    }


    public Producto getDBproducto(int codigo) {

        Producto producto = null;
        try {
            Statement statement = VariablesGlobales.conn.createStatement();
            String consulta = "SELECT codigo,nombre,descripcion,cantidad,precio"+
                    " FROM producto";
            ResultSet rs = statement.executeQuery(consulta);
            while (rs.next()) {
                if (rs.getInt("codigo") == codigo) {

                    producto = new Producto(Integer.parseInt(rs.getString("codigo")),rs.getString("nombre"), rs.getString("descripcion"), Integer.parseInt(rs.getString("cantidad")),Double.parseDouble(rs.getString("precio")));
                }

            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return producto;

    }

    public boolean verificarStock(int codigo, int cantidad){
        boolean verificacion=false;
        try {
            if(getDBbuscarproducto(codigo).getCantidadInventario()>=cantidad){
                verificacion=true;
                System.out.println("si se puede");
                rebajarStock(codigo, cantidad);
               }

        }catch (Exception e){
            e.printStackTrace();
        }
        return verificacion;
    }

    public void rebajarStock(int codigo, int cantidad){
        try {
            Statement statement = VariablesGlobales.conn.createStatement();
            String consulta = " SELECT codigo,cantidad" +
                    " FROM producto";
            ResultSet rs = statement.executeQuery(consulta);
            while (rs.next()) {

                if (rs.getInt("codigo") == codigo) {
                   String resta=rs.getString("cantidad");
                   int resultado=(Integer.parseInt(resta)-cantidad);
                    String sql = "SELECT * FROM producto;" + "update producto set cantidad="  + resultado + " where codigo=" + codigo + ";";
                    System.out.println(sql);
                    rs = statement.executeQuery(sql);

                    System.out.println(sql);
                }

            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    public Producto getDBbuscarproducto(int codigo) {

       Producto product = null;
        try {
            Statement statement = VariablesGlobales.conn.createStatement();
            String consulta = " SELECT codigo,nombre, descripcion,cantidad,precio" +
                    " FROM producto";
            ResultSet rs = statement.executeQuery(consulta);
            while (rs.next()) {
                if (rs.getInt("codigo") == codigo) {

                    product = new Producto(rs.getInt("codigo"), rs.getString("nombre"), rs.getString("descripcion"),
                            rs.getInt("cantidad"),Double.parseDouble(rs.getString("precio")));
                }
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return product;
    }


    public Cliente_Individual getDBbuscarclienteIndi(int codigo) {

        Cliente_Individual cliente = null;
        try {
            Statement statement = VariablesGlobales.conn.createStatement();
            String consulta = " SELECT codigoclienteindividual, nombre,apellido, direccion,dpi" +
                    " FROM clienteindividual";
            ResultSet rs = statement.executeQuery(consulta);
            while (rs.next()) {
                if (rs.getInt("codigoclienteindividual") == codigo) {

                    cliente = new Cliente_Individual(rs.getInt("codigoclienteindividual"), rs.getString("nombre"), rs.getString("apellido"),
                            rs.getString("direccion"), rs.getString("dpi"));

                }

            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return cliente;

    }

    public Factura getDBbuscarfactura(int codigo) {
    System.out.println(codigo);
        Factura fac = null;
        try {
            Statement statement = VariablesGlobales.conn.createStatement();
            String consulta = " SELECT idfactura, idcliente, totalprecio" +
                    " FROM factura";
            ResultSet rs = statement.executeQuery(consulta);
            while (rs.next()) {
                if (rs.getInt("idfactura") == codigo) {

                    fac = new Factura(rs.getInt("idfactura"), rs.getInt("idcliente"),(rs.getDouble("totalprecio")/1.00));

                }

            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return fac;

    }




    public Cliente_Empresa getDBbuscarclienteempre(int codigo) {

        Cliente_Empresa cliente = null;
        try {
            Statement statement = VariablesGlobales.conn.createStatement();
            String consulta = " SELECT codigoclienteempresa,nombre,direccion,contacto,descuento,sociedad" +
                    " FROM clienteempresa";
            ResultSet rs = statement.executeQuery(consulta);
            while (rs.next()) {
                if (rs.getInt("codigoclienteempresa") == codigo) {

                    cliente = new Cliente_Empresa(rs.getInt("codigoclienteempresa"),
                            rs.getString("nombre"), "SA",
                            rs.getString("direccion"), rs.getString("contacto"), rs.getInt("descuento"));
                }
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }


        return cliente;

    }


    public void getDBmodificarcliente(Cliente_Individual c) {
        try {
            Statement statement = VariablesGlobales.conn.createStatement();
            String consulta = " SELECT codigoclienteindividual, nombre,apellido, direccion,dpi" +
                    " FROM clienteindividual";
            ResultSet rs = statement.executeQuery(consulta);
            while (rs.next()) {

                if (rs.getInt("codigoclienteindividual") == c.getIdCliente()) {
                    String nombre = c.getNombreCliente();
                    Integer codigo = c.getIdCliente();
                    String sql = "SELECT * FROM clienteindividual;" + "update clienteindividual set nombre=" + "'" + nombre + "'"+ "where codigoclienteindividual=" + codigo + ";"
                            + "update clienteindividual set apellido=" + "'" + c.getApellidoCliente() + "'"+ "where codigoclienteindividual=" + codigo + ";"
                            + "update clienteindividual set direccion =" + "'" + c.getDireccion() + "'"+ "where codigoclienteindividual=" + codigo + ";"
                            + "update clienteindividual set dpi=" + "'" + c.getDpi() + "'"+ "where codigoclienteindividual=" + codigo + ";";

                    rs = statement.executeQuery(sql);

                    System.out.println(sql);
                }

            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

    }

    public void getDBmodificarproducto(Producto p) {
        try {
            Statement statement = VariablesGlobales.conn.createStatement();
            String consulta ="SELECT codigo,nombre,descripcion,cantidad,precio"+
                    " FROM producto";
            ResultSet rs = statement.executeQuery(consulta);
            while (rs.next()) {

                if (rs.getInt("codigo") == p.getIdProducto()) {
                    String nombre = p.getNombreProducto();
                    Integer codigo = p.getIdProducto();
                    Integer cantidad= p.getCantidadInventario();
                    String sql = "SELECT * FROM producto;" + "update producto set nombre=" + "'" + nombre + "'" + "where codigo=" + codigo + ";"
                            + "update producto set cantidad="  + cantidad + " where codigo=" + codigo + ";";
                    rs = statement.executeQuery(sql);

                    System.out.println(sql);
                }

            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }




    public void getDBmodificarclienteempre(Cliente_Empresa ce) {
        try {
            Statement statement = VariablesGlobales.conn.createStatement();
            String consulta = " SELECT codigoclienteempresa,nombre,direccion,contacto,descuento,sociedad" +
                    " FROM clienteempresa";
            ResultSet rs = statement.executeQuery(consulta);
            while (rs.next()) {
                if (rs.getInt("codigoclienteempresa") == ce.getIdCliente()) {
                    String nombre = ce.getNombreCliente();
                    Integer codigo = ce.getIdCliente();

                    String sql = "SELECT * FROM clienteempresa;" + "update clienteempresa set nombre=" + "'" + nombre + "'"+ "where codigoclienteempresa=" + codigo + ";"
                            + "update clienteempresa set contacto=" + "'" + ce.getContacto() + "'"+ "where codigoclienteempresa=" + codigo + ";"
                            + "update clienteempresa set direccion =" + "'" + ce.getDireccion() + "'"+ "where codigoclienteempresa=" + codigo + ";"
                            + "update clienteempresa set descuento=" + "'" + ce.getDescuentoEmpresa() + "'"+ "where codigoclienteempresa=" + codigo + ";";


                    rs = statement.executeQuery(sql);

                    System.out.println(sql);
                }

            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }


    }

    public void getmodificartotaldefactura(int codigo, Double precio) {
        try {
            Statement statement = VariablesGlobales.conn.createStatement();
            String consulta = " SELECT idfactura,totalprecio" +
                    " FROM factura";
            ResultSet rs = statement.executeQuery(consulta);
            while (rs.next()) {
                if (rs.getInt("idfactura") == codigo) {

                    String sql = "SELECT * FROM factura;" + "update factura set totalprecio="   + precio +  " where idfactura=" + codigo + ";";
                    rs = statement.executeQuery(sql);

                    System.out.println(sql);
                }

            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    public void getEliminarRegistroindividual(int codigo) {
        try {
            Statement statement = VariablesGlobales.conn.createStatement();
            String consulta = "DELETE FROM clienteindividual where codigoclienteindividual =" + codigo + ";";
            ResultSet rs = statement.executeQuery(consulta);

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

    }


    public void getEliminarproducto(int codigo) {
        try {
            Statement statement = VariablesGlobales.conn.createStatement();
            String consulta = "DELETE FROM producto where codigo =" + codigo + ";";
            ResultSet rs = statement.executeQuery(consulta);


        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

    }


    public void getEliminarRegistroempresa(int codigo) {
        try {
            Statement statement = VariablesGlobales.conn.createStatement();
            String consulta = "DELETE FROM clienteempresa where codigoclienteempresa =" + codigo + ";";
            ResultSet rs = statement.executeQuery(consulta);


        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

    }


    public List<Cliente_Empresa> getDBclienteempresa() {
        List<Cliente_Empresa> clienteempre = new ArrayList<Cliente_Empresa>();
        try {
            Statement statement = VariablesGlobales.conn.createStatement();
            String consulta = " SELECT codigoclienteempresa,nombre,direccion,contacto,descuento,sociedad" +
                    " FROM clienteempresa";
            ResultSet rs = statement.executeQuery(consulta);
            while (rs.next()) {
                clienteempre.add(new Cliente_Empresa(rs.getInt("codigoclienteempresa"), rs.getString("nombre"), rs.getString("sociedad"),
                        rs.getString("direccion"),
                        rs.getString("contacto"), rs.getInt("descuento")));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return clienteempre;
    }



    public List<Producto> getDBdetallefactura(int numerodefactura) {
       List<Producto> productos = new ArrayList<Producto>();
       Producto product=null;
        try {
            Statement statement = VariablesGlobales.conn.createStatement();
            String consulta = " SELECT idproducto,idfactura,cantidadcompra,subtotal" +
                    " FROM detallefactura";
            ResultSet rs = statement.executeQuery(consulta);
            while (rs.next()) {
                if (rs.getInt("idfactura") == numerodefactura) {
                    product=getDBbuscarproducto(rs.getInt("idproducto"));
                    productos.add(new Producto(Integer.parseInt(rs.getString("idproducto")),product.getNombreProducto(),product.getDescripcion(), Integer.parseInt(rs.getString("cantidadcompra")),Double.parseDouble(rs.getString("subtotal"))));
                }
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return productos;
    }

}
