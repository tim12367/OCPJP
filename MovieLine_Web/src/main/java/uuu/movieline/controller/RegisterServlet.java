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
import uuu.movieline.exception.MLException;
import uuu.movieline.exception.MLInvalidDataException;
import uuu.movieline.service.CustomerService;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/register.do")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		List<String> errors = new ArrayList<>();
		HttpSession session = request.getSession();
		//!設定編碼一定要在request.getParameter之前
		request.setCharacterEncoding("UTF-8");//欄位有中文必加
		
		//1.讀取request中的FormData資料,並檢查
		//id,email,password,name,birthday,gender,captcha
		//address,phone,subscribed
		String id = request.getParameter("id");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String birthday = request.getParameter("birthday");
		String gender = request.getParameter("gender");
		String captcha = request.getParameter("captcha");
		
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		String subscribed = request.getParameter("subscribed");
		//檢查
		if(id == null || (id=id.trim()).length()==0) {
			errors.add("請輸入帳號");
		}
		if(email == null || (email=email.trim()).length()==0) {
			errors.add("請輸入email");
		}
		if(password == null || password.length()==0) {
			errors.add("請輸入密碼");
		}
		if(name == null || (name=name.trim()).length()==0) {
			errors.add("請輸入姓名");
		}
		if(birthday == null || (birthday=birthday.trim()).length()==0) {
			errors.add("請輸入生日");
		}
		if(gender == null || (gender=gender.trim()).length()!=1) {
			errors.add("請輸入性別");
		}

		if(captcha == null || (captcha=captcha.trim()).length()==0) {
			errors.add("請輸入驗證碼");
		} else {
			String oldCaptcha = (String)session.getAttribute("RegisterCaptchaServlet");
			if(!captcha.equalsIgnoreCase(oldCaptcha)) {
				errors.add("驗證碼不正確");
			}
		}
		//清除驗證碼
    	session.removeAttribute("RegisterCaptchaServlet");
		//2.若無誤，呼叫商業邏輯
		if(errors.isEmpty()) {
			Customer c = new Customer();
			try {
				c.setId(id);
				c.setEmail(email);
				c.setPassword(password);
				c.setName(name);
				c.setBirthday(birthday);
				c.setGender(gender.charAt(0));//char
				//TODO:captcha,address,phone,subscribed
				c.setAddress(address);
				c.setPhone(phone);
				c.setSubscribed(subscribed!=null);//boolean
				
				CustomerService service = new CustomerService();
				service.register(c);
				
				//3.1 註冊成功:內部轉交(forward)/register_ok.jsp
				RequestDispatcher dispatcher = //請求派遣器
						request.getRequestDispatcher("register_ok.jsp");
				request.setAttribute("member",c);
				request.setAttribute("msg","註冊成功");
				dispatcher.forward(request, response);
				return;//若失敗會繼續向下
			} catch (MLInvalidDataException ex) {
				errors.add(ex.getMessage());//for user
			} catch (MLException ex) {
				errors.add(ex.getMessage()+", 請聯絡系統管理人員");//for users
				this.log(ex.getMessage(),ex);//for admin, developer, tester
			} catch (Exception ex) {
				errors.add("註冊失敗，系統發生錯誤"+ex+",請聯絡系統管理人員");//for users
				this.log("註冊失敗，系統發生非預期錯誤",ex);//for admin, developer, tester
			}
		}
		
		//3.2 顯示註冊失敗畫面
		RequestDispatcher dispatcher = //請求派遣器
				request.getRequestDispatcher("register.jsp");
		request.setAttribute("errors",errors);
		dispatcher.forward(request, response);
	}

}
