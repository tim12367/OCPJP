package uuu.movieline.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

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
    	//錯誤清單 宣告成上層型別較靈活 之後可改
    	List<String> errors = new ArrayList<String>();
    	
    	//1.取得request中的form data(username,password,captcha),第十章
    	String username = request.getParameter("username");
    	String password = request.getParameter("password");
    	String captcha = request.getParameter("captcha");
    	
    	//檢查有無錯誤 可能網頁form沒給name
    	if(username==null ||username.length()==0) {
    		errors.add("必須輸入帳號或email");
    	}
    	if(password==null ||password.length()==0) {
    		errors.add("必須輸入密碼");
    	}
    	if(captcha==null ||captcha.length()==0) {
    		errors.add("必須輸入驗證碼");
    	}
    	
    	//2.若檢查無誤，則呼叫商業邏輯
    	if (errors.isEmpty()) {
			CustomerService service = new CustomerService();
			try {
				Customer c = service.login(username, password);
				//3.1 產生成功的html 回應 ,第九章
				response.setContentType("text/html");//ContentType 或稱 MIME type 要依格式
				response.setCharacterEncoding("UTF-8");
				//若在getWriter前沒設定會變預設
				try (PrintWriter out = response.getWriter()) {//defalt ISO-8859-1
					out.println("<!DOCTYPE html>");
					out.println("<html>");
					out.println("<head>");
					out.println("<title>登入成功</title>");
					out.println("<meta http-equiv=\"refresh\" content=\"5; url=./\">");
					out.println("</head>");
					out.println("<body>");
					out.println("<h1>登入成功," + c.getName() + ", 5秒後回登入畫面"+ "</h1>");
					out.println("</body>");
					out.println("</html>");
				}

				return;
			} catch (LoginFailException e) {
				this.log(e.getMessage());
				errors.add(e.getMessage());//for user
			} catch (MLException e) {
				this.log(e.getMessage(), e);//for admin, tester, developer
				errors.add(e.getMessage()+":"+e+", 請聯絡系統管理人員");
			} catch (Exception e) {
				this.log("登入失敗，系統發生非預期錯誤", e);
				errors.add("系統發生錯誤"+e+"請聯絡系統管理人員");
			} 
		}
    	
    	//3.2 產生失敗的 html
    	response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		try (PrintWriter out = response.getWriter()) {
			out.println("<!DOCTYPE html>");
			out.println("<html>");
			out.println("<head>");
			out.println("<title>登入失敗</title>");
			out.println("<meta http-equiv=\"refresh\" content=\"15; url=./login.html\">");
			out.println("</head>");
			out.println("<body>");
			out.println("<h1>"+ errors +", 15秒後回登入畫面"+"</h1>");
			out.println("</body>");
			out.println("</html>");
		}
	}

}
