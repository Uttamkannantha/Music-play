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
String pwd =request.getParameter("psw");


Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/login","root","");
Statement st =con.createStatement();
ResultSet rs =st.executeQuery("select *from userdetails where username='"+userid+"'");
while(rs.next())
{
	if(rs.getString("password").equals(pwd) )
	{
		out.println("WElCOME ");
		session.setAttribute("name",userid);
		String redirectURL1 = "http://localhost:8080/j2eeproj/home.jsp";
	    response.sendRedirect(redirectURL1);
	}
	else{
		out.println("user details incorrect");
		String redirectURL2 = "http://localhost:8080/j2eeproj/signup.html";
    	response.sendRedirect(redirectURL2);
	}
}
%>
</body>
</html>
