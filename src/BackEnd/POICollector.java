package BackEnd;

import java.sql.*;

/**
 * Created by Zihao on 2016/6/12.
 */
public class POICollector {
    public POICollector() {
    }

    public String listPOI(Statement statement) throws SQLException {
        String query;
        ResultSet resultSet;
        query = "SELECT * FROM acmdb14.POI" ;
        try{
            resultSet = statement.executeQuery(query);
            System.out.println("List POI query: " + query + "\n");
        } catch (Exception e) {
            System.err.println("Unable to execute query: " + query + "\n");
            e.printStackTrace();
            throw e;
        }
        String ret = "";
        while (resultSet.next()) {
            ret += "<tr> <th>" + resultSet.getInt("pid") + "</th>" +
                   "<th>" + resultSet.getString("name") + "</th>" +
                   "<th>" + resultSet.getString("address") + "</th>" +
                   "<th>" + resultSet.getString("URL") + "</th>" +
                   "<th>" + resultSet.getString("telno") + "</th>" +
                   "<th>" + resultSet.getString("yearOfEstblsh") + "</th>" +
                   "<th>" + resultSet.getString("hourofOp") + "</th>" +
                   "<th>" + resultSet.getDouble("price") + "</th>" +
                   "<th>" + resultSet.getString("keywords") + "</th>" +
                   "<th>" + resultSet.getString("category") + "</th> </tr>\n";
        }
        return ret;
    }
}
