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
    <h2>Users Info</h2>
    <table>
        <tr>
            <th>EventId</th>
            <th>EventName</th>
            <th>EventDate</th>
            <th>EventLocation</th>
            <th>OrganizerName</th>
            <th>Mobile</th>
            <th>ApplicationFee</th>
            <th>Action</th>
        </tr>
        <%
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/event", "root", "root");
            PreparedStatement pst = conn.prepareStatement("select * from createevent");
            ResultSet rs = pst.executeQuery();
            
            while (rs.next()) {
                int eventid = rs.getInt("eventid");
                String eventname = rs.getString("eventname");
                String eventdate = rs.getString("eventdate");
                String eventlocation = rs.getString("eventlocation");
                String organizername = rs.getString("organizername");
                Long mobile = rs.getLong("mobile");
                String applicationfee = rs.getString("applicationfee");
                
        %>
        <tr>
            <td><%= eventid %></td>
            <td><%= eventname %></td>
            <td><%= eventdate %></td>
            <td><%= eventlocation %></td>
            <td><%= organizername %></td>
            <td><%= mobile %></td>
            <td><%= applicationfee %></td>
            <td>
                <a href="updateEvent.jsp?eventid=<%= eventid %>">Update</a> | 
                <a href="deleteEvent.jsp?eventid=<%= eventid %>" onclick="return confirm('Are you sure you want to delete this event?');">Delete</a>
            </td>
        </tr>
  
        <%
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<tr><td colspan='8' style='color: red;'>Database Error!</td></tr>");
        }
        %>
              <a href='admindashboard.jsp'>back</a>
    </table>
</div>

</body>
</html>
