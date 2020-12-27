<%-- 
    Document   : Action
    Created on : 19 Nov, 2020, 11:15:42 AM
    Author     : WELCOME
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.*" %>
<%@page import="javax.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <% String msg,name,grp1,seat;
        int total=0;
        Connection connect;
        Class.forName("org.apache.derby.jdbc.ClientDriver");
        connect=DriverManager.getConnection("jdbc:derby://localhost:1527/A","a","a");
        msg="thanks";
        seat=request.getParameter("seat_no");
        name=request.getParameter("name");
        grp1=request.getParameter("rd1");
        if(grp1 .equals("18"))
        {
        total+=20;
        }
        PreparedStatement st=connect.prepareStatement("INSERT INTO A.EXAM(SEAT_NO,NAME,TOTAL)VALUES('"+seat+"','"+name+"','"+total+"')");
        st.executeUpdate();
        out.println("<html>");
out.println("<head>");
out.println("</head>");
out.println("<body bgcolor=cyan>");
out.println("<center>");
out.println("<h1>"+msg+"</h1>\n");
out.println("<h3>Yours results stored in our database</h3>");
out.print("<br><br>");
out.println("<b>"+"Participants and their Marks"+"</b>");
out.println("<table border=5>");
PreparedStatement st2=connect.prepareStatement("SELECT * FROM A.EXAM");
ResultSet rs=st2.executeQuery();
out.println("<th>"+"Seat_no"+"</th>");
out.println("<th>"+"Name"+"</th>");
out.println("<th>"+"Marks"+"</th>");
while(rs.next())
{
out.println("<tr>");
out.print("<td>"+rs.getString(1)+"</td>");

out.print("<td>"+rs.getString(2)+"</td>");
out.print("<td>"+rs.getString(3)+"</td>");
out.println("</tr>");
}
out.println("</table>");
if(rs!=null)
rs.close();
if(st!=null)
st.close();
if(connect!=null)
connect.close();
out.println("</center>");
out.println("</body></html>");
 total=0;
%>
        
       
        
 
        
        
        
    </body>
</html>
