package BackEnd;

import java.sql.*;
/**
 * Created by Zihao on 2016/6/12.
 */
public class FavoritePOI {
    public FavoritePOI() {
    }

    public boolean favorite (String pid, String username, String fvdate, Statement statement) throws SQLException {
        String favoriteQuery;
        favoriteQuery = "INSERT INTO acmdb14.Favorites\n" +
                        "VALUES(" + pid + ", '" + username + "', " + fvdate + ")";

        try {
            statement.executeUpdate(favoriteQuery);
        }
        catch (Exception e) {
            System.err.println("Unable to execute query: " + favoriteQuery + "\n");
            e.printStackTrace();
            throw e;
        }
        System.out.println("Add favorite: " + favoriteQuery + "\n");
        return true;
    }
}
