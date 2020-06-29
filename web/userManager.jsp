<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/6/20 0020
  Time: 上午 9:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="DBManager.Users" %>
<%
    String name = request.getParameter("name");
    String password = request.getParameter("password");
    String model = request.getParameter("model");

    if(model.equals("登录")){
        Users user = new Users(name,password,"");
        String r = user.checkuser();
        if(r!=null){
            session.setAttribute("userId",r);
            response.sendRedirect("Market.jsp");
        }
        else
            response.sendRedirect("index.html");
    }
    else{
        String phone = request.getParameter("phone");
        Users user = new Users(name,password,phone);
        user.adduser();
        response.sendRedirect("index.html");
    }
%>
