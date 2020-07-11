package DBManager;

import java.sql.*;
import java.util.Date;
import DBManager.DBLink;
import com.sun.xml.internal.ws.api.addressing.WSEndpointReference;

public class Users {
    DBLink mysql = new DBLink();
    private String name="",password="",phone="",id="";
    public Users(String i){
        this.id=i;
    }
    public Users(String name,String password,String phone){
        this.name=name;
        this.password=password;
        this.phone=phone;
    }
    public void adduser(){
        try{
            PreparedStatement stat = mysql.getPrepared("insert into user VALUES (NULL,?,?,?,?,?)");
            stat.setString(1,name);
            stat.setString(2,password);
            stat.setTimestamp(3,new Timestamp(new Date().getTime()));
            stat.setInt(4,100);
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
    public boolean buy(int m){
        try {
            PreparedStatement stat = mysql.getPrepared("update user set money = money - ? where id = ?");

            stat.setInt(1,m);
            stat.setString(2,id);
            System.out.println("to deal"+stat.toString());
            if(stat.executeUpdate()>0)
                return true;
            else
                return false;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    public boolean seal(int m){
        try {
            PreparedStatement stat = mysql.getPrepared("update user set money = money + ? where id = ?");
            stat.setInt(1,m);
            stat.setString(2,id);
            if(stat.executeUpdate()==1)
                return true;
            else
                return false;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    public String checkuser(){
        try{
            PreparedStatement stat = mysql.getPrepared("SELECT id from user WHERE name=? AND pwd=?");
            stat.setString(1,name);
            stat.setString(2,password);
            ResultSet result = stat.executeQuery();
            String r = null;
            if(result.next())
                r =  result.getString("id");
            System.out.println("we get id "+r);
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
