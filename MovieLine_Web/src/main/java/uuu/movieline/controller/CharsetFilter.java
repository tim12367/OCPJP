package uuu.movieline.controller;

import java.io.IOException;

import javax.servlet.DispatcherType;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;

/**
 * Servlet Filter implementation class CharsetFilter
 */
@WebFilter(urlPatterns = { "*.jsp", "*.do" },
dispatcherTypes = {DispatcherType.REQUEST,DispatcherType.ERROR})
public class CharsetFilter implements Filter {
       
    /**
     * @see HttpFilter#HttpFilter()
     */
    public CharsetFilter() {
        super();
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here
		request.setCharacterEncoding("UTF-8");//請求編碼
		request.getParameterNames();//鎖定request中body編碼
		
		response.setCharacterEncoding("UTF-8");//回應編碼
		response.getWriter();//鎖定response中body編碼
		
		// pass the request along the filter chain
		//交棒給原本 jsp/servlet
		//也就是說 原本請求->filter->原本請求網站
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		
	}

}
