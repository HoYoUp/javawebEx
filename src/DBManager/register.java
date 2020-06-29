package DBManager;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
import java.util.Date;

public class register extends HttpServlet {

    private static final long serialVersionUID = 1L;
    Connection connect = null;
    @Override
    public void init() throws ServletException{
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
    }
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response){
        try{
            PreparedStatement stat = connect.prepareStatement("insert into user VALUES (?,?,?,?)");
            String name = request.getParameter("name");
            String password = request.getParameter("password");
            stat.setString(2,name);
            stat.setString(3,password);
            stat.setTimestamp(4,new Timestamp(new Date().getTime()));
            int i = stat.executeUpdate();
            stat.close();

            connect.close();
        }
        catch (SQLException e){
            e.printStackTrace();
        }
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response){
        doGet(request,response);
    }

}
