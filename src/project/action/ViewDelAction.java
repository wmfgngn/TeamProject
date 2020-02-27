package project.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.dao.BbsDAO;

public class ViewDelAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {

		String b_idx = request.getParameter("b_idx");

		boolean chk = BbsDAO.delBbs(b_idx);
		request.setAttribute("value", chk);
		
		return "/del_bbs.jsp";
		
	}

}
