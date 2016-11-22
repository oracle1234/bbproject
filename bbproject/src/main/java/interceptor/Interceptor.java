package interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

/*
 * preHandle - 컨트롤러에 들어가기전 접근
 * postHandle - 컨트롤러 접근 후 view 페이지 접근전
 * afterCompletion - 컨트롤러와 view 페이지 모드 접근 후
 * 
 */

public class Interceptor extends HandlerInterceptorAdapter {

	public Interceptor() {

	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String reqUrl = request.getRequestURI().toString();
		reqUrl = reqUrl.substring(reqUrl.lastIndexOf("/") + 1);
		HttpSession session = request.getSession();
		if (session.getAttribute("member") == null) {
			response.sendRedirect("login.do?reqUrl=" + reqUrl);
			return false;
		} else {
			return super.preHandle(request, response, handler);
		}
	}
}
