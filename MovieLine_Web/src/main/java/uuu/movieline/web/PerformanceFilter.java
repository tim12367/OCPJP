package uuu.movieline.web;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;

/**
 * Servlet Filter implementation class PerformanceFilter
 */

//從這裡開啟測試功能
//@WebFilter(urlPatterns = {"*.jsp", "*.do"})
public class PerformanceFilter extends HttpFilter implements Filter {
	private FilterConfig config;

	/**
	 * @see HttpFilter#HttpFilter()
	 */
	public PerformanceFilter() {
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
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
//		開始記錄
		long begin = System.currentTimeMillis();
//		filter結束 轉交請求	
		chain.doFilter(request, response);
//		紀錄結束時間 並且傳送log
		long end = System.currentTimeMillis();

		String logMessage = ((HttpServletRequest) request).getRequestURL() + ": " + (end - begin) + " ms";

		config.getServletContext().log(logMessage.toString());
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		this.config = fConfig;
	}

}
