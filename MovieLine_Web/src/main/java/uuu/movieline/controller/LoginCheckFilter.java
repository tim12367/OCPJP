package uuu.movieline.controller;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import uuu.movieline.entity.Customer;

/**
 * Servlet Filter implementation class LoginCheckFilter
 */
@WebFilter("/member/*")
public class LoginCheckFilter extends HttpFilter implements Filter {
       
    /**
     * @see HttpFilter#HttpFilter()
     */
    public LoginCheckFilter() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(HttpServletRequest request, HttpServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpSession session = request.getSession();
		Customer member = (Customer)session.getAttribute("member");
		if(member!=null) {
//			System.out.println("test");
			chain.doFilter(request, response);
			return;
		}else {
			System.out.println(request.getRequestURI());//登入成功要回到上個畫面
			System.out.println(request.getQueryString());//登入成功要帶回QueryString
			String loginRedirectUrl = request.getRequestURI() + (request.getQueryString()!=null?"?" + request.getQueryString():"");
			session.setAttribute("loginRedirectUrl",loginRedirectUrl);
			response.sendRedirect(request.getContextPath()+"/login.jsp");
		}
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
