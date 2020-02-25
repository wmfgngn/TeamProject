package project.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mybatis.dao.BbsDAO;
import project.vo.BbsVO;

public class ViewAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String cPage = request.getParameter("cPage");
		String b_idx = request.getParameter("b_idx");
		
		BbsVO vo = BbsDAO.view(b_idx);
		
		HttpSession session = request.getSession();
		
		Object obj = session.getAttribute("read_bbs");
		
		if(vo!=null) {
			boolean chk = false;
			List<BbsVO> list = null;
			
			if(obj == null) {
				list = new ArrayList<BbsVO>();
				session.setAttribute("read_bbs", list);
			}else {
				list = (List<BbsVO>)obj;
				for(BbsVO bvo : list) {
					if(b_idx.equals(bvo.getB_idx())) {
						chk = true;
						break;
					}
				}
			}
			if(!chk) {
				int hit = Integer.parseInt(vo.getHit());
				++hit;
				
				vo.setHit(String.valueOf(hit));
				BbsDAO.hit(b_idx);
				list.add(vo);
			}
			request.setAttribute("vo", vo);
			request.setAttribute("cPage", cPage);
		}
		return "/view.jsp";
	}

}
