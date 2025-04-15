<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Responses</title>

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
    </style>
</head>
<body>

<div class="container">
    <h2>Responses to Queries</h2>
    <table>
        <tr>
            <th>Email</th>
            <th>Query</th>
            <th>Response</th>
        </tr>
        <%
        String username = (String) session.getAttribute("username");
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/event", "root", "root");
                PreparedStatement pst = conn.prepareStatement("SELECT * FROM query where email='"+username+"'");
                ResultSet rs = pst.executeQuery();

                while (rs.next()) {
                    String email = rs.getString("email");
                    String query = rs.getString("query");
                    String responses= rs.getString("responses");

                    // If response is NULL, display "No response yet"
                    if (responses == null || responses.trim().isEmpty()) {
                        responses = "<span style='color: red;'>No response yet</span>";
                    }
        %>
        <tr>
            <td><%= email %></td>
            <td><%= query %></td>
            <td><%= responses %></td>
        </tr>
        <%
                }
                conn.close();
            } catch (Exception e) {
                e.printStackTrace();
                out.println("<tr><td colspan='3' style='color: red;'>Database Error!</td></tr>");
            }
        %>
    </table>
</div>

</body>
</html>
