<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String email=  request.getParameter("email");
String password=  request.getParameter("password");



try {
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/event","root", "root");
	
	
	
	System.out.print(email);
	System.out.print(password);
	PreparedStatement pst=	 conn.prepareStatement("select *from admin where email='"+email+"' and password='"+password+"'  ");
	 ResultSet rs= pst.executeQuery();	
	 
	 

	 
		 
		
         if(rs.next()) {
        	 
        	String dbusername= rs.getString("email");
        HttpSession httpSession=	request.getSession();
        httpSession.setAttribute("username", dbusername);
       	  response.sendRedirect("admindashboard.jsp");
       	  
         }
         


	
		
		}

 catch (Exception e) {
	// TODO: handle exception
	e.printStackTrace();
}





%>

</body>
</html>