package uuu.movieline.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import uuu.movieline.entity.Customer;
import uuu.movieline.exception.LoginFailException;
import uuu.movieline.exception.MLException;
import uuu.movieline.service.CustomerService;

/**
 * Servlet implementation class LoginServlet
 */
//原本eclipse產生時是 @WebServlet("/login.do")
//最好要加屬性名稱 urlPatterns = 才能宣告多個屬性
@WebServlet(urlPatterns = "/login.do")//https://localhost:8080/vgb/login.do
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
//    Override伺服器廠商的HttpServlet 所以server才能
    @Override 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		//1.取得request中的form data(username,password,captcha)
    	String username = request.getParameter("username");
    	String password = request.getParameter("password");
    	String captcha = request.getParameter("captcha");
    	//TODO:檢查
    	
    	//2.若檢查無誤，則呼叫商業邏輯
    	CustomerService service = new CustomerService();
    	try {
			Customer c = service.login(username, password);
			//3.1 產生成功的html 回應
			response.setContentType("text/html");
            response.setCharacterEncoding("UTF-8");
            try (PrintWriter out = response.getWriter()) {
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<title>登入成功</title>");
                out.println("</head>");
                out.println("<body>");
                out.println("<h1>登入成功," + c.getName() + "</h1>");
                out.println("</body>");
                out.println("</html>");
            }

            return;
		} catch (LoginFailException e) {
			this.log(e.getMessage());
		} catch (MLException e) {
			this.log(e.getMessage(), e);
		}catch (Exception e) {
			this.log("登入失敗，系統發生錯誤", e);
		}
    	
    	//3.1 產生失敗的 html
	}

}
