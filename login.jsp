<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ page import = "java.sql.*"  %>
<%@ page import = "javax.sql.*" %>
<% 
String userid = request.getParameter("uname");
session.putValue("userid",userid);
String pwd =request.getParameter("psw");
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/login","root","");
Statement st =con.createStatement();
ResultSet rs =st.executeQuery("select *from userdetails where username='"+userid+"'");
if(rs.next())
{
	if(rs.getString(2).equals(pwd))
	{
		out.println("WElCOME ");
		String redirectURL = "http://localhost:8080/please/signup.html";
	    response.sendRedirect(redirectURL);
	}
	else
		out.println("ff");
}
%>
</body>
</html>
