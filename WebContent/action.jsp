<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.servlet.RequestDispatcher"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Status Verification</title>
</head>
<body>
<center>
    <br><br>
    <h1>User Status Verification</h1>
    <form action="action.jsp">
        Event ID: <input type="number" name="id" required>
        <input type="submit" value="Verify"><br><br>
        <a href='viewcustomerbookings.jsp'>Back</a>
    </form>
</center>

<%
PrintWriter out1 = response.getWriter();
String eventidParam = request.getParameter("id");

if (eventidParam != null && !eventidParam.trim().isEmpty()) {
    try {
        int eventid = Integer.parseInt(eventidParam); // Convert to integer

        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/event?useSSL=false&allowPublicKeyRetrieval=true",
            "root",
            "root"
        );

        // Use PreparedStatement with a parameterized query
        PreparedStatement pst = conn.prepareStatement("UPDATE bookevent SET status = 'Accepted' WHERE eventid = ?");
        pst.setInt(1, eventid);

        int i = pst.executeUpdate();

        if (i == 1) {
            RequestDispatcher r = request.getRequestDispatcher("viewcustomerbookings.jsp");
            r.forward(request, response);
        } else {
            out1.println("<p style='color:red;'>Error: No matching event found.</p>");
        }

        pst.close();
        conn.close();
    } catch (NumberFormatException e) {
        out1.println("<p style='color:red;'>Invalid Event ID format.</p>");
    } catch (Exception e) {
        e.printStackTrace();
        out1.println("<p style='color:red;'>An error occurred: " + e.getMessage() + "</p>");
    }
} else {
    out1.println("<p style='color:red;'>Event ID cannot be empty.</p>");
}
%>

</body>
</html>
