package DBManager;

import java.sql.*;
import java.util.Date;

public class DBLink {
    Connection connect = null;
    private String name = "visitorIDEA", password = "Idea1234";
    private String url = "jdbc:mysql://localhost:3306/temp";
    private String driver = "com.mysql.jdbc.Driver";

    public DBLink() {

        try {
            Class.forName(driver);
            try {
                connect = DriverManager.getConnection(url, name, password);
            } catch (SQLException e) {
                System.out.println("Link to mysql failed");
                e.printStackTrace();
            }
        } catch (ClassNotFoundException e) {
            System.out.println("driver not found");
            e.printStackTrace();
        }

    }
    public Statement getState(){
        try {
            return connect.createStatement();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    public PreparedStatement getPrepared(String s) throws SQLException {
            return connect.prepareStatement(s);
    }
    public void close(){
        try {
            connect.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}