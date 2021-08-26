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
import entity.Account;

/**
 * Servlet implementation class editUser
 */
@WebServlet("/editUser")
public class editUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String usernameEdit = request.getParameter("nameAfterEdit");
		int id = Integer.parseInt(request.getParameter("id"));
		DAO dao = new DAO();
		dao.updateUser(id, usernameEdit);
		List<Account> listAcc = new ArrayList<>();
		listAcc = dao.getAllUser();
		request.setAttribute("listAcc", listAcc);
		request.getRequestDispatcher("quantriAcc.jsp").forward(request, response);
	}

}
