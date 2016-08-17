<%@ page import="BackEnd.*" %><%--
  Created by IntelliJ IDEA.
  User: Zihao
  Date: 2016/6/12
  Time: 19:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Rate Feedbacks</title>
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
    String fid  = request.getParameter("fid");
    String rating = request.getParameter("rating");
    if (fid == null || rating == null ) {
%>

Please follow the instructions below to record a visit
<form name="rate" method=post onsubmit="return check_all_fields(this)" action="RateFeedback.jsp">
    Fid: <input type=text name="fid" maxlength="10"> <br>
    Rating: <input type=text name="rating" maxlength="10"> (0 = useless, 1 = useful, 2 = very useful )<br>
    <input type=submit>
</form>

<%
} else {
    Connector connector = new Connector();
    RateFeedback rateFeedback = new RateFeedback();
    if (rateFeedback.rateFeedback(session.getAttribute("username").toString(), fid, rating, connector.stmt)) {
%>
<script>
    alert("Add rating success");
    location.href = 'RateFeedback.jsp';
</script>
<%
} else {
%>
<script>
    alert("Add rating failure");
    location.href = 'RateFeedback.jsp';
</script>
<%
        }

        connector.stmt.close();
        connector.con.close();
    }

%>

<br><br>
List of Feedbacks:
<table border="1">
    <tr>
        <th>fid</th>  <th>fbdate</th> <th>pid</th> <th>username</th> <th>text</th>
    </tr>
    <%
        Connector connector = new Connector();
        FeedbackCollector feedbackCollector = new FeedbackCollector();
    %>
    <%= feedbackCollector.listFeedback(connector.stmt) %>

</table>

List of POIs:
<table border="1">
    <tr>
        <th>pid</th>  <th>name</th> <th>address</th> <th>URL</th> <th>telno</th> <th>yearOfEstblsh</th> <th>hourofop</th> <th>price</th> <th>keywords</th> <th>category</th>
    </tr>
    <%
        POICollector poicollector = new POICollector();
    %>
    <%= poicollector.listPOI(connector.stmt) %>

</table>

<br><br>
<a href="Functions.jsp">Functions.jsp</a><br>
</body>
</html>
