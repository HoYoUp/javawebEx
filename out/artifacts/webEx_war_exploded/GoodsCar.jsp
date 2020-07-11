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
            var number = 0,v=parseInt(goal.value);
            if(type==="add")
                number = v+1;
            else{
                if(v>0)
                  number = v-1;
                else
                    alert("不能再减了");
            }
            var price = document.getElementById("p"+id).innerText;
            goal.value = number.toString();
            document.getElementById("s"+id).innerText=(number*parseFloat(price)).toString();
            calSum();
        }
        function buy(){
            var inputs = document.getElementsByTagName("input");
            var sums = document.getElementsByTagName("label");
            var sum1 = document.getElementById("sum").innerText;
            var s = "";
            for(var i=0;i<inputs.length;i++){
                s+=inputs[i].value;
                s+=" ";
                s+=sums[i].innerText;
                s+=" "
            }
            console.log("goods numbers ",s);
//            window.location.replace("gManager.jsp?s="+sum1+"&n="+s);
            window.location.replace("gManager.jsp?s="+sum1);
        }
        function isbuy() {
            var isbuy = confirm("确定付款吗？");
            if(isbuy==true){
                 var password = prompt("请输入付款密码");
                alert(password);
            }
            else{
                alert("再想想吧");
            }
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
                    String s = (String)session.getAttribute("list");
                    if(s!=null){
                        goods mysql = new goods();
                        String [] goodkinds = mysql.getPart(s).split(",+");
                        float sum = 0;
                        for(int i=0;i<goodkinds.length;i++){
                            String [] m = goodkinds[i].split("#+");
                            sum+=Float.parseFloat(m[2]);
                            out.print("<tr><td><img class=\"img\" src=\"resources/img/"+m[0]+"\"></td>\n");
                            out.print("<td rowspan=\"2\" id=\"p"+i+"\">"+m[2]+"</td>\n");
                            out.print("<td rowspan=\"2\">"+m[3]+"</td>\n");
                            out.print("<td rowspan=\"2\"><button id=\""+i+"\" onclick=\"change(id,\'dec\')\">-</button>\n");
                            out.print("<input id=\"id"+i+"\" type=\"text\" value=\"1\">\n");
                            out.print("<button id=\""+i+"\" onclick=\"change(id,\'add\')\">+</button></td>\n");
                            out.print("<td rowspan=\"2\"><label id=\"s"+i+"\" class=\"sum\">"+m[2]+"</label></td>\n");
                            out.print("<tr><td>"+m[1]+"</td></tr\n>");
                        }
                        out.print("<tr><td colspan=\"2\">总价</td>\n");
                        out.print("<td id=\"sum\">"+sum+"</td><td>\n");
                        out.print("<button onclick=\"buy()\">购买</button></td></tr>\n");
                    }
                    else{
                        out.print("<tr><td colspan=\"5\">空空如也，去首页看看吧</td></tr>");
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