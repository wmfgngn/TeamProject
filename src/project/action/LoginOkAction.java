package project.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.dao.BbsDAO;
import project.vo.BbsVO;
import project.vo.RegVO;

public class LoginOkAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String s_id = request.getParameter("s_id");
		String s_pw = request.getParameter("s_pw");
		boolean res = false;
		System.out.println(s_id+"/"+s_pw);
		RegVO vo = BbsDAO.login(s_id, s_pw);
		if(vo != null) {
			res = true;
			request.setAttribute("res", res);
			request.setAttribute("loVo", vo);
			
		}else {
			request.setAttribute("res", res);
			
		}
		
		return "/jsp/login_ajax.jsp";
	}

}
