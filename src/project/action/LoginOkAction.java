package project.action;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;

import mybatis.dao.BbsDAO;
import project.vo.BbsVO;
import project.vo.RegVO;

public class LoginOkAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String s_id = request.getParameter("s_id");
		String s_pw = request.getParameter("s_pw");
		String c_type = request.getContentType();//요청한 곳으로 부터
		
		
		String viewPath = "/jsp/login.jsp";
		
		if(c_type != null && c_type.startsWith("application/")) {
		try {
			boolean res = false;
			//System.out.println(s_id+"/"+s_pw);
			RegVO vo = BbsDAO.login(s_id, s_pw);
			if(vo != null) {
				res = true;
				request.setAttribute("res", res);
				HttpSession session = request.getSession();
				session.setAttribute("loVo", vo);
				
			}else {
				request.setAttribute("res", res);
				
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
			viewPath = "/jsp/login_ajax.jsp";
		}
		
		return viewPath;
	}

}
