package BackEnd;

import java.sql.*;
/**
 * Created by Zihao on 2016/6/12.
 */
public class Visit {
    public Visit() {
    }

    public boolean visitPOI(String username, String pid, String date, String cost, String numberofheads, Connector connector) throws SQLException {
        String visEventQuery;
        visEventQuery = "INSERT INTO acmdb14.VisEvent\n" +
                        "VALUES(null, " + cost + ", " + numberofheads + ") ";
        PreparedStatement stmt;
        int vid;
        try {
            stmt = connector.con.prepareStatement(visEventQuery, Statement.RETURN_GENERATED_KEYS);
            stmt.executeUpdate();
            ResultSet resultSet = stmt.getGeneratedKeys();
            resultSet.next();
            vid = resultSet.getInt(1);
        }
        catch (Exception e) {
            System.err.println("Unable to execute query: " + visEventQuery+ "\n");
            e.printStackTrace();
            throw e;
        }
        System.out.println("Add VisEvent: " + visEventQuery + "\n");

        String visitQuery;
        visitQuery = "INSERT INTO acmdb14.Visit\n" +
                      "VALUES('" + username + "', " + pid + ", " + vid + ", '" + date + "') ";

        try {
            connector.stmt.executeUpdate(visitQuery);
        }
        catch (Exception e) {
            System.err.println("Unable to execute query: " + visitQuery+ "\n");
            e.printStackTrace();
            throw e;
        }
        System.out.println("Add Visit: " + visEventQuery + "\n");
        return true;
    }
}
