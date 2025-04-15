<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>

<%
    String email = request.getParameter("email");
    String query = request.getParameter("query");
    String responses = request.getParameter("responses");

    if (email != null && query != null && responses != null) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/event", "root", "root");

            // Update response in the database
            PreparedStatement pst = conn.prepareStatement("UPDATE query SET responses = ? WHERE email = ? AND query = ?");
            pst.setString(1, responses);
            pst.setString(2, email);
            pst.setString(3, query);
            
            int updated = pst.executeUpdate();
            
            conn.close();

            if (updated > 0) {
                out.println("<script>alert('Response updated successfully!'); window.location='viewquery.jsp';</script>");
            } else {
                out.println("<script>alert('Failed to update response!'); window.location='viewquery.jsp';</script>");
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<script>alert('Database error!'); window.location='viewquery.jsp';</script>");
        }
    } else {
        out.println("<script>alert('Invalid input!'); window.location='viewquery.jsp';</script>");
    }
%>
