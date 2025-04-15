<%@page import="java.sql.*"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    margin: 0;
}

.form-container {
    background: white;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    width: 300px;
    text-align: center;
}

h2 {
    margin-bottom: 20px;
}

form {
    display: flex;
    flex-direction: column;
}

label {
    text-align: left;
    margin-top: 10px;
}

input {
    padding: 8px;
    margin-top: 5px;
    border: 1px solid #ccc;
    border-radius: 4px;
}

button {
    margin-top: 15px;
    padding: 10px;
    background: #28a745;
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

button:hover {
    background: #218838;
}
</style>
</head>
<body>

<div class="form-container">
    <h2>Create Event Form</h2>
    <form action="bookevent.jsp" method="POST">
        <label for="event-id">Event Id:</label>
        <input type="text" id="event-id" name="id" required>
        
        <label for="event-date">Event Date:</label>
        <input type="date" id="event-date" name="date" required>

        <label for="event-location">Event Location:</label>
        <input type="text" id="event-location" name="location" required>

        <label for="attendees">Attendees:</label>
        <input type="number" id="attendees" name="attendees" required>

        <label for="email">Registered Email:</label>
        <input type="text" id="email" name="email" required>

        <button type="submit">Book Event</button>
    </form>
    <br>
    <a href='customerdashboard.jsp'>Back</a>
</div>

<%
String eventid = request.getParameter("id");
String eventdate = request.getParameter("date");
String eventlocation = request.getParameter("location");
String numberOfAttendeesStr = request.getParameter("attendees");
String email = request.getParameter("email");

if (eventid != null && numberOfAttendeesStr != null && !eventid.trim().isEmpty() && !numberOfAttendeesStr.trim().isEmpty()) {
    try {
        int eventId = Integer.parseInt(eventid.trim());
        int numberOfAttendees = Integer.parseInt(numberOfAttendeesStr.trim());

        HttpSession session2 = request.getSession();
        session2.setAttribute("username", email);
        session2.setAttribute("id", eventid);

        Class.forName("com.mysql.cj.jdbc.Driver");

        try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/event", "root", "root");
             PreparedStatement pst = conn.prepareStatement("INSERT INTO bookevent(eventid, eventdate, eventlocation, NumberOfAttendees, email, status) VALUES (?, ?, ?, ?, ?, ?)")) {

            pst.setInt(1, eventId);
            pst.setString(2, eventdate);
            pst.setString(3, eventlocation);
            pst.setInt(4, numberOfAttendees);
            pst.setString(5, email);
            pst.setString(6, "pending");

            int i = pst.executeUpdate();
            if (i == 1) {
                out.println("<script>");
                out.println("alert('Event booking successful!');");
                out.println("window.location.href='customerdashboard.jsp';");
                out.println("</script>");
            } else {
                out.println("<script>alert('Event booking failed. Please try again.');</script>");
            }
        }
    } catch (NumberFormatException e) {
        out.println("<script>alert('Invalid input: Event ID and Attendees must be numbers.');</script>");
    } catch (Exception e) {
        out.println("<script>alert('Error: " + e.getMessage() + "');</script>");
        e.printStackTrace();
    }
} else {
    out.println("<script>alert('Please fill in all fields correctly.');</script>");
}
%>

</body>
</html>
