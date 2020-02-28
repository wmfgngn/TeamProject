package project.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.dao.BbsDAO;

public class AnsDelAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// 
		String b_idx = request.getParameter("b_idx");
		String pwd = request.getParameter("pwd");//사용자가 입력한 비밀번호값 
		
		boolean value =	BbsDAO.c_del(b_idx, pwd);
		request.setAttribute("value", value);
		

		return "/jsp/c_del.jsp";
	}

}
