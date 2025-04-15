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
String id=request.getParameter("id");
Integer eventid=Integer.parseInt(id);
String eventname=request.getParameter("name");
String eventdate=request.getParameter("date");
String eventlocation=request.getParameter("location");
String organizername=request.getParameter("oname");

String contact =request.getParameter("contact");
Long mobile=Long.parseLong(contact);

String fee=request.getParameter("fee");
int applicationfee=Integer.parseInt(fee);

try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/event","root", "root");
		PreparedStatement pst=	 conn.prepareStatement("insert  into createevent(eventid,eventname,eventdate,eventlocation,organizername,mobile,applicationfee) values (?,?,?,?,?,?,?)");

		pst.setInt(1, eventid);
		 pst.setString(2, eventname);
		 pst.setString(3, eventdate);
		 pst.setString(4, eventlocation);
		 pst.setString(5, organizername);
		 pst.setLong(6, mobile);
		 pst.setInt(7, applicationfee);
		 
			   	 Integer i= pst.executeUpdate();
		   if(i==1){
			out.println("<script>");
			out.println("alert('create event Successfull');");
			out.println("window.location.href='admindashboard.jsp';");
			out.println("</script>");
		   }
	   }
	catch (Exception e) {
	// TODO: handle exception
	e.printStackTrace();
}
%>

</body>
</html>