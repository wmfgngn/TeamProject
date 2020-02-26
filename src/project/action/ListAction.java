package project.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.dao.BbsDAO;
import project.vo.BbsVO;
import project.vo.PageVO;

public class ListAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String path = null;
		PageVO page = new PageVO();	// 한 페이지당 보여지는 게시물 수 (2), 페이지 묶음 (5) >> 기본 값
		
		// 페이징기법 변수 설정
		page.setTotalRecord(BbsDAO.getTotalCount());	// 총 게시물 수 (1), 전체 페이지 수 (3)
		
		// 현재 페이지값 초기화 (4)
		String cPage = request.getParameter("cPage");
		if (cPage != null) {
			// 각 페이지의 게시물 리스트 선별을 위한 범위 (begin, end) 초기화 (6)
			// 페이지 Block의 처음과 끝 페이지 (startPage, endPage) 초기화 (7)
			page.setNowPage(Integer.parseInt(cPage));
		} else {
			page.setNowPage(page.getNowPage());
		}
		//BbsVO[] ar = BbsDAO.getList(page.getBegin(), page.getEnd());
		BbsVO[] ar = null;
		request.setAttribute("ar", ar);
		request.setAttribute("page", page);
		
		PageVO pvo = (PageVO)request.getAttribute("page");
		System.out.println("nowpage : " + pvo.getNowPage());
		
		// 공지, 자유, 팁
		switch(request.getParameter("reqnum")) {
			case "1":
				path = "/jsp/Bbs_List01.jsp";
				break;
			case "2":
				path = "/jsp/Bbs_List02.jsp";
				break;
			case "3":
				path = "/jsp/Bbs_List03.jsp";
				break;
			default:
		}
		return path;
	}

}
