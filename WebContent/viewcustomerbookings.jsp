<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Users</title>

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
            width: 100%;
            border-collapse: collapse;
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
</head>
<body>

<div class="container">
    <h2>Bookings</h2>
    <table>
        <tr>
            <th>eventid</th>
            <th>eventdate</th>
            <th>eventlocation</th>
            <th>NumberOfAttendees</th>
            <th>email</th>
            <th>status</th>
          
        </tr>
        <%
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/event", "root", "root");
            PreparedStatement pst = conn.prepareStatement("select * from bookevent");
            ResultSet rs = pst.executeQuery();
            
            while (rs.next()) {
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
           
            <td> <a href="action.jsp" ><%= status %></a></td>
          
         
        </tr>
       
        
        <%
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<tr><td colspan='11' style='color: red;'>Database Error!</td></tr>");
        }
        %>
        <a href='admindashboard.jsp'>back</a>
    </table>
</div>

</body>
</html>