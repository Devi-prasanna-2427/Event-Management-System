<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #84fab0, #4FA3D1);
            margin: 0;
            padding: 0;
        }
        .container {
            width: 80%;
            margin: 30px auto;
            padding: 20px;
            background: white;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
            text-align: center;
        }
        h2 {
            color: #007bff;
            text-align: center;
        }
        table {
            width: 80%;
            border-collapse:collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 12px;
            border: 1px solid #000;
            text-align: center;
        }
        th {
            background-color: #007bff;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        img {
            width: 80px;
            height: 80px;
            border-radius: 5px;
        }

</style>
<body>
<center><br><br>
<h1>Booking Details</h1><br><br>
 <table>
        <tr>
            <th>eventid</th>
            <th>eventdate</th>
            <th>eventlocation</th>
            <th>NumberOfAttendees</th>
            <th>email</th>
            <th>status</th>
          
        </tr>
<%@ page import="java.sql.*" %>

<%
    // Get username from session
    String username = (String) session.getAttribute("username");




try {
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/event","root", "root");
	PreparedStatement pst=	 conn.prepareStatement("SELECT * FROM bookevent WHERE email = ?");
	 
  
        pst.setString(1, username);
      
   	 ResultSet rs= pst.executeQuery();	
        while(rs.next()) {
            int eventid = rs.getInt("eventid");
            String eventdate = rs.getString("eventdate");
            String eventlocation = rs.getString("eventlocation");
     int NumberOfAttendees= rs.getInt("NumberOfAttendees");
            String email = rs.getString("email");
            
            String status = rs.getString("status");
%>
          <tr>
            <td><%= eventid %></td>
            <td><%= eventdate %></td>
            <td><%= eventlocation %></td>
            <td><%= NumberOfAttendees %></td>
            <td><%= email %></td>
           
            <td><%= status %></td>
          
         
        </tr>
<%
        } 
    } catch (Exception e) {
        e.printStackTrace();
    } 
%>

</table>
<a href="customerdashboard.jsp">back</a>
</center>
</body>
</html>