package uuu.movieline.controller;

import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet("/member/update.do")
public class UpdateMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateMemberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		List<String> errors = new ArrayList<>();
		
		//!設定編碼一定要在request.getParameter之前
		request.setCharacterEncoding("UTF-8");//欄位有中文必加
		HttpSession session = request.getSession();
		//獲取已登入的會員資料
		Customer member = (Customer)session.getAttribute("member");
		//若未登入回到登入畫面
		if(member == null) {
			response.sendRedirect("../login.jsp");
			return;
		}
		//1.讀取request中的FormData資料,並檢查
		//id,email,password,name,birthday,gender,captcha
		//address,phone,subscribed
		String id = request.getParameter("id");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String newpassword = request.getParameter("newpassword");
		String name = request.getParameter("name");
		String birthday = request.getParameter("birthday");
		String gender = request.getParameter("gender");
		String captcha = request.getParameter("captcha");
		
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		String subscribed = request.getParameter("subscribed");
		//檢查
		
		if(!member.getId().equals(id)) {
			errors.add("不得竄改帳號!");
		}
		if(!(member.getBirthday().toString()).equals(birthday)) {
			errors.add("不得竄改生日!");
		}
		if(email == null || (email=email.trim()).length()==0) {
			errors.add("請輸入email");
		}
		if(!member.getPassword().equals(password)) {
			errors.add("舊密碼錯誤請重新輸入");
		}
		if(name == null || (name=name.trim()).length()==0) {
			errors.add("請輸入姓名");
		}
		if(gender == null || (gender=gender.trim()).length()!=1) {
			errors.add("請輸入性別");
		}
		//2.若無誤，呼叫商業邏輯
		if(errors.isEmpty()) {
			Customer c;
			try {
				c = member.getClass().newInstance();
			} catch (IllegalAccessException|InstantiationException e) {
				c = new Customer();
			}
			try {
				c.setId(member.getId());
				c.setEmail(email);
				c.setPassword(
						newpassword==""?
						member.getPassword():newpassword);
				c.setName(name);
				c.setBirthday(member.getBirthday());
				c.setGender(gender.charAt(0));//char
				
				c.setAddress(address);
				c.setPhone(phone);
				c.setSubscribed(subscribed!=null);//boolean
				
				CustomerService service = new CustomerService();
				service.update(c);
				
				//將session中的會員更新為新資料
				member = service.login(c.getId(), c.getPassword());
				session.setAttribute("member", member);
				
				RequestDispatcher dispatcher = 
						request.getRequestDispatcher("update_ok.jsp");
				request.setAttribute("member",c);
				request.setAttribute("msg","會員修改成功");
				dispatcher.forward(request, response);
				//若在getWriter前沒設定會變預設
				return;//若失敗會繼續向下
			} catch (MLInvalidDataException ex) {
				errors.add(ex.getMessage());//for user
			} catch (MLException ex) {
				errors.add(ex.getMessage()+", 請聯絡系統管理人員");//for users
				this.log(ex.getMessage(),ex);//for admin, developer, tester
			} catch (Exception ex) {
				errors.add("修改失敗，系統發生錯誤"+ex+",請聯絡系統管理人員");//for users
				this.log("修改失敗，系統發生非預期錯誤",ex);//for admin, developer, tester
			}
		}
		
		
		//3.2 顯示修改失敗 返回修改
		RequestDispatcher dispatcher = //請求派遣器
				request.getRequestDispatcher("/member/update_member.jsp");
		request.setAttribute("errors",errors);
		dispatcher.forward(request, response);
	}

}
