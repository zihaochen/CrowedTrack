package BackEnd;

import java.sql.*;

/**
 * Created by Zihao on 2016/6/11.
 */
public class Registration {
    public Registration() {
    }
    public boolean register(String username, String password, String fullname, String address, String phoneno, Statement statement) throws Exception {
        String query;

        if (!checkUsername(username, statement))
            return false;

        query = "INSERT INTO acmdb14.Users \n" +
                "VALUES('" + username + "', '" + password + "', '" + fullname + "', '" + phoneno + "', '" + address + "') ";
        try{
           statement.executeUpdate(query);
        } catch (Exception e) {
            System.out.println("Register query: " + query + "\n");
            System.err.println("Unable to execute query: " + query + "\n");
            e.printStackTrace();
            throw e;
        }
        System.out.println("Register query: " + query + "\n");
        return true;
    }

    public boolean checkUsername(String username, Statement statement) throws SQLException {
        String query;
        ResultSet resultSet;
        query = "Select * from acmdb14.Users where username = '" + username + "'";
        try{
            resultSet = statement.executeQuery(query);
        } catch (Exception e) {
            System.err.println("Unable to execute query: " + query + "\n");
            e.printStackTrace();
            throw e;
        }
        System.out.println("checkUsername query: " + query + "\n");
        if (!resultSet.next()) {
            return true;
        }
        else {
            return false;
        }
    }
}
