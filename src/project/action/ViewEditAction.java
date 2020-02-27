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
import project.vo.RegVO;

public class ViewEditAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String cPage = request.getParameter("cPage");
		String b_idx = request.getParameter("b_idx");
		String reqnum = request.getParameter("reqnum");
		request.setAttribute("b_idx", b_idx);
		request.setAttribute("cPage", cPage);
		request.setAttribute("reqnum", reqnum);
		String c_type = request.getContentType();
		String viewPath = "/jsp/view_edit.jsp";
		ServletContext application = request.getServletContext();
		String path = application.getRealPath("upload");
		
		if(c_type != null && c_type.startsWith("multipart/")) {
			try {
				MultipartRequest mr = new MultipartRequest(request, path, 1024*1024*5, 
						"utf-8", new DefaultFileRenamePolicy());
				
				String sb_idx = mr.getParameter("b_idx");
				String sreqnum = mr.getParameter("reqnum");
				Map<String, String> map = new HashMap<String, String>();
				map.put("ip",request.getRemoteAddr());
				map.put("subject",mr.getParameter("subject"));
				map.put("content",mr.getParameter("str"));
				map.put("pwd",mr.getParameter("pwd"));
				map.put("b_idx",sb_idx);
				
				File f = mr.getFile("file");
				
				String f_name = "";
				String o_name = "";
				
				if(f != null){
					o_name = mr.getOriginalFileName("file");
					f_name = f.getName();
				}
				
				map.put("file_name",f_name);
				map.put("ori_name",o_name);
				
				BbsDAO.viewEdit(map);
				
				request.setAttribute("thisReqnum", sreqnum);
				viewPath = null;
				
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
				
		}
		
		return viewPath;
	}

}
