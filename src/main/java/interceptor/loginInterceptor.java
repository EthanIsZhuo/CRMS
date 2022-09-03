package interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

public class loginInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		//�ж��Ƿ��¼
		HttpSession session=request.getSession();
		String haveLogin= (String) session.getAttribute("haveLogin");
		
		if(haveLogin!=null){//δ��¼		
			
			
			return true;
		}
		
		request.getRequestDispatcher("/WEB-INF/Login.jsp")
        .forward(request, response);
		return false;
	}

}
