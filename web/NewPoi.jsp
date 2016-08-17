<%@ page import="BackEnd.*" %><%--
  Created by IntelliJ IDEA.
  User: Zihao
  Date: 2016/6/12
  Time: 13:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>New POI</title>
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
<form name="Registration" method=post onsubmit="return check_all_fields(this)" action="NewPoi.jsp">
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
        NewPOI newPoi = new NewPOI();
        if (!newPoi.addPOI(name, address, URL, telno, yearOfEstblsh, hourofop, price, keywords, category, connector.stmt)) {
            %>
            <script>
                alert("Add failure: unknown reasons");
                location.href = 'NewPoi.jsp';
            </script>
            <%
        } else {
            %>
            <script>
                alert("Add success");
                location.href = 'AdminFunctions.jsp';
            </script>
            <%
        }
        connector.stmt.close();
        connector.con.close();

    }
%>

<br><br>
<a href="AdminFunctions.jsp">AdminFunctions.jsp</a><br>
</body>
</html>
