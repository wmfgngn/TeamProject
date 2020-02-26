package project.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.dao.RegDAO;

public class CrystalAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// 회원수정 
			
		String s_pw = request.getParameter("s_pw");
		String s_phone =request.getParameter("s_phone");
		
		RegDAO.crystal(s_pw, s_phone);
		
		
		return "control?type=null";
	}

}
