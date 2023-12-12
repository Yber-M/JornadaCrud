/**
 * @author Yber-M;
 * @email ybermarlon@gmail.com
 * @github https://github.com/Yber-M
 * @facebook https://www.facebook.com/MarlonYber.QO
 */
package app.yberm.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Conexion {

    private final String user = "yb-m";
    private final String pass = "marlon681566";
    private final String nameDB = "DiarioJornada";
    private final String ip = "localhost";
    private final String puerto = "1433";

    Connection conectar = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    public Connection getConexion() {
        try {
            String cadenaJDBC = "jdbc:sqlserver://" + ip + ":" + puerto + ";" + "databaseName=" + nameDB + ";encrypt=true;trustServerCertificate=true;";

            conectar = DriverManager.getConnection(cadenaJDBC, user, pass);
            System.out.println("CONEXIÓN EXITOSA");

        } catch (SQLException e) {
            System.out.println("Error al conectar a la base de datos. \nERROR:" + e.toString());
        }
        return conectar;
    }

}
