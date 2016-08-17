<%@ page import="BackEnd.*" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: Zihao
  Date: 2016/6/12
  Time: 13:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Visit</title>
</head>
<body>


<%
    if (session.getAttribute("username") == null) {
%>
<script>
    alert("Login first");
    location.href = 'index.jsp';
</script>
<%
    }
%>

<%
    String pid  = request.getParameter("pid");
    String date  = request.getParameter("date");
    String cost  = request.getParameter("cost");
    String numberofheads = request.getParameter("numberofheads");
    if (pid == null || date == null || cost == null || numberofheads == null) {
%>

Please follow the instructions below to record a visit
<form name="visit" method=post onsubmit="return check_all_fields(this)" action="Visit.jsp">
    Pid: <input type=text name="pid" maxlength="10"> <br>
    Visiting date: <input type=text name="date" maxlength="10"> <br>
    Cost: <input type=text name="cost" maxlength="10"> <br>
    Number of heads: <input type=text name="numberofheads" maxlength="10"> <br>
    <input type=submit>
</form>

<%
} else {
    Connector connector = new Connector();
    Visit visitInstance = new Visit();
    if (visitInstance.visitPOI(session.getAttribute("username").toString(), pid, date, cost, numberofheads, connector)) {
        %>
        <script>
            alert("Visit recording success");
            location.href = 'Visit.jsp';
        </script>
        <%
    } else {
        %>
        <script>
            alert("Visit recording failure");
            location.href = 'Visit.jsp';
        </script>
        <%
      }

        connector.stmt.close();
        connector.con.close();
    }

%>


List of POIs:
<table border="1">
    <tr>
        <th>pid</th>  <th>name</th> <th>address</th> <th>URL</th> <th>telno</th> <th>yearOfEstblsh</th> <th>hourofop</th> <th>price</th> <th>keywords</th> <th>category</th>
    </tr>
    <%
        Connector connector = new Connector();
        POICollector poicollector = new POICollector();
    %>
        <%= poicollector.listPOI(connector.stmt) %>

</table>

<br><br>
<a href="Functions.jsp">Functions.jsp</a><br>
</body>
</html>
