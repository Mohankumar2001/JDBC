<%@page contentType="text/html"  language="java"  import="java.sql.*"%>
<html>
<head>
<title>Online Exam Server</title>
<style type="text/css">
 body{background-color:#101010;font-family:Arial, Helvetica, sans-serif;color:#f9fcf5}
</style>
</head>
<body>
<h2 style="text-align:center">Round I results</h2>
<p>
<a href="examclient.html">Back To Operating System Quiz</a>
</p>
<hr/>
<%
int N = 5;
String str[] = new String[N+1];
for(int i=0; i<N; i++)
{
	str[i] = request.getParameter(String.valueOf(i+1));
}
int mark=0;
Class.forName("com.mysql.jdbc.Driver");
Connection
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/testsample","root","Mohan2001");
Statement stmt=con.createStatement();
ResultSet rs=stmt.executeQuery("SELECT * FROM examTab");
while(rs.next())
{
	
	for(int i=1; i<=N; i++)
	{
		String temp = rs.getString(i);
		if(str[i-1].equals(temp)) mark += 5;
	}
 
}
if(mark>=N/2)
{
 out.println("<h4>Your Mark Is : "+mark+"</h4>");
 out.println("<h3>Congratulations....! You Are Eligible For The Next Round...</h3>");
 out.println("<h3><a href=examclient2.html>Click here to attempt next round</a></h3>");
}
else
{
 out.println("<h4>Your Mark is : "+mark+"</h4>");
 out.println("<h3>Sorry....!! You Are Not Eligible For The Next Round...</h3>");
}
%>
</body>
</html>