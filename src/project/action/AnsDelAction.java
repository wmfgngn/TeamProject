package project.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.dao.BbsDAO;

public class AnsDelAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// 
		String c_idx = request.getParameter("c_idx");
		String pwd = request.getParameter("pwd"); //사용자가 입력한 비밀번호값 
		boolean value =	BbsDAO.c_del(c_idx, pwd);
		System.out.println(c_idx);
		System.out.println(pwd);
		System.out.println(value);
		request.setAttribute("value", value);

		return "/jsp/c_del.jsp";
	}

}
