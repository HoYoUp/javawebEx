package DBManager;

import DBManager.DBLink;

import java.sql.*;

public class goods {
    DBLink mysql = new DBLink();
    public String getall() throws SQLException {
        StringBuffer r = new StringBuffer();
        Statement stat = mysql.getState();
        if(stat!=null) {
            ResultSet result = stat.executeQuery("SELECT * FROM goods");
            ResultSetMetaData md = result.getMetaData();
            int l = md.getColumnCount();
            while (result.next()) {
                for (int i = 1; i < l; i++) {
                    r.append(result.getString(i) + "#");
                }
                r.append(result.getString(l) + ",");
            }
            //String m1 = (String) request.getParameter("list");
            stat.close();
            mysql.close();
        }
        return r.toString();
    }
    public String getPart(String s) throws SQLException {
        String [] ids = s.split("\\s+");
        StringBuffer r = new StringBuffer();
        for(int i=0;i<ids.length;i++){
            String sql = "SELECT img,name,price,unit FROM goods WHERE id=?";
            PreparedStatement stat = mysql.getPrepared(sql);
            stat.setString(1,ids[i]);
            ResultSet result = stat.executeQuery();
            ResultSetMetaData md = result.getMetaData();
            int l = md.getColumnCount();
            while(result.next()){
                for(int i1=1;i1<l;i1++){
                    try {
                        r.append(result.getString(i1)+"#");//'#'分割记录的列，标志不应被包含在记录中
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
                try {
                    r.append(result.getString(l)+",");//,分割每条记录,记录中不应
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            result.close();
            stat.close();
        }
        mysql.close();
        return r.toString();
    }
}
