package BackEnd;

/**
 * Created by Zihao on 2016/6/11.
 */
import java.sql.*;

public class Connector {
    public Connection con;
    public Statement stmt;
    String userName = "acmdbu14";
    String password = "52j2a0jc";
    String url = "jdbc:mysql://georgia.eng.utah.edu";
    public Connector() throws Exception {
        try{
            Class.forName ("com.mysql.jdbc.Driver").newInstance ();
            con = DriverManager.getConnection (url, userName, password);
            stmt = con.createStatement();
        } catch(Exception e) {
            System.err.println("Unable to open mysql jdbc connection. The error is as follows " + e.getMessage());
            e.printStackTrace();
            throw(e);
        }
    }

    public void closeConnection() throws Exception{
        con.close();
    }
}

