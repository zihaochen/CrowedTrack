package BackEnd;

import java.sql.*;

/**
 * Created by Zihao on 2016/6/12.
 */
public class RecordFeedback {
    public RecordFeedback() {
    }
    public boolean recordFeedback(String text, String fbdate, String pid, String username, String score, Statement statement) throws SQLException {
        String feedbackQuery;
        feedbackQuery = "INSERT INTO acmdb14.Feedback\n" +
                "VALUES(null, " + "'" + text + "', '" + fbdate + "', " + pid + ", '" + username + "', " + score + ")";

        try {
            statement.executeUpdate(feedbackQuery);
        }
        catch (Exception e) {
            System.err.println("Unable to execute query: " + feedbackQuery + "\n");
            e.printStackTrace();
            throw e;
        }
        System.out.println("Add favorite: " + feedbackQuery + "\n");
        return true;
    }
}
