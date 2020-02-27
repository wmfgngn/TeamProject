package project.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mybatis.dao.RegDAO;
import project.vo.RegVO;

public class CrystalAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		Object obj =session.getAttribute("loVo");
		RegVO rvo = null;
		System.out.print(obj);//로그인 판단
		if(obj != null){
			rvo =(RegVO)obj;
		}
		// 회원수정 
			
		String s_pw = request.getParameter("s_pw");
		System.out.println(s_pw+"액션비번");
		
		String s_phone =request.getParameter("s_phone");
		System.out.println(s_phone+"액션전화");
		
		String s_id =request.getParameter("s_id");
		System.out.println(s_id+"액션아이디");
		
	boolean chk =RegDAO.crystal(s_pw, s_phone ,s_id);
	if(chk) {
		rvo.setS_pw(s_pw);
		rvo.setS_phone(s_phone);		
	}
	session.setAttribute("loVo", rvo);
		/*
		 * if(chk) { System.out.println(chk+"액션참"); request.setAttribute("chk", chk); }
		 */		
		return "control?type=main";
	}

}
