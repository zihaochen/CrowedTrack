<%@ page import="BackEnd.*" %><%--
  Created by IntelliJ IDEA.
  User: Zihao
  Date: 2016/6/12
  Time: 21:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Awards</title>
</head>
<body>
<%
    String number = request.getParameter("m");
    if( number == null){
%>

<form name="award" method=post onsubmit="return check_all_fields(this)" action="UserAwards.jsp">
    Number m: <input type=text name="m" maxlength="10"> <br>
    <input type=submit>
</form>

<%
} else {
    Connector connector = new Connector();
    int m = Integer.parseInt(number);
    UserAward userAward = new UserAward();
    String trustList = userAward.topTrusted(m, connector.stmt);
    String usefulList = userAward.topUseful(m, connector.stmt);
%>
<br><br>
Top <%=m%> trusted usernames: <br>
<%=trustList%>

Top <%=m%> usefull usernames: <br>
<%=usefulList%>

<br><br>

<a href="UserAwards.jsp">Back</a><br>

<%
    connector.stmt.close();
    connector.con.close();
    }
%>
<br><br>
<a href="AdminFunctions.jsp">Functions.jsp</a><br>
</body>
</html>
