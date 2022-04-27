<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%!
 Connection con;
 PreparedStatement ps1=null, ps2=null;
 public void jspInit()
 {
 try
 {
  Class.forName("com.mysql.jdbc.Driver");
 con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/testsample","root","Mohan2001");
  ps1 = con.prepareStatement("select count(*) from USERS where username = ? and password=?");
 ps2 = con.prepareStatement("select * from USERS");
 System.out.println("try is executed ");
 }
 catch(Exception ex)
 {
	 System.out.println("catch is executed ");
 ex.printStackTrace();
}
 }
%>
<%
 String param = request.getParameter("s1");
 if(param =="link")
 {
 ResultSet rs = ps2.executeQuery();
 out.println("<table>");
 while(rs.next())
 {
 out.println("<tr>");
 out.println("<td>"+rs.getString(1)+"</td>");
 out.println("<td>"+rs.getString(2)+"</td");
 out.println("</tr>");
 }
 out.println("</table>");
 rs.close();
 }
 else
 {
 String user = request.getParameter("uname");
 String pass = request.getParameter("pass");
 out.println(con);
 //set form data as param value
 ps1.setString(1,user);
 ps1.setString(2,pass);
 //excute the query
 ResultSet rs = ps1.executeQuery();
 int cnt = 0;
 if (rs.next())
 cnt = rs.getInt(1);
 if(cnt == 0)
 out.println("<b><i><font color=red>Invalid credential</fonr></i></b>");
 else
 {
 out.println("<form><fieldset style= width:25%; >");
 out.println("<b><i><font color=red>valid credential..</fonr></i></b><br>");
 out.println("<b><i><a href=examclient.html><font size=6 color=blue>Click Here to take test</font></i></a></b>");
 out.println("</fieldset></form>");
 }
 }
%>
<%!
 public void jspDestroy()
 {
 try
 {
 //colse
ps1.close();
 ps2.close();
 con.close();
 }
 catch(Exception ex)
 {
 ex.printStackTrace();
 }
 }
%>