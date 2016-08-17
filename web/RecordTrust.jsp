<%@ page import="BackEnd.*" %><%--
  Created by IntelliJ IDEA.
  User: Zihao
  Date: 2016/6/12
  Time: 19:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Trustness recording</title>
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
    String username = request.getParameter("username");
    String isTrusted = request.getParameter("isTrusted");
    if (username == null || isTrusted == null ) {
%>

See the feedbacks below and submit the guy feel uncomfortable with.
<form name="trust" method=post onsubmit="return check_all_fields(this)" action="RecordTrust.jsp">
    User: <input type=text name="username" maxlength="10"> <br>
    Trust or not: <input type=text name="isTrusted" maxlength="10"> (false = untrustful, true = trustful)<br>
    <input type=submit>
</form>

<%
} else {
    if (session.getAttribute("username").toString().equals(username)) {
        %>
        <script>
            alert("Cannot add trustness to yourself");
            location.href = 'RecordTrust.jsp';
        </script>
        <%
        return;
    }
    if (!(isTrusted.equals("true") || isTrusted.equals("FALSE"))) {
        %>
        <script>
            alert("Must type 'true' ot 'false' ");
            location.href = 'RecordTrust.jsp';
        </script>
        <%
        return;
    }
    Connector connector = new Connector();
    RecordTrust recordTrust = new RecordTrust();
    if (recordTrust.recordTrust(session.getAttribute("username").toString(), username, isTrusted, connector.stmt)) {
%>
<script>
    alert("Add trust success");
    location.href = 'RecordTrust.jsp';
</script>
<%
} else {
%>
<script>
    alert("Update trust success");
    location.href = 'RecordTrust.jsp';
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

<br><br>
<a href="Functions.jsp">Functions.jsp</a><br>

</body>
</html>
