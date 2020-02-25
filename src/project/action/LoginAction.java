package project.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// 해야할일...
		//그냥 로그인 화면 이동
		
		return "/jsp/login.jsp";
	}

}
