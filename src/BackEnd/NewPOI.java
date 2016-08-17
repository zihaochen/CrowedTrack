package BackEnd;

import java.sql.*;

/**
 * Created by Zihao on 2016/6/12.
 */
public class NewPOI {
    public NewPOI() {
    }

    public boolean addPOI(String name, String address, String URL, String telno, String yearOfEstblsh, String hourofop, String price, String keywords, String category, Statement statement) throws Exception {
        String query;

        query = "INSERT INTO acmdb14.POI \n" +
                "VALUES(null, '" + name + "', '" + address + "', '" + URL + "', '" + telno + "', " + yearOfEstblsh + ", '" + hourofop + "', " + price + ", '" + keywords + "', '" + category + "') ";
        try {
            statement.executeUpdate(query);
        } catch (Exception e) {
            System.err.println("Unable to execute query: " + query + "\n");
            e.printStackTrace();
            throw e;
        }
        System.out.println("AddPOI query: " + query + "\n");
        return true;
    }
}
