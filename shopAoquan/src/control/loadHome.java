package control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DAO;

/**
 * Servlet implementation class loadHome
 */
@WebServlet("/loadHome")
public class loadHome extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		DAO dao = new DAO();
		String tenKh=request.getParameter("tenKh");
		String diachi=request.getParameter("diachi");
		String sdt=request.getParameter("sdt");
		String email=request.getParameter("email");
		String toi = request.getParameter("toi");
		System.out.println(toi);
		float tongtien=Float.parseFloat((String) session.getAttribute("tongtien"));
		
		dao.addDonhang(tenKh, diachi, sdt, email, tongtien);
		session.invalidate();
		response.sendRedirect("index.jsp");
	}

}
