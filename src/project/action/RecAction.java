package project.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mybatis.dao.BbsDAO;
import mybatis.dao.RegDAO;
import project.vo.BbsVO;

public class RecAction implements Action {

	private Map<String, List<String>> map;

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		Map<String, List<String>> sub_map;
		String cPage = request.getParameter("cPage");
		String b_idx = request.getParameter("b_idx");
		String r_idx = request.getParameter("r_idx");
		List<String> list = null;
		System.out.println(b_idx);
		BbsVO vo = BbsDAO.view(b_idx);
		
		if(map != null) {
			sub_map = map;
		} else {
			sub_map = new HashMap<String, List<String>>();
		}
		
		if(vo!=null) {
			if(sub_map.get(b_idx) == null) {
				// 증가
				list = new ArrayList<String>();
				list.add(r_idx);
				sub_map.put(b_idx, list);
				RegDAO.recomend(b_idx);
				
				System.out.println("증가");
			} else {
				list = sub_map.get(b_idx);

				boolean chk = false;
				for(int i = 0 ; i < list.size() ; i++) {
					if(list.get(i).equals(r_idx)) {
						chk = true;
						break;
					}
				}
				if(!chk) {
					// 증가
					list.add(r_idx);
					sub_map.put(b_idx, list);
					RegDAO.recomend(b_idx);
					System.out.println("없으니 증가");
				}
			}
		}
		
		this.map = sub_map;
		request.setAttribute("cPage", cPage);
		System.out.println("잘가");
		return "control?type=view&b_idx="+b_idx;
	}

}
