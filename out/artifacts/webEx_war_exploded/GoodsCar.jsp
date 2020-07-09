<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="DBManager.goods" %>
<!DOCTYPE html>
<html lang="zn">
<head>
    <meta charset="UTF-8">
    <title>购物车</title>
    <link rel="stylesheet" href="resources/css/bootstrap.min.css">
    <script>
        function calSum() {
            var items = document.getElementsByClassName("sum");
            var sum = 0;
            for(var i=0;i<items.length;i++){
                sum+=parseFloat(items[i].innerText);
            }
            document.getElementById("sum").innerText=sum.toString();
        }
        function change(id,type) {
            var goal = document.getElementById("id"+id);
            var number = 0;
            if(type==="add")
                number = parseInt(goal.value)+1;
            else
                number = parseInt(goal.value)-1;
            var price = document.getElementById("p"+id).innerText;
            goal.value = number.toString();
            document.getElementById("s"+id).innerText=(number*parseFloat(price)).toString();
            calSum();
        }
    </script>
    <style>
        .sum{
            text-align: center;
        }
        .img{
            height:83px;
            width:121px;
        }
    </style>
</head>
<body>
<div class="container" style="text-align: center">
    <div class="row">
        <div class="offset-md-3">
            <h1>Easier Shopping Easier Life</h1>
            <label id="an" class="announce">通知</label>

            <table border="1">
                <caption>已选商品列表</caption>
                <tr>
                    <td>商品名称</td>
                    <td>单价</td>
                    <td>单位</td>
                    <td>购买数目</td>
                    <td>总价</td>
                </tr>
                <%
                    //String car =(String)request.getParameter("buylist");
                    goods mysql = new goods();
                    String s = session.getAttribute("list").toString();
                    String [] goodkinds = mysql.getPart(s).split(",+");
                    float sum = 0;
                    for(int i=0;i<goodkinds.length;i++){
                        System.out.println(goodkinds[i]);
                        String [] m = goodkinds[i].split("#+");
                        sum+=Float.parseFloat(m[2]);
                        out.print("<tr><td><img class=\"img\" src=\""+m[0]+"\"></td>\n");
                        out.print("<td rowspan=\"2\" id=\"p"+i+"\">"+m[2]+"</td>\n");
                        out.print("<td rowspan=\"2\">"+m[3]+"</td>\n");
                        out.print("<td rowspan=\"2\"><button id=\""+i+"\" onclick=\"change(id,\'dec\')\">-</button>\n");
                        out.print("<input id=\"id"+i+"\" type=\"text\" value=\"1\">\n");
                        out.print("<button id=\""+i+"\" onclick=\"change(id,\'add\')\">+</button></td>\n");
                        out.print("<td rowspan=\"2\"><lable id=\"s"+i+"\" class=\"sum\">"+m[2]+"</label></td>\n");
                        out.print("<tr><td>"+m[1]+"</td></tr\n>");
                    }
                    out.print("<tr><td colspan=\"2\">总价</td>\n");
                    out.print("<td id=\"sum\">"+sum+"</td><td><button>购买</button></td></tr>\n");
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