<%@ page import="BackEnd.*" %><%--
  Created by IntelliJ IDEA.
  User: Zihao
  Date: 2016/6/12
  Time: 21:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Degree computation</title>
</head>
<body>
<%
    String username1 = request.getParameter("username1");
    String username2 = request.getParameter("username2");
    if( username1 == null || username2 == null){
%>

Enter the names of the users to compute their degree of seperation
<form name="login" method=post onsubmit="return check_all_fields(this)" action="ComputeDegree.jsp">
    Username1: <input type=text name="username1" maxlength="10"> <br>
    Username2: <input type=text name="username2" maxlength="10"> <br>
    <input type=submit>
</form>
<%
} else {
    Connector connector = new Connector();
    ComputeDegree computeDegree = new ComputeDegree();
    int degree = computeDegree.computeDegree(username1, username2, connector.stmt);
%>
<script>
    alert("Degree is " + <%=degree%>);
    location.href = 'Functions.jsp';
</script>
<%
    connector.stmt.close();
    connector.con.close();
    }

%>

<br><br>
<a href="Functions.jsp">Functions.jsp</a><br>
</body>
</html>
