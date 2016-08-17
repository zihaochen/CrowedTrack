<%@ page import="BackEnd.*" %>
<%@ page import="BackEnd.Registration" %>
<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: Zihao
  Date: 2016/6/11
  Time: 12:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Registration</title>
    <script LANGUAGE="javascript">

        function check_all_fields(form_obj){
            //alert(form_obj.searchAttribute.value+"='"+form_obj.attributeValue.value+"'");
            if( form_obj.username.value == "" || form_obj.password == "" || form_obj.fullname == "" || form_obj.address == "" || form_obj.phoneno == ""){
                alert("Everything should be nonempty");
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
    String fullname = request.getParameter("fullname");
    String address  = request.getParameter("address");
    String phoneno = request.getParameter("phoneno");
    if( username == null || password == null || fullname == null || address == null || phoneno == null){
%>

Please following the instructions beolow to complete registraion.
<form name="Registration" method=post onsubmit="return check_all_fields(this)" action="Registration.jsp">
    Username:  <input type=text name="username" maxlength="10"> No more than 10 characters <br>
    Password:  <input type=text name="password" maxlength="10"> No more than 10 characters <br>
    Full name: <input type=text name="fullname" maxlength="20"> No more than 20 characters <br>
    Address:   <input type=text name="address"  maxlength="20"> No more than 20 characters <br>
    Telephone number: <input type=text name="phoneno" maxlength="15"> No more than 15 characters <br>
    <input type=submit>
</form>

<%
    } else {

    session.setAttribute("phoneno", phoneno);
    session.setAttribute("address", address);
    session.setAttribute("fullname", fullname);
    session.setAttribute("username", username);
    session.setAttribute("password", password);

    Connector connector = new Connector();
    Registration registration = new Registration();
    if (!registration.register(username, password, fullname, address, phoneno, connector.stmt)) {
        %>
        <script>
            alert("Username occupied");
            location.href = 'Registration.jsp';
        </script>
        <%
    } else {
    %>
        <script>
        alert("Registration Success");
        location.href = 'index.jsp';
        </script>
    <%
    }
        connector.stmt.close();
        connector.con.close();

    }
%>

<br><br>
<a href="Functions.jsp">Functions.jsp</a><br>
</body>
</html>
