<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/6/22 0022
  Time: 下午 16:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="DBManager.DBLink" import="DBManager.goods"%>
<html>
<head>
    <meta>
    <title>Easy Market</title>
    <link rel="stylesheet" href="resources/css/boot1.min.css">
   
    <script>

    </script>
    <style>
        .img{
            height:83px;
            width:121px;
        }
        .announce{
            font-size: 20px;
            text-align: center;
        }

        .tabcap{
            caption-side: top;
        }
    </style>
</head>

<body>
<div class="container-fluid">
    <div class="row basictext">
        <div class="offset-md-4">
            <h2>易购让生活更便利</h2>
            <div class="row">
                <%
                    if(session.getAttribute("userId")!=null){
                        out.print("<a href=\"GoodsCar.jsp\">我的购物车 </a>");
                        out.print("<a href=\"user.jsp\">个人中心</a>");
                    }
                    else
                        out.print("<a href=\"login.html\">登录</a>");
                %>
            </div>
            <div class="row">
                <label id="an" class="announce">系统：目前余额为虚拟货币</label>
            </div>
            <table border="1">
                <caption class="tabcap">商品列表</caption>
                <tr>
                    <td>谷物</td>
                    <td>水果</td>
                </tr>
            </table>
            <table border="1">
                    <caption class="tabcap">详细列表</caption>
                    <%--<tr>--%>
                        <%--<td>排序</td>--%>
                        <%--<td><button onclick="order(1)">销量</button></td>--%>
                        <%--<td><button onclick="order(2)">剩余量</button></td>--%>
                        <%--<td colspan="2">从高到低</td>--%>
                    <%--</tr>--%>
                    <tr>
                        <td>商品名称</td>
                        <td>发布人</td>
                        <td>介绍</td>
                        <td>单价</td>
                        <td>单位</td>
                    </tr>
                    <%
                         goods mysql = new goods();
                         String[] goodkinds = mysql.getall().split(",+");
                         for (int i = 0; i < goodkinds.length; i++) {
                             String[] m = goodkinds[i].split("#+");
                             out.print("<tr><td><img class=\"img\"src=\"resources/img/"+ m[4] +"\"></td>\n");
                             out.print("<td rowspan=\"2\">" + m[1] + "</td>\n");
                             out.print("<td rowspan=\"2\">" + m[5] + "</td><td rowspan=\"2\">" + m[2] + "</td>\n");
                             out.print("<td rowspan=\"2\">" + m[3] + "</td>\n");
                             out.print("<td rowspan=\"2\"><button><a href=\"gManager.jsp?id="+m[6].toString()+"\">BUY</a></button></td></tr>\n");
                             out.print("<tr><td>" + m[0] + "</td></tr>\n");
                         }
                    %>
            </table>
            <div>
                <label>Write By ZB </label>
            </div>

        </div>
    </div>

</div>



</body>

</html>