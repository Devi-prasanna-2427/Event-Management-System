<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Event</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #84fab0, #4FA3D1);
            margin: 0;
            padding: 0;
        }
        .container {
            width: 50%;
            margin: 50px auto;
            padding: 20px;
            background: white;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
            text-align: center;
        }
        h2 {
            color: #007bff;
        }
        p {
            font-size: 16px;
        }
        a {
            color: #007bff;
            text-decoration: none;
            font-weight: bold;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Delete Event</h2>

    <%
        String eventid = request.getParameter("eventid");
        try {
            // Establish DB connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/event", "root", "root");

            // Delete event from the database
            PreparedStatement pstDelete = conn.prepareStatement("delete from createevent where eventid = ?");
            pstDelete.setInt(1, Integer.parseInt(eventid));
            int rowsAffected = pstDelete.executeUpdate();

            if (rowsAffected > 0) {
                out.println("<p style='color: green;'>Event deleted successfully!</p>");
                out.println("<a href='Manageevent.jsp'>Go back to event list</a>");
            } else {
                out.println("<p style='color: red;'>Error deleting event!</p>");
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<p style='color: red;'>Database error!</p>");
        }
    %>

</div>

</body>
</html>
