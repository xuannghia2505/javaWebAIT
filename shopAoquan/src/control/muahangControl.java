package control;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class muahangControl
 */
@WebServlet("/muahangControl")
public class muahangControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();

		out.println(" <form method=\"post\" action=\"loadHome\">\r\n"
				+ "          Name: <input style=\"display: inline; margin-bottom: 10px;\" type=\"text\" name=\"tenKh\"><br>\r\n"
				+ "            Address: <input  style=\"display: inline; margin-bottom: 10px;\" type=\"text\" name=\"diachi\"> <br>\r\n"
				+ "           Nummer: <input  style=\"display: inline; margin-bottom: 10px;\" type=\"text\" name=\"sdt\"> <br>\r\n"
				+ "              Email: <input  style=\"display: inline; margin-bottom: 10px;\" type=\"text\" name=\"email\"> <br>\r\n"
				+ "               <button id=\"btnChotdon\" class=\"btn \">Submit</button>\r\n"
				+ "   </form>");
		
		
	}
	
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
