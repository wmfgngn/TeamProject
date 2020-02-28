package project.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.dao.BbsDAO;
import project.vo.BbsVO;

public class SearchAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String searchValue = request.getParameter("searchValue");
		
		BbsVO[] ar = BbsDAO.searchBbs(searchValue);
		
		request.setAttribute("searchAr", ar);
		
		
		return "/jsp/search_res.jsp";
	}

}
