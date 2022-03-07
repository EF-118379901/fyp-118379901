package dbconnection;

import java.sql.Connection;
import java.sql.DriverManager; 
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ConnectionProvider {

    Logger logger = Logger.getLogger(ConnectionProvider.class.getName());

    public ConnectionProvider() {
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException ex) {
            logger.log(Level.SEVERE, null, ex);
        }
        
    }
    
   

    public Connection getConnection() {


        Connection dbConnection = null;
        //String strUrl = "jdbc:derby:bills-product-db;create=true";
        String strUrl = "jdbc:mysql://localhost:3306/environment";
        try {
            dbConnection = DriverManager.getConnection(strUrl,"Eoin","DbUser19");
        } catch (SQLException sqle) {
            logger.log(Level.SEVERE, null, sqle.getStackTrace());
        }

        return dbConnection;

    }

}