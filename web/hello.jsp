<%--
  Created by IntelliJ IDEA.
  User: Zihao
  Date: 2016/6/9
  Time: 23:02
  To change this template use File | Settings | File Templates.
--%>

<%  
    String name = request.getParameter( "username" );
    session.setAttribute( "theName", name );
%>

<HTML>
<BODY>
<%
    // This scriptlet declares and initializes "date"
    System.out.println( "Evaluating date now" );
    java.util.Date date = new java.util.Date();
    int n = 11;
%>
Hello!  The time is now
<%
    out.println( date );
    out.println( "<BR>Your machine's address is " );
    out.println( request.getRemoteHost());
%>
<TABLE BORDER=2>
    <%
        for ( int i = 0; i < n; i++ ) {
    %>
    <TR>
        <TD>Number</TD>
        <TD><%= i+1 %></TD>
    </TR>
    <%
        }
    %>
</TABLE>
Hello, <%= session.getAttribute( "theName" ) %>
</BODY>
</HTML>
