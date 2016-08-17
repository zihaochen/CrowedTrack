package BackEnd;

import java.sql.*;
/**
 * Created by Zihao on 2016/6/12.
 */
public class RateFeedback {
    public RateFeedback() {
    }

    public boolean rateFeedback(String username, String fid, String rating, Statement statement) throws SQLException {
        String checkQuery;
        ResultSet resultSet;
        checkQuery = "SELECT * FROM acmdb14.Feedback F WHERE F.fid = " + fid + " AND F.username = '" + username + "'";
        try {
            resultSet = statement.executeQuery(checkQuery);
        }
        catch (Exception e) {
            System.err.println("Unable to execute query: " + checkQuery + "\n");
            e.printStackTrace();
            throw e;
        }
        if (resultSet.next()) {
            return false;
        }

        String rateQuery;
        rateQuery = "INSERT INTO acmdb14.Rates\n" +
                    "VALUES('" + username + "', " + fid + ", '" + rating + "')";

        try {
            statement.executeUpdate(rateQuery);
        }
        catch (Exception e) {
            System.err.println("Unable to execute query: " + rateQuery+ "\n");
            e.printStackTrace();
            throw e;
        }
        System.out.println("Add rating query: " + rateQuery+ "\n");
        return true;
    }
}
