<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Queries</title>

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
        input[type="text"] {
            width: 90%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        button {
            padding: 8px 15px;
            border: none;
            background-color: #007bff;
            color: white;
            border-radius: 5px;
            cursor: pointer;
        }
        button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Queries</h2>
   
        <table>
            <tr>
          
                <th>Email</th>
                <th>Query</th>
                <th>Response</th>
                <th>Action</th>
            </tr>
            <%
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/event", "root", "root");
                    PreparedStatement pst = conn.prepareStatement("SELECT * FROM query");
                    ResultSet rs = pst.executeQuery();
                    
                    while (rs.next()) {
                        String email = rs.getString("email");
                        String query = rs.getString("query");
                        String responses = rs.getString("responses"); // Assuming "responses" column exists in the database
            %>
           <tr>
    <form action="updateResponse.jsp" method="post">
        <td><%= email %></td>
        <td><%= query %></td>
        <td>
            <input type="hidden" name="email" value="<%= email %>">
            <input type="hidden" name="query" value="<%= query %>">
            <input type="text" name="responses" value="<%= responses != null ? responses : "" %>" placeholder="Enter response">
        </td>
        <td>
            <button type="submit">Submit</button>
        </td>
    </form>
</tr>
            <%
                    }
                    conn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                    out.println("<tr><td colspan='4' style='color: red;'>Database Error!</td></tr>");
                }
            %>
        </table>
    </form>
</div>

</body>
</html>
