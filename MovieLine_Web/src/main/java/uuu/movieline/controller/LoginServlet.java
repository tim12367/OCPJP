package uuu.movieline.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
    	List<String> errors = new ArrayList<>();
    	HttpSession session = request.getSession();
    	//這邊欄位剛好都沒有中文編碼 若要獲得中文 需要設定這行
    	//request.setCharacterEncoding("utf-8");
    	//1.取得request中的form data(username,password,captcha),第十章
    	String username = request.getParameter("username");
    	String password = request.getParameter("password");
    	String captcha = request.getParameter("captcha");
    	//去頭尾
    	username = username.trim();
    	//檢查有無錯誤 可能網頁form沒給name
    	if(username==null ||username.length()==0) {
    		errors.add("必須輸入帳號或email");
    	}
    	if(password==null ||password.length()==0) {
    		errors.add("必須輸入密碼");
    	}
    	if(captcha==null ||captcha.length()==0) {
    		errors.add("必須輸入驗證碼");
    	}else {
    		String oldCaptcha = (String)session.getAttribute("LoginCaptchaServlet");
    		if(!captcha.equalsIgnoreCase(oldCaptcha)) {
    			errors.add("驗證碼不正確");
    		}
    	}
    	//清除驗證碼
    	session.removeAttribute("LoginCaptchaServlet");
    	//2.若檢查無誤，則呼叫商業邏輯
    	if (errors.isEmpty()) {
			CustomerService service = new CustomerService();
			try {
				Customer c = service.login(username, password);
				//3.1 登入成功:內部轉交(forward)/login_ok.jsp
				RequestDispatcher dispatcher = //請求派遣器
						request.getRequestDispatcher("/login_ok.jsp");
				session.setAttribute("member",c);
				request.setAttribute("msg","登入成功");
				String loginRedirectUrl = (String) session.getAttribute("loginRedirectUrl");
				if(loginRedirectUrl!=null) {
					session.removeAttribute("loginRedirectUrl");
					request.setAttribute("loginRedirectUrl", loginRedirectUrl);
				}
				dispatcher.forward(request, response);
				return;//成功就跳掉，失敗繼續向下執行
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
    	
    	//3.2 登入失敗:內部轉交(forward)/login.jsp
    	RequestDispatcher dispatcher = 
    			request.getRequestDispatcher("/login.jsp");
    	request.setAttribute("errors", errors);
    	dispatcher.forward(request, response);
    	//結束
	}

}
