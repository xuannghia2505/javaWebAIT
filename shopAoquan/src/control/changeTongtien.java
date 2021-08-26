package control;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class changeTongtien
 */
@WebServlet("/changeTongtien")
public class changeTongtien extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");

		String tongtien = request.getParameter("tongtien");
		
        PrintWriter out = response.getWriter();
        out.println(" <div class=\"p-4\">\r\n"
        		+ "    <ul class=\"list-unstyled mb-4\" style=\"list-style-type: none;\">\r\n"
        		+ "        <li class=\"d-flex justify-content-between py-3 border-bottom\"><strong class=\"text-muted\">Tổng tiền hàng:</strong><strong id=\"tongtien\">\r\n"
        		+ "                "+tongtien+" </strong>$</li>\r\n"
        		+ "        <li class=\"d-flex justify-content-between py-3 border-bottom\"><strong class=\"text-muted\">Phí vận chuyển:</strong><strong> Free\r\n"
        		+ "                ship</strong></li>\r\n"
        		+ "        <li class=\"d-flex justify-content-between py-3 border-bottom\"><strong class=\"text-muted\">VAT:</strong><strong> 0 $</strong></li>\r\n"
        		+ "        <li class=\"d-flex justify-content-between py-3 border-bottom\"><strong class=\"text-muted\">Tổng thanh toán:</strong>\r\n"
        		+ "            <strong class=\"font-weight-bold\">"+tongtien+"</strong>$</li>\r\n"
        		+ "    </ul>\r\n"
        		+ "    <a class=\"btn btn-dark rounded-pill py-2 btn-block\"><button style=\"color:#999; font-size:bold; border:none; padding:5px; \" onclick=\"muahangBtn("+tongtien+")\">Mua\r\n"
        		+ "        hàng</button></a>\r\n"
        		+ "    <div id=\"muahang\"></div>\r\n"
        		+ "</div>");
        
       HttpSession session = request.getSession();
       session.setAttribute("tongtien", tongtien);
        
        
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
