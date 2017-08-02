import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.*;

/**
 * Servlet implementation class home
 */
@WebServlet("/home")
public class home extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public home() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		String s1; 
		String url = "jdbc:mysql://localhost:3306/"; 
		   String dbName = "music"; 
		   String driver = "com.mysql.jdbc.Driver"; 
		   String user = "root";  
		   String password = ""; 
		   try{
			   Class.forName(driver).newInstance();
			   Connection con=DriverManager.getConnection(url+dbName,user,password);
			   String q1="SELECT * FROM songs";
			   Statement smt=con.createStatement();
			   ResultSet rs=smt.executeQuery(q1);
			   while(rs.next())
			   {
				  s1=rs.getString("link");
				  out.println(s1);
			   }
		   }
		   
		   catch(Exception e){
			   System.out.println(e);
		   }
		   out.println("<!DOCTYPE html>");
				   out.println("<html><body>");

				   out.println("<audio controls>");
				   	out.println("<source src=\"C:\Users\Ashwin B srivatsa\Music\POP SONGS\01 - All Of Me - DownloadMing.SE_2_1436891909879.mp3 \" type=\"audio/mpeg>\"");
				   	//out.println("<source src="G:\Songs\Dj Snake, Justin Bieber - Let Me Love You.ogg" type="audio/ogg">");
				   out.println("</audio></body></html>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
