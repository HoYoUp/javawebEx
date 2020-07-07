package DBManager;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import DBManager.game24;

import java.io.IOException;

public class game extends HttpServlet{
    public game (){
        super();
    }
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
          String [] num =  new String[4];
          num[0]=request.getParameter("a");
          num[1]=request.getParameter("b");
          num[2]=request.getParameter("c");
          num[3]=request.getParameter("d");
          game24 s = new game24(num);
          String r = s.getSolution();
          response.setCharacterEncoding("utf-8");
          request.getSession().setAttribute("result",r);
          response.sendRedirect("game24.jsp");
    }

}
