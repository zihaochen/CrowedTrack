package BackEnd;

import java.sql.*;

/**
 * Created by Zihao on 2016/6/12.
 */
public class UpdatePOI {
    public UpdatePOI() {
    }
    public boolean updatePOI(String pid, String name, String address, String URL, String telno, String yearOfEstblsh, String hourofop, String price, String keywords, String category, Statement statement) throws Exception {
        String query;

        query = "UPDATE acmdb14.POI\n" +
                "SET name = '" + name + "', address = '" + address + "', URL = '" + URL + "', telno = '" + telno + "', yearOfEstblsh = " + yearOfEstblsh + ", hourofop = '" + hourofop + "', price = " + price + ", keywords = '" + keywords + "', category = '" + category + "' " +
                "WHERE pid = " + pid;

        try {
            statement.executeUpdate(query);
        } catch (Exception e) {
            System.err.println("Unable to execute query: " + query + "\n");
            e.printStackTrace();
            throw e;
        }
        System.out.println("Update POI query: " + query + "\n");
        return true;
    }
}
