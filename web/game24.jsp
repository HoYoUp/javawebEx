<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/6/29 0029
  Time: 下午 16:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
<div>
    <h1>24点小游戏</h1>
    <label>请输入四个数字，我将给出四则运算后等于24的一种解法</label>
    <form action="game" method="get">
        <input name="a" type="text">
        <input name="b" type="text">
        <input name="c" type="text">
        <input name="d" type="text">
        <input type="submit" value="提交">
    </form>
</div>
<label id="output"><%=session.getAttribute("result")%></label>
</body>
</html>
