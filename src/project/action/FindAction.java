package project.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.dao.RegDAO;
import project.vo.RegVO;

public class FindAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String nono = request.getParameter("nono");
		
		String viewPath=null;
		
		if(nono.equals("0")) {
			String idPhone = request.getParameter("idPhone");
			String idName = request.getParameter("idName");
			
			RegVO vo = RegDAO.findId(idPhone, idName);
			
			String id = vo.getS_id();
			
			request.setAttribute("id", id);
			
			viewPath = "/jsp/findId_ajax.jsp";
		}else if(nono.equals("1")) {
			
			viewPath = "/jsp/findPw_ajax.jsp";
		}
		
		
		return viewPath;
	}

}
