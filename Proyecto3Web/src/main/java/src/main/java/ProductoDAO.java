package src.main.java;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ProductoDAO {

    public void grabarProducto() {
        try {
            Statement statement = VariablesGlobales.conn.createStatement();
            String nombre1 = "hola";
            Integer precio = 25;

            String dml = "INSERT INTO clienteempresa(nombre,direccion,contacto,descuento,sociedad) VALUES('" + nombre1 + "','" + nombre1 + "','" + nombre1 + "'," + precio + ",'" + nombre1 + "')";
            System.out.println("dml = " + dml);
            statement.executeUpdate(dml);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
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
        {

        }

        return cliente;

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
        {

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
                    String sql = "SELECT * FROM clienteindividual;" + "update clienteindividual set nombre=" + "'" + nombre + "'" + "where codigoclienteindividual=" + codigo + ";";
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
                    String sql = "SELECT * FROM clienteempresa;" + "update clienteempresa set nombre=" + "'" + nombre + "'" + "where codigoclienteempresa=" + codigo + ";";
                    rs = statement.executeQuery(sql);

                    System.out.println(sql);
                }

            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }


    }

    public void getEliminarRegistro(int codigo) {
        try {
            Statement statement = VariablesGlobales.conn.createStatement();
            String consulta = "DELETE FROM clienteindividual where codigoclienteindividual ="+codigo+";";
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


}
