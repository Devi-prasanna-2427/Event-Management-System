<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Event</title>
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
        }
        h2 {
            color: #007bff;
            text-align: center;
        }
        input[type="text"], input[type="date"], input[type="number"], input[type="tel"], input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Update Event</h2>

    <% 
        String eventIdParam = request.getParameter("eventid");
        int eventid = (eventIdParam != null && !eventIdParam.isEmpty()) ? Integer.parseInt(eventIdParam) : 0;

        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/event", "root", "root");

            if ("GET".equalsIgnoreCase(request.getMethod())) {
                pst = conn.prepareStatement("SELECT * FROM createevent WHERE eventid = ?");
                pst.setInt(1, eventid);
                rs = pst.executeQuery();

                if (rs.next()) {
                    String eventname = rs.getString("eventname");
                    String eventdate = rs.getString("eventdate");
                    String eventlocation = rs.getString("eventlocation");
                    String organizername = rs.getString("organizername");
                    long mobile = rs.getLong("mobile");
                    int applicationfee = rs.getInt("applicationfee");
    %>

    <form action="updateEvent.jsp?eventid=<%= eventid %>" method="post">
        <label for="eventname">Event Name:</label>
        <input type="text" id="eventname" name="eventname" value="<%= eventname %>" required>
        
        <label for="eventdate">Event Date:</label>
        <input type="date" id="eventdate" name="eventdate" value="<%= eventdate %>" required>
        
        <label for="eventlocation">Event Location:</label>
        <input type="text" id="eventlocation" name="eventlocation" value="<%= eventlocation %>" required>
        
        <label for="organizername">Organizer Name:</label>
        <input type="text" id="organizername" name="organizername" value="<%= organizername %>" required>
        
        <label for="mobile">Mobile:</label>
        <input type="tel" id="mobile" name="mobile" value="<%= mobile %>" required>
        
        <label for="applicationfee">Application Fee:</label>
        <input type="number" id="applicationfee" name="applicationfee" value="<%= applicationfee %>" required>
        
        <input type="submit" value="Update Event">
    </form>

    <% 
                }
            } else if ("POST".equalsIgnoreCase(request.getMethod())) {
                String eventname = request.getParameter("eventname");
                String eventdate = request.getParameter("eventdate");
                String eventlocation = request.getParameter("eventlocation");
                String organizername = request.getParameter("organizername");
                long mobile = Long.parseLong(request.getParameter("mobile"));
                int applicationfee = Integer.parseInt(request.getParameter("applicationfee"));

                pst = conn.prepareStatement("UPDATE createevent SET  eventdate = ?  WHERE eventid = ?");
                pst.setString(1, eventdate);
                pst.setInt(2, eventid);

                int rowsAffected = pst.executeUpdate();
                if (rowsAffected > 0) {
                    out.println("<p style='color: green;'>Event updated successfully!</p>");
                    out.println("<a href='Manageevent.jsp'>Go back to event list</a>");
                    
                } else {
                    out.println("<p style='color: red;'>Error updating event!</p>");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<p style='color: red;'>Database error: " + e.getMessage() + "</p>");
        } 
    %>

</div>

</body>
</html>
