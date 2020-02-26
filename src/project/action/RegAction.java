package project.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.dao.RegDAO;

public class RegAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// 회원 가입 
		
		String c_type = request.getContentType(); //GET NULL
		String viewPath = "/reg.jsp"; // 헤더에서 회원가입  눌렀을떄 경로 
		
		if(c_type != null && c_type.startsWith("application/")) { //회원가입 "가입" 버튼 눌렀을때 POST 방식
			try {
				String id = request.getParameter("s_id");
				String pw = request.getParameter("s_pw");
				String name = request.getParameter("s_name");
				String gender = request.getParameter("gender");
				String [] phone =request.getParameterValues("s_phone");
				
				
				boolean cnt = RegDAO.add(id, pw, name, phone, gender);
			} catch (Exception e) {
				e.printStackTrace();
				
				viewPath = null;// 회원가입 에서 "가입"눌렀을떄  
			} 
				
			
		}
		
		return viewPath;
	}

}
