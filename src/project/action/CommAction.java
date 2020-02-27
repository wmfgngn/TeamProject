package project.action;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import mybatis.dao.BbsDAO;
import project.vo.BbsVO;
import project.vo.PageVO;
import project.vo.RegVO;

public class CommAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		PageVO pvo = (PageVO)session.getAttribute("pvo");
		RegVO vo = (RegVO)session.getAttribute("loVo");
		
		
		String cPage = request.getParameter("cPage");
		String writer = vo.getS_name();
		String content = request.getParameter("ans_tt");
		String pwd = vo.getS_pw();
		String ip = request.getRemoteAddr();
		String b_idx = request.getParameter("b_idx");
		String r_idx = vo.getR_idx();
		BbsDAO.c_add(writer, content, pwd, ip, b_idx, r_idx);
		
		
		return "control?type=view&cPage=" + cPage + "&b_idx=" + b_idx;
	}

}
