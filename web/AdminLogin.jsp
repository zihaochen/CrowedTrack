<%@ page import="BackEnd.*" %><%--
  Created by IntelliJ IDEA.
  User: Zihao
  Date: 2016/6/12
  Time: 13:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>BIG BROTHER Login Page</title>
</head>
<body>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    if( username == null || password == null){
%>

BIG BROTHER Login Page
<form name="login" method=post onsubmit="return check_all_fields(this)" action="AdminLogin.jsp">
    Username: <input type=text name="username" maxlength="10"> <br>
    Password: <input type=text name="password" maxlength="10"> <br>
    <input type=submit>
</form>

<%
} else {
    if (username.equals("admin") && password.equals("admin")) {
        session.setAttribute("username", username);
        session.setAttribute("password", password);
%>
    <script>
        alert("Login Success");
        location.href = 'AdminFunctions.jsp';
    </script>
<%
}
else {
%>
    <script>
        alert("Wrong username or password");
        location.href = 'AdminLogin.jsp';
    </script>
<%
        }
    }

%>
</body>
</html>
