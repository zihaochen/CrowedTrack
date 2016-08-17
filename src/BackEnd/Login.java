package BackEnd;

import java.sql.*;

/**
 * Created by Zihao on 2016/6/11.
 */
public class Login {
    public Login() {
    }
    public boolean checkNamePswd(String username, String password, Statement statement) throws Exception {
        String query;
        ResultSet resultSet;
        query = "Select * from acmdb14.Users where username = '" + username + "' and password = '" + password + "'";
        try{
            resultSet = statement.executeQuery(query);
        } catch (Exception e) {
            System.err.println("Unable to execute query: " + query + "\n");
            e.printStackTrace();
            throw e;
        }
        System.out.println("Login query: " + query + "\n");
        if (!resultSet.next()) {
            return  false;
        }
        else {
            return true;
        }
    }
}
