package control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DAO;
import entity.Product;

/**
 * Servlet implementation class loadIndex
 */
@WebServlet("/loadIndex")
public class loadIndex extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			DAO dao = new DAO();
			int index = Integer.parseInt(request.getParameter("index"));
			List<Product> list =null;
			list = dao.getProductbyTypeandIndex("spring", index);
	        PrintWriter out = response.getWriter();
	        
	        for(Product o : list) {
	        	String them="";
	        	if(o.getPid()%4==1) {
	        		them="first";
	        	}
	        	out.println("<li class=\"one_quarter "+them+ "\"><a\r\n"
	        			+ "									href=\"#\"><img src=\""+o.getImage()+"\" alt=\"\"\r\n"
	        			+ "										style=\"height: 250px; width: 250px;\"></a>\r\n"
	        			+ "									<div style=\"margin-top: 10px\">\r\n"
	        			+ "										<a style=\"font-weight: bold;\">Price:"+o.getPrice()+"$</a>\r\n"
	        			+ "										<button class=\"btn\"\r\n"
	        			+ "											style=\"border-radius: 5px; height: 80%; width: 50%; font-size: 12px;\">\r\n"
	        			+ "											<a style=\"color: green;\" href=\"cartControl?pid="+o.getPid()+"\"><strong>+\r\n"
	        			+ "													Add to cart</strong></a>\r\n"
	        			+ "										</button>\r\n"
	        			+ "									</div>\r\n"
	        			+ "									</li>");
	        	
	        }
	      
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
