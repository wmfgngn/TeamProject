package project.action;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import mybatis.dao.BbsDAO;
import project.vo.BbsVO;
import project.vo.RegVO;

public class WriteAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String cPage = request.getParameter("cPage");
		String c_type = request.getContentType();//요청한 곳으로 부터
		//System.out.println(reqnum);
		// MIME타입을 얻는다.
		// - Get방식 : null
		// - Post방식 : application/....
		// - Post방식에 encType="multipart/form-data": multipart/....
		//System.out.println(c_type);
		String viewPath = "/jsp/write.jsp";
		ServletContext application = request.getServletContext();
		String path = application.getRealPath("upload");
		
		if(c_type != null && c_type.startsWith("multipart/")) {
		try {
			MultipartRequest mr = new MultipartRequest(request, path, 1024*1024*5, 
					"utf-8", new DefaultFileRenamePolicy());
			String reqnum = mr.getParameter("reqnum");
			
			Map<String, String> map = new HashMap<String, String>();
			map.put("ip",request.getRemoteAddr());
			map.put("type",reqnum);
			map.put("subject",mr.getParameter("subject"));
			map.put("writer", mr.getParameter("writer"));
			map.put("content",mr.getParameter("str"));
			map.put("pwd",mr.getParameter("pwd"));
			map.put("kategorie","");
			File f = mr.getFile("file");
			
			String f_name = "";
			String o_name = "";
			String r_idx = "";
			RegVO rvo = null;
			
			HttpSession session = request.getSession();
			Object obj = session.getAttribute("loVo");
			if(obj != null) {
				rvo = (RegVO)obj;
				r_idx = rvo.getR_idx();
			}
			
			if(f != null){
				o_name = mr.getOriginalFileName("file");
				f_name = f.getName();
			}
			
			map.put("file_name",f_name);
			map.put("ori_name",o_name);
			map.put("r_idx",r_idx);
			
			BbsDAO.add(map);
			
			request.setAttribute("thisReqnum", reqnum);
			viewPath = null;
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
			
		}
		
		return viewPath;
	}

}
