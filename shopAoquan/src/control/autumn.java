package control;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DAO;
import entity.Product;

/**
 * Servlet implementation class autumn
 */
@WebServlet("/autumn")
public class autumn extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DAO dao = new DAO();
		List<Product> listP = new  ArrayList<>();
		int index=Integer.parseInt(request.getParameter("autumnIndex"));
		listP= dao.getAllProductbyTypeandIndex("autumn",index);
		
		//pagination
		int soSanpham = dao.countProductbyName("autumn");
		int soProducts= dao.countProductbyName("autumn");
		int soPage=soProducts/8;
		if(soProducts%8!=0) {
			soPage++;
		}
		int tag = index;
		
		request.setAttribute("tag", index);
		request.setAttribute("soPage", soPage);
		request.setAttribute("soSanpham", soSanpham);
		request.setAttribute("listP", listP);
		request.getRequestDispatcher("autumn.jsp").forward(request, response);
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
