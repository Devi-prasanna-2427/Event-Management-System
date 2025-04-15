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
            <th>ID</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Email</th>
            <th>Password</th>
            <th>DOB</th>
            <th>Mobile</th>
            <th>Gender</th>
            <th>Location</th>
            <th>Pincode</th>
            <th>Profile</th>
            <th>Status</th>
        </tr>
        <%
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/event", "root", "root");
            PreparedStatement pst = conn.prepareStatement("select * from register");
            ResultSet rs = pst.executeQuery();
            
            while (rs.next()) {
                int id = rs.getInt("id");
                String firstname = rs.getString("firstname");
                String lastname = rs.getString("lastname");
                String email = rs.getString("email");
                String password = rs.getString("password");
                String DOB = rs.getString("DOB");
                Long mobile = rs.getLong("mobile");
                String gender = rs.getString("gender");
                String Loc = rs.getString("Loc");
                String Pincode = rs.getString("Pincode");
                String profile = rs.getString("profile");
                String status = rs.getString("status");
        %>
        <tr>
            <td><%= id %></td>
            <td><%= firstname %></td>
            <td><%= lastname %></td>
            <td><%= email %></td>
            <td><%= password %></td>
            <td><%= DOB %></td>
            <td><%= mobile %></td>
            <td><%= gender %></td>
            <td><%= Loc %></td>
            <td><%= Pincode %></td>
           <td><img src="img/<%= profile %>" alt="Profile Picture" width="200px" height="200px"></td>
            <td> <a href="status.html" ><%= status %></a></td>
          
         
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