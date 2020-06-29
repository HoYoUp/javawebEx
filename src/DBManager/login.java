package DBManager;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
import java.util.Date;

public class login extends HttpServlet {

     private static final long serialVersionUID = 1L;

     public login() {
        super();
      }
      @Override
      public void doGet(HttpServletRequest request, HttpServletResponse response)throws IOException{
         request.setCharacterEncoding("utf-8");
         response.setCharacterEncoding("utf-8");
          Connection connect =null;
          try{
              String dbDriver =getServletContext().getInitParameter("dbDriver");
              String dbLink =getServletContext().getInitParameter("dbLink");
              String dbName =getServletContext().getInitParameter("dbName");
              String dbPassword =getServletContext().getInitParameter("dbPassword");
              try{
                  Class.forName(dbDriver);
                  connect = DriverManager.getConnection(dbLink,dbName,dbPassword);
              }
              catch (Exception e){
                  e.printStackTrace();
              }
              PreparedStatement stat = connect.prepareStatement("SELECT * from user WHERE name=? AND pwd=?");
              String name = request.getParameter("name");
              String password = request.getParameter("password");
              stat.setString(1,name);
              stat.setString(2,password);
              ResultSet result = stat.executeQuery();
              String id = "";
              while(result.next()){
                  id = result.getString(1);
              }
              stat.close();
              result.close();
              connect.close();
              if(id!=""){
                 // response.sendRedirect("goodsManager?userId="+id);
                  response.sendRedirect("Market.jsp");
              }
              else {
                  response.sendRedirect("index.html");
              }

          }
          catch (SQLException e){
              e.printStackTrace();
          }
      }

      @Override
      public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
           doGet(request,response);
      }

}
