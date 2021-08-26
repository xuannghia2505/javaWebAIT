	package control;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DAO;
import entity.Account;

/**
 * Servlet implementation class LoginControl
 */
@WebServlet("/login")
public class LoginControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DAO dao = new DAO();
	
		
		String username = request.getParameter("user");
		String password = request.getParameter("pass");
		Account account = dao.getAccount(username, password);
		if(account != null) {
			if(account.getRole()==1) {
				List<Account> listAcc = new ArrayList<>();
				listAcc = dao.getAllUser();			
				request.setAttribute("listAcc", listAcc);
				request.getRequestDispatcher("quantriAcc.jsp").forward(request, response);
			}
			else{
			HttpSession session = request.getSession();
			session.setAttribute("acc", account);
			session.setMaxInactiveInterval(6000);
			response.sendRedirect("index.jsp");
			}
		}
		else {
			request.setAttribute("mess", "Wrong user or pass");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
	}

}
