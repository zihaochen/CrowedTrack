package BackEnd;

import java.sql.*;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.Queue;

/**
 * Created by Zihao on 2016/6/12.
 */
public class ComputeDegree {
    public ComputeDegree() {
    }
    public int computeDegree(String username1, String username2, Statement statement) throws SQLException {
        HashSet<String> hashSet = new HashSet<>();
        Queue<String> userQueue = new LinkedList<>();
        Queue<Integer> degreeQueue = new LinkedList<>();
        hashSet.add(username1);
        userQueue.add(username1);
        degreeQueue.add(0);
        while (!userQueue.isEmpty()) {
            String userHead = userQueue.remove();
            int degreeHead = degreeQueue.remove();
            String  query;
            ResultSet resultSet;
            query = "SELECT DISTINCT F1.username FROM acmdb14.Favorites F1 WHERE F1.pid IN (" +
                    "SELECT F2.pid FROM acmdb14.Favorites F2 WHERE F2.username = '" + userHead +
                    "')";
            try{
                resultSet = statement.executeQuery(query);
            } catch (Exception e) {
                System.err.println("Unable to execute query: " + query + "\n");
                e.printStackTrace();
                throw e;
            }
            System.out.println("Degree: " + query + "\n");
            while (resultSet.next()) {
                String tmpUser = resultSet.getString("username");
                if (!hashSet.contains(tmpUser)) {
                    userQueue.add(tmpUser);
                    degreeQueue.add(degreeHead + 1);
                    if (tmpUser.equals(username2)) {
                        return degreeHead + 1;
                    }
                    hashSet.add(tmpUser);
                }
            }
        }
        return -1;
    }
}
