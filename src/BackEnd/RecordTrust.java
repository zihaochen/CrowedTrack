package BackEnd;

import java.sql.*;
/**
 * Created by Zihao on 2016/6/12.
 */
public class RecordTrust {
    public RecordTrust() {
    }

    public boolean recordTrust(String username1, String username2, String isTrusted, Statement statement) throws SQLException {
        String checkQuery;
        ResultSet checkResultSet;
        checkQuery  = "Select * from acmdb14.Trust where username1 = '" + username1 + "' and username2 = '" + username2 + "'";
        try {
            checkResultSet = statement.executeQuery(checkQuery);
        }
        catch (Exception e) {
            System.err.println("Unable to execute query: " + checkQuery+ "\n");
            e.printStackTrace();
            throw e;
        }
        System.out.println("Check query: " + checkQuery + "\n");

        if (checkResultSet.next()) {
            /*update the record*/
            String updateQuery;
            updateQuery = "UPDATE acmdb14.Trust \n" +
                          "SET isTrusted = " + isTrusted + "\n" +
                          "WHERE username1 = '" + username1 + "' and username2 = '" + username2 + "'";
            try {
                statement.executeUpdate(updateQuery);
            }
            catch (Exception e) {
                System.err.println("Unable to execute query: " + updateQuery + "\n");
                e.printStackTrace();
                throw e;
            }
            System.out.println("Trust update query: " + checkQuery + "\n");
            return  false;
        }
        else {
            /*add new record*/
            String addQuery;
            addQuery = "INSERT INTO acmdb14.Trust \n" +
                       "VALUES('" + username1 + "', '" + username2 + "', " + isTrusted + ")";
            try {
                statement.executeUpdate(addQuery);
            }
            catch (Exception e) {
                System.err.println("Unable to execute query: " + addQuery + "\n");
                e.printStackTrace();
                throw e;
            }
            System.out.println("Trust add query: " + addQuery + "\n");
            return true;
        }
    }
}
