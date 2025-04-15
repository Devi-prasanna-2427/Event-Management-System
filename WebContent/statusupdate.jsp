<%@page import="java.io.PrintWriter"%>
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
PrintWriter out1=response.getWriter();
String email=	 request .getParameter("email");
try {
	

	 Class.forName("com.mysql.cj.jdbc.Driver");
	 Connection conn=  DriverManager.getConnection("jdbc:mysql://localhost:3306/event","root", "root");			
PreparedStatement pst=	conn.prepareStatement("update  register set status='Authorized' where email='"+email+"' " );
out1.print("hii");
  int i=  pst.executeUpdate();

    if(i==1) {
    	RequestDispatcher r=request.getRequestDispatcher("viewusers.jsp");
    	r.forward(request, response);
          	  
    }


} catch (Exception e) {
	// TODO: handle exception
	e.printStackTrace();
}



%>
</body>
</html>