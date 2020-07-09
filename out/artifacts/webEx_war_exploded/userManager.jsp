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
    String pwd0 = request.getParameter("pwd");
    int l = pwd0.length()-2;
	char [] m = new char[l];
	char f='0';
	int i = Integer.parseInt(pwd0.substring(pwd0.length()-1));
	for(int c=0;c<pwd0.length()-1;c++){
		if(f=='0'){
			if(c==i){
				f='1';
				continue;
			}
			else
				m[c]=pwd0.charAt(c);
		}
		else
			m[c-1]=pwd0.charAt(c);
	}
	String pwd = m.toString();
    String model = request.getParameter("model");
    String code = request.getParameter("cc");
    String reference =(String)session.getAttribute("picCode");
     f = '0';
    if(code.equals(reference)){         //验证随机码
        if(model.equals("登录")){
            Users user = new Users(name,pwd,"");
            String r = user.checkuser();
            if(r!=null){
                session.setAttribute("userId",r);
                f='1';
            }
        }
        else{
            String phone = request.getParameter("phone");
            Users user = new Users(name,pwd,phone);
            user.adduser();
        }
    }
    if(f=='0')
		response.sendRedirect("index.jsp");
        
    else if(f=='1')
        response.sendRedirect("login.html");
    session.removeAttribute("picCode");
%>
