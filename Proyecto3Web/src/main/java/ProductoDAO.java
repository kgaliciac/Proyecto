import java.sql.SQLException;
import java.sql.Statement;

public class ProductoDAO {

    public void grabarProducto(){
        try {
            Statement statement = VariablesGlobales.conn.createStatement();
            String nombre1="hola";
            Integer precio=1;

            String dml = "INSERT INTO producto(nombre,descripcion,cantidad,precio) VALUES('"+nombre1+"','"+nombre1+"',"+precio+","+precio+")";
            System.out.println("dml = " + dml);
            statement.executeUpdate(dml);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

}
