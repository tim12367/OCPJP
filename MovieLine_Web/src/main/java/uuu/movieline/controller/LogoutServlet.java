package uuu.movieline.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LogoutServlet
 */
@WebServlet("/logout.do") //http://localhost:8080/ML/logout.do
public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LogoutServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false); //取得舊的session 不要建立新的
		//1(X),2有session則登出
		if(session!=null) {
			//有連線才登出
			session.invalidate();
		}
		//3.作法一:內部轉交給首頁(會讓轉交之後會browser看到首頁網址是/logout.do)
//		RequestDispatcher dispatcher = request.getRequestDispatcher("/");
//		dispatcher.forward(request, response);
		
		//3.作法二:外部轉址(會讓轉交之後會browser看到首頁網址是/)
		//網址傳給瀏覽器 瀏覽器再請求
		//所以不可以寫絕對路徑"/"
		response.sendRedirect(request.getContextPath()); //or ./
	}

}
