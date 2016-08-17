package BackEnd;

import java.sql.*;
/**
 * Created by Zihao on 2016/6/12.
 */
public class FeedbackCollector {
    public FeedbackCollector() {
    }
    public String listFeedback(Statement statement) throws SQLException {
        String query;
        ResultSet resultSet;
        query = "SELECT * FROM acmdb14.Feedback" ;
        try{
            resultSet = statement.executeQuery(query);
        } catch (Exception e) {
            System.err.println("Unable to execute query: " + query + "\n");
            e.printStackTrace();
            throw e;
        }
        System.out.println("List feedback query: " + query + "\n");
        String ret = "";
        while (resultSet.next()) {
            ret += "<tr> <th>" + resultSet.getInt("fid") + "</th>" +
                    "<th>" + resultSet.getString("fbdate") + "</th>" +
                    "<th>" + resultSet.getInt("pid") + "</th>" +
                    "<th>" + resultSet.getString("username") + "</th>" +
                    "<th>" + resultSet.getString("text") + "</th> </tr>\n";
        }
        return ret;
    }
}
