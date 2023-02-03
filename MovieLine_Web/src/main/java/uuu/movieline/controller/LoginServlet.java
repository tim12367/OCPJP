package uuu.movieline.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login.do")//https://localhost:8080/vgb/login.do
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
    	
    	//檢查
    	
    	//2.若檢查無誤，則呼叫商業邏輯
    	
    	//3.1 產生成功的 html
    	
    	//3.1 產生失敗的 html
	}

}
