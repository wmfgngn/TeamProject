package project.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mybatis.dao.CommDAO;
import project.vo.CommVO;

public class CommeditAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String cPage = request.getParameter("cPage");
		String b_idx = request.getParameter("b_idx");
		String c_idx = request.getParameter("c_idx");
		String content = request.getParameter("content");
		
		CommVO cvo = CommDAO.getComm(Integer.parseInt(c_idx));
		cvo.setContent(content);
		
		if(CommDAO.editComm(cvo)) {
			request.setAttribute("b_idx", b_idx);
			request.setAttribute("cPage", cPage);
			System.out.println("댓글수정 : " + cPage);
			System.out.println("댓글수정 : " + b_idx);
			System.out.println("댓글수정 : " + content);
		}
		
		return null;
	}

}
