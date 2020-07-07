package DBManager;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
import java.util.Date;

public class goodsManager extends HttpServlet{

     public goodsManager(){
         super();
     }
     @Override
     public void doGet(HttpServletRequest request, HttpServletResponse response)throws IOException{
          response.setCharacterEncoding("utf-8");
          String id = request.getParameter("userId");
          StringBuffer r = new StringBuffer();

          try{
              String dbDriver =getServletContext().getInitParameter("dbDriver");
              String dbLink =getServletContext().getInitParameter("dbLink");
              String dbName =getServletContext().getInitParameter("dbName");
              String dbPassword =getServletContext().getInitParameter("dbPassword");
              try{
                  Class.forName(dbDriver);
              }
              catch(Exception e){
                  e.printStackTrace();
              }
              Connection connect = DriverManager.getConnection(dbLink,dbName,dbPassword);
               Statement stat = connect.createStatement();
               ResultSet result = stat.executeQuery("SELECT * FROM goods");
               ResultSetMetaData md = result.getMetaData();
               int l = md.getColumnCount();
               while(result.next()){
                    for(int i=1;i<l;i++){
                        r.append(result.getString(i)+" ");
                    }
                   r.append(result.getString(l)+",");
               }
               stat.close();
               connect.close();
               request.setAttribute("list",r.toString());
               request.getRequestDispatcher("/Market.jsp").forward(request,response);
          }
          catch (SQLException e){
               e.printStackTrace();
          } catch (ServletException e) {
              e.printStackTrace();
          }
     }
}
