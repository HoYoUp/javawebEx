package DBManager;

import java.sql.*;
import java.util.Date;
import DBManager.DBLink;
public class Users {
    DBLink mysql = new DBLink();
    private String name="",password="",phone="";
    public Users(String name,String password,String phone){
        this.name=name;
        this.password=password;
        this.phone=phone;
    }
    public void adduser(){
        try{
            PreparedStatement stat = mysql.connect.prepareStatement("insert into user VALUES (NULL,?,?,?,?,?)");
            stat.setString(1,name);
            stat.setString(2,password);
            stat.setTimestamp(3,new Timestamp(new Date().getTime()));
            stat.setInt(4,0);
            stat.setString(5,phone);
            int i = stat.executeUpdate();
            stat.close();
            mysql.connect.close();
        }
        catch (SQLException e){
            e.printStackTrace();
        }
    }
    public boolean addMoney(){
        return false;
    }
    public String checkuser(){
        try{
            PreparedStatement stat = mysql.connect.prepareStatement("SELECT id from user WHERE name=? AND pwd=?");
            stat.setString(1,name);
            stat.setString(2,password);
            ResultSet result = stat.executeQuery();
            String r = "";
            if(result.next())
                r = result.getString(1);
            stat.close();
            mysql.connect.close();
            return r;
        }
        catch (SQLException e){
            e.printStackTrace();
            return null;
        }

    }
}
