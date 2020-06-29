<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/6/24 0024
  Time: 下午 15:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Welcome Register!</title>
    <script src="resources/js/usercheck.js"></script>
</head>
<body>
<div class="main">
    <label>Welcome To Be A Member Of Our Market</label>
    <form action="userManager.jsp" method="GET" onsubmit="checkRegister()">
        <table border="1">
            <tr>
                <td>请输入用户名</td>
                <td><input id="name" name="name" type="text"></td>
                <td></td>
            </tr>
            <tr>
                <td>请输入密码</td>
                <td><input id="password" name="password" type="password" maxlength="16"></td>
                <td>限长16需包含字母数字字符</td>
            </tr>
            <tr>
                <td>请重复密码</td>
                <td><input id="password1" type="password"></td>
                <td></td>
            </tr>
            <tr>
                <td>请输入手机号</td>
                <td><input id="phone" name="phone" type="text" maxlength="11"></td>
                <td></td>
            </tr>
            <tr>
                <td>验证码</td>
                <td><input id="randCode" name="rand" type="text"></td>
                <td ><img src="randCode"></td>
            </tr>
        </table>
        <input name ="model" type="submit" value="注册">
    </form>
</div>
</body>
</html>
