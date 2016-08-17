<%@ page import="BackEnd.*" %><%--
  Created by IntelliJ IDEA.
  User: Zihao
  Date: 2016/6/12
  Time: 13:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update POI</title>
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
    String pid = request.getParameter("pid");
    String name = request.getParameter("name");
    String address = request.getParameter("address");
    String URL = request.getParameter("URL");
    String telno = request.getParameter("telno");
    String yearOfEstblsh = request.getParameter("yearOfEstblsh");
    String hourofop = request.getParameter("hourofop");
    String price = request.getParameter("price");
    String keywords = request.getParameter("keywords");
    String category = request.getParameter("category");

    if( name == null || address == null || URL == null || telno == null || yearOfEstblsh == null || hourofop == null || price == null || keywords == null || category == null){
%>

Please following the instructions beolow to complete adding a POI.
<form name="Registration" method=post onsubmit="return check_all_fields(this)" action="UpdatePOI.jsp">
    Pid: <input type=text name="pid" maxlength="10"> <br>
    Name:       <input type=text name="name" maxlength="10"> No more than 50 characters <br>
    Address:    <input type=text name="address" maxlength="10"> No more than 50 characters <br>
    URL:        <input type=text name="URL" maxlength="20"> No more than 50 characters <br>
    Telephone number:   <input type=text name="telno"  maxlength="20"> No more than 15 characters <br>
    Year of establishment:   <input type=text name="yearOfEstblsh"  maxlength="20"> No more than 4 characters <br>
    Hours of operation:   <input type=text name="hourofop"  maxlength="20"> No more than 10 characters <br>
    Price:   <input type=text name="price"  maxlength="20"> No more than 15 characters <br>
    Keywords:   <input type=text name="keywords"  maxlength="20"> No more than 30 characters <br>
    Category: <input type=text name="category" maxlength="15"> No more than 20 characters <br>
    <input type=submit>
</form>

<%
} else {
    Connector connector = new Connector();
    UpdatePOI updatePOI = new UpdatePOI();
    if (updatePOI.updatePOI(pid, name, address, URL, telno, yearOfEstblsh, hourofop, price, keywords, category, connector.stmt)) {
%>
<script>
    alert("POI update success");
    location.href = 'UpdatePOI.jsp';
</script>
<%
} else {
%>
<script>
    alert("POI update failure");
    location.href = 'UpdatePOI.jsp';
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
<a href="AdminFunctions.jsp">AdminFunctions.jsp</a><br>
</body>
</html>
