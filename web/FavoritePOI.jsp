<%@ page import="BackEnd.*" %><%--
  Created by IntelliJ IDEA.
  User: Zihao
  Date: 2016/6/12
  Time: 18:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Favorite POI</title>
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
    String fvdate  = request.getParameter("fvdate");
    if (pid == null || fvdate == null ) {
%>

Please follow the instructions below to record a visit
<form name="favorite" method=post onsubmit="return check_all_fields(this)" action="FavoritePOI.jsp">
    Pid: <input type=text name="pid" maxlength="10"> <br>
    Favorite date: <input type=text name="fvdate" maxlength="10"> <br>
    <input type=submit>
</form>

<%
} else {
    Connector connector = new Connector();
    FavoritePOI favoritePOI = new FavoritePOI();
    if (favoritePOI.favorite(pid, session.getAttribute("username").toString(), fvdate, connector.stmt)) {
%>
<script>
    alert("Favorite recording success");
    location.href = 'FavoritePOI.jsp';
</script>
<%
} else {
%>
<script>
    alert("favorite recording failure");
    location.href = 'FavoritePOI.jsp';
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
