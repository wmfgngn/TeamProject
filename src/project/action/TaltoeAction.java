package project.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.dao.RegDAO;

public class TaltoeAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// 회원탈퇴 
			
		String s_pw = request.getParameter("s_pw");
		
		RegDAO.taltoe(s_pw);
		
		return "control?type=null";
	}

}
