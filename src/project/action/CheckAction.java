package project.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.dao.RegDAO;
import project.vo.RegVO;

public class CheckAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String id =request.getParameter("id");
		
		//System.out.println(id);
		RegVO vo =RegDAO.search(id);
		System.out.println(vo+"액셕부분");
		
		if(vo!=null) {
			request.setAttribute("vo", vo);
		}
		return "/jsp/idok.jsp";
	}

}
