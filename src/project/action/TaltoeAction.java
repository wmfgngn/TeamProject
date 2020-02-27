package project.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mybatis.dao.RegDAO;

public class TaltoeAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// 회원탈퇴 
			
		String s_pw = request.getParameter("s_pw");
		System.out.println(s_pw);
		String r_idx = request.getParameter("r_idx");
		System.out.println(r_idx);
		RegDAO.taltoe(s_pw, r_idx);
		
		HttpSession session = request.getSession();
		session.removeAttribute("loVo");
		request.removeAttribute("loVo");
		
		return "control?type=main";
	}

}
