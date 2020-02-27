package project.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.dao.BbsDAO;
import project.vo.BbsVO;
import project.vo.PageVO;

public class MainAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		BbsVO[] ar01 = BbsDAO.getList(1, 5, "1");
		BbsVO[] ar02 = BbsDAO.getList(1, 5, "2");
		BbsVO[] ar03 = BbsDAO.getList(1, 5, "3");

		request.setAttribute("ar01", ar01);
		request.setAttribute("ar02", ar02);
		request.setAttribute("ar03", ar03);
		
		return "/jsp/main.jsp";
	}

}
