<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>send query</title>
</head>
<body>
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
<div class="form-container">
        <h2>Send Query</h2>
        <form action="sendquery.jsp">
         
            
            
            
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>

             <label for="message">message:</label>
            <input type="text" id="query" name="query" required>
           
            

            <button type="submit">send</button><br><br>
            <a href='customerdashboard.jsp'>back</a>
        </form>
    </div>
<%


String email=request.getParameter("email");

String query=request.getParameter("query");



try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/event","root", "root");
		PreparedStatement pst=	 conn.prepareStatement("insert  into query(email,query) values (?,?)");


		 pst.setString(1, email);
		 pst.setString(2, query);
	
		
		 
			   	 Integer i= pst.executeUpdate();
			   	
		   if(i==1){
			out.println("<script>");
			out.println("alert('query sent Successfully');");
			out.println("window.location.href='viewresponse.jsp';");
			out.println("</script>");
		   }
	   }
	catch (Exception e) {
	// TODO: handle exception
	e.printStackTrace();
}
%>

</body>
</html>