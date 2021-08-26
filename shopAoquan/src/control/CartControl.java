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
import entity.Product;
import entity.cartOder;

/**
 * Servlet implementation class CartControl
 */
@WebServlet("/cartControl")
public class CartControl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    		DAO dao = new DAO();
    		
    		
    		HttpSession session = request.getSession();
    		int pid = Integer.parseInt(request.getParameter("pid"));
//    		String status= request.getParameter("status");
    		String tongtien= (String) session.getAttribute("tongtien");
    		Product product = dao.getProductbyId(pid);
    		List<cartOder> listCO= (List<cartOder>) session.getAttribute("cartoder");
    		if(listCO==null) {
    			listCO = new ArrayList<>();		
    			tongtien="0";
    		}
    		
    		float tongtienhang = Float.parseFloat(tongtien);
    		
    		//delete
    		int index = 0;
    		int findP = 0;
    		
    		String lenh="";
    		lenh=request.getParameter("action");
    		System.out.println(lenh);
    		if(lenh!=null) {
    			if(lenh.equals("delete")) {
    				for(int i = 0;i<listCO.size();i++) {
            			if(listCO.get(i).getId()==pid) {
            					 index=i;
            					 break;
            			}
            			
            		}	
        			System.out.println(listCO.get(index));
        			
        			System.out.println(index);
        			tongtienhang-=listCO.get(index).getSoluong()*listCO.get(index).getPrice();
        			listCO.remove(index);
        			tongtien=tongtienhang+"";
    			}
    			//minus
    			else if(lenh.equals("minus")){
    				for(int i = 0;i<listCO.size();i++) {
            			if(listCO.get(i).getId()==pid) {
            					 index=i;
            					 break;
            			}  			
            		}
    				listCO.get(index).setSoluong(listCO.get(index).getSoluong()-1);
    				tongtienhang-=listCO.get(index).getPrice();
    				if(listCO.get(index).getSoluong()==0)
    					listCO.remove(index);
    				tongtien=tongtienhang+"";
    			}			  			
    			
    		}
    		else {
    			for (int i = 0; i < listCO.size(); i++) {
					if(listCO.get(i).getId()==pid) {
						listCO.get(i).setSoluong(listCO.get(i).getSoluong()+1);
						listCO.get(i).setPrice(listCO.get(i).getPrice());
						tongtienhang+=listCO.get(i).getPrice();
	            		tongtien=tongtienhang+"";
						findP=1;
						break;
					}
				}
    			if(findP!=1) {
    				cartOder cartoder= new cartOder(product.getPid(),product.getImage(),product.getName(),product.getPrice(),1);
        			listCO.add(cartoder);
        			
            		tongtienhang+=cartoder.getPrice();
            		tongtien=tongtienhang+"";
    			}
    			
    		}
    		session.setAttribute("tongtien", tongtien);
    		session.setAttribute("sohangOder",listCO.size());
    		session.setAttribute("cartoder", listCO);
    		request.getRequestDispatcher("cart.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
