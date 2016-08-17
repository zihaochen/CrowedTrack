<%@ page import="BackEnd.*" %><%--
  Created by IntelliJ IDEA.
  User: Zihao
  Date: 2016/6/10
  Time: 23:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>CrowdTrack</title>
    <script LANGUAGE="javascript">

        function check_all_fields(form_obj){
           // alert(form_obj.username.value+"='"+form_obj.attributeValue.value+"'");
            if(form_obj.password.value == "" || form_obj.username.value == ""){
                alert("Username and password should be nonempty");
                return false;
            }
            return true;
        }

    </script>
</head>

<body>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    if( username == null || password == null){
%>

    Welcome to CrowdTrack!
    <form name="login" method=post onsubmit="return check_all_fields(this)" action="index.jsp">
        Username: <input type=text name="username" maxlength="10"> <br>
        Password: <input type=text name="password" maxlength="10"> <br>
        <input type=submit>
    </form>
    <button type="button" onclick="location = 'Registration.jsp'">Register</button>
    <br><br>
    <button type="button" onclick="location = 'AdminLogin.jsp'">I am the BIG BROTHER</button>

<%
} else {
    Connector connector = new Connector();
    Login login = new Login();
    if (login.checkNamePswd(username, password, connector.stmt)) {
        session.setAttribute("username", username);
        session.setAttribute("password", password);
%>
    <script>
        alert("Login Success");
        location.href = 'Functions.jsp';
    </script>
<%
    }
    else {
%>
    <script>
        alert("Wrong username or password");
        location.href = 'index.jsp';
    </script>
<%
    }

    connector.stmt.close();
    connector.con.close();
}

%>
</body>
</html>
