
package DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class Connect {
    public Connection getConnection () throws ClassNotFoundException, SQLException {
        Connection connection;
        Class.forName("org.postgresql.Driver");
        connection = DriverManager.getConnection("jdbc:postgresql://containers-us-west-101.railway.app:5830/railway","postgres", "hih02uKmibeCKBDj5WEK");
        return connection;
    }
}
