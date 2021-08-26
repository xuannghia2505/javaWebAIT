package control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DAO;
import entity.Product;
import entity.cartOder;

/**
 * Servlet implementation class minusProduct
 */
@WebServlet("/changeProduct")
public class changeProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		DAO dao = new DAO();
        HttpSession session = request.getSession();
		List<cartOder> listCO= (List<cartOder>) session.getAttribute("cartoder");
			
		int soP = Integer.parseInt(request.getParameter("soP"));
		int id = Integer.parseInt(request.getParameter("id"));
		
        PrintWriter out = response.getWriter();
        out.println("<strong  id=\"soluong"+id+"\">"+soP+ "</strong>");  
        	for (cartOder o : listCO) {
        		if(o.getId()==id) {											
        				o.setSoluong(soP);						        				 	
        }
        	}
        session.setAttribute("cartoder", listCO);
  
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
