package control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DAO;
import entity.cartOder;

/**
 * Servlet implementation class deleteP
 */
@WebServlet("/deleteP")
public class deleteP extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DAO dao = new DAO();
        HttpSession session = request.getSession();
		List<cartOder> listCO= (List<cartOder>) session.getAttribute("cartoder");
		int dem=0;
		int id = Integer.parseInt(request.getParameter("id"));
		String del=request.getParameter("deleteL");
		System.out.println(id);
		System.out.println(listCO);
		for (cartOder o : listCO) {
			if(o.getId()==id) {
				listCO.remove(dem);
				break;
			}
			else {
				dem++;
				
			}
			
		}
		
		session.setAttribute("sohangOder", listCO.size());
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
