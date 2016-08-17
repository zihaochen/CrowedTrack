package BackEnd;

import java.sql.*;
/**
 * Created by Zihao on 2016/6/12.
 */
public class UserAward {
    public UserAward() {
    }

    public String topTrusted(int m, Statement statement) throws SQLException {
        String query = "";
        String ret = "";
        ResultSet resultSet;
        query = "SELECT U.username, count(*) as cnt FROM " +
                "acmdb14.Users U, acmdb14.Trust T WHERE U.username = T.username2 " +
                "GROUP BY U.username ORDER BY cnt DESC LIMIT " + m;
        try{
            resultSet = statement.executeQuery(query);
        } catch (Exception e) {
            System.err.println("Unable to execute query: " + query + "\n");
            e.printStackTrace();
            throw e;
        }
        while (resultSet.next()) {
            ret += resultSet.getString("username") + "<br>";
        }
        return ret;
    }

    public String topUseful(int m, Statement statement) throws SQLException {
        String query = "";
        String ret = "";
        ResultSet resultSet;
        query = "SELECT U.username, sum(F2.Ravg) as Fsum FROM" +
                " acmdb14.Users U, (SELECT F.username, F.fid, avg(R.rating) as Ravg FROM " +
                "acmdb14.Feedback F, acmdb14.Rates R WHERE F.fid = R.fid GROUP BY F.fid)" +
                " AS F2 WHERE U.username = F2.username" +
                " GROUP BY U.username ORDER BY Fsum DESC LIMIT " + m;
        try{
            resultSet = statement.executeQuery(query);
        } catch (Exception e) {
            System.err.println("Unable to execute query: " + query + "\n");
            e.printStackTrace();
            throw e;
        }
        while (resultSet.next()) {
            ret += resultSet.getString("username") + "<br>";
        }
        return ret;
    }
}
