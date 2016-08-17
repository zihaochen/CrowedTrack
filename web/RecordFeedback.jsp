<%@ page import="BackEnd.*" %><%--
  Created by IntelliJ IDEA.
  User: Zihao
  Date: 2016/6/12
  Time: 19:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Record Feedback</title>
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
    String score = request.getParameter("score");
    String text = request.getParameter("text");
    String fbdate  = request.getParameter("fbdate");
    if (pid == null || score == null || fbdate == null || score == null) {
%>

Please follow the instructions below to record a visit
<form name="RecordFeedback" method=post onsubmit="return check_all_fields(this)" action="RecordFeedback.jsp">
    Pid: <input type=text name="pid" maxlength="10"> <br>
    Score: <input type=text name="score" maxlength="10">(An integer from 0 to 10, 0 = terrible, 10 = excellent) <br>
    Comment: <input type=text name="text" maxlength="50"> <br>
    Feedback date: <input type=text name="fbdate" maxlength="10"> <br>
    <input type=submit>
</form>

<%
} else {
    Connector connector = new Connector();
    RecordFeedback recordFeedback = new RecordFeedback();
    if (recordFeedback.recordFeedback(text, fbdate, pid, session.getAttribute("username").toString(), score, connector.stmt)) {
%>
<script>
    alert("Feedback recording success");
    location.href = 'RecordFeedback.jsp';
</script>
<%
} else {
%>
<script>
    alert("Feedback recording failure");
    location.href = 'RecordFeedback.jsp';
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
