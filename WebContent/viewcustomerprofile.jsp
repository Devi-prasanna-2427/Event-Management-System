<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Profile</title>
<style>
.profile {
  width: 50%;
  margin: 50px auto;
  border: 2px solid #ccc;
  padding: 20px;
  text-align: center;
}
h1{
text-align:center;
}

</style>
</head>
<body>
<center>
<h1>profile</h1>
<table border="2" align="center">
<%
    // Get username from session
    String username = (String) session.getAttribute("username");

   // if (username == null) {
    //    out.println("No user logged in.");
     //   return;
  //  }

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/event", "root", "root");
        PreparedStatement pst = conn.prepareStatement("SELECT * FROM register WHERE email = ?");
        pst.setString(1, username);
        ResultSet rs = pst.executeQuery();

        if (rs.next()) {
            String profile = rs.getString("profile"); // Get image filename
%>
<tr>
                                    <td rowspan="9" colspan="20" class="profile-pic">
                                        <img src="<%= "img/" + rs.getString("profile") %>" alt="Profile Picture" width="100px" height="100px" >
                                    </td>
                                </tr>
                                <tr><th>Firstname</th><td><%= rs.getString("firstname") %></td></tr>
                                <tr><th>Lastname</th><td><%= rs.getString("lastname") %></td></tr>
                                <tr><th>Email</th><td><%= rs.getString("email") %></td></tr>
                                <tr><th>password</th><td><%= rs.getString("password") %></td></tr>
                                <tr><th>DOB</th><td><%= rs.getString("dob") %></td></tr>
                                <tr><th>mobile</th><td><%= rs.getString("mobile") %></td></tr>
                                <tr><th>location</th><td><%= rs.getString("loc") %></td></tr>
                                <tr><th>Pincode</th><td><%= rs.getString("pincode") %></td></tr>
                                
<%
        } else {
            out.println("User not found.");
        }
        rs.close();
        pst.close();
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
</table><br>
<a href="customerdashboard.jsp">back</a>
</center>
</body>
</html>