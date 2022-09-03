package interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

public class loginInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		//ÅÐ¶ÏÊÇ·ñµÇÂ¼
		HttpSession session=request.getSession();
		String haveLogin= (String) session.getAttribute("haveLogin");
		
		if(haveLogin!=null){//Î´µÇÂ¼		
			
			
			return true;
		}
		
		request.getRequestDispatcher("/WEB-INF/Login.jsp")
        .forward(request, response);
		return false;
	}

}
