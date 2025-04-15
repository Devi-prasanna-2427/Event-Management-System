

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 * Servlet implementation class Registercontroller
 */
@MultipartConfig
@WebServlet("/Registercontroller")
public class Registercontroller extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		String firstname=request.getParameter("firstname");
		String lastname=request.getParameter("lastname");
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		String DOB=request.getParameter("DOB");
		String emobile=request.getParameter("mobile");
		long mobile=Long.parseLong(emobile);
		String gender=request.getParameter("gender");
		String Loc=request.getParameter("Loc");
		String pincode=request.getParameter("Pincode");
		int Pincode=Integer.parseInt(pincode);
		Part filepart=request.getPart("Profile");
		
		int id=0;
		
		String fileName=      Paths.get(filepart.getSubmittedFileName()).getFileName().toString();

		String uploadpath=   getServletContext().getRealPath("") + File.separator + "img";
		  
		    File file=new File(uploadpath);
		      if(!file.exists()) 
		   	   file.mkdir();
		   	   String filepath=uploadpath + file.separator + fileName;
		   	   filepart.write(filepath);
		   	   try{
		   		Class.forName("com.mysql.cj.jdbc.Driver");
		   		Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/event","root", "root");
		   		PreparedStatement pst=	 conn.prepareStatement("insert  into register (id,firstname, lastname, email, password, DOB, mobile, gender, Loc, Pincode,Profile,status) values (?,?,?, ?, ?, ?, ?, ?, ?, ?, ?,?)");

		   		pst.setInt(1, id);
		   		 pst.setString(2, firstname);
		   		 pst.setString(3, lastname);
		   		 pst.setString(4, email);
		   		 pst.setString(5, password);
		   		 pst.setString(6, DOB);
		   		 pst.setLong(7, mobile);
		   		 pst.setString(8, gender);
		   		 pst.setString(9, Loc);
		   		 pst.setInt(10, Pincode);
		   		pst.setString(11, fileName);
		   		pst.setString(12, "Waiting");
		   			   	 Integer i= pst.executeUpdate();
		   		   if(i==1){
		   			out.println("<script>");
		   			out.println("alert('Registration Successfull');");
		   			out.println("window.location.href='Login.html';");
		   			out.println("</script>");
		   		   }else{
		   			out.println("<script>");
		   			out.println("alert('Already exists');");
		   			out.println("window.location.href='Register.html';");
		   			out.println("</script>");
		   		   }
		   	   }
		   	catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}

	}

}