package spring.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebFilter(urlPatterns = {"/*"})
public class Utf8Filter implements Filter{

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) {
		HttpServletRequest rq = (HttpServletRequest)request;
		HttpServletResponse rp = (HttpServletResponse)response;
		try {
			rq.setCharacterEncoding("UTF-8");
			rp.setCharacterEncoding("UTF-8");
			rp.setContentType("text/html");
			chain.doFilter(request, response);
		} catch (IOException | ServletException e) {
			e.printStackTrace();
		}
	}

}
