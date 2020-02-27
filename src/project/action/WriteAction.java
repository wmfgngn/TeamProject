package project.action;

import java.io.File;

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
			
			BbsVO vo = new BbsVO();
			vo.setIp(request.getRemoteAddr());
			vo.setType(reqnum);
			vo.setSubject(mr.getParameter("subject"));
			vo.setWriter(mr.getParameter("writer"));
			vo.setContent(mr.getParameter("str"));
			vo.setPwd(mr.getParameter("pwd"));
			vo.setKategorie("");
			File f = mr.getFile("file");
			
			String f_name = "";
			String o_name = "";
			if(f != null){
				o_name = mr.getOriginalFileName("file");
				f_name = f.getName();
			}
			
			vo.setFile_name(f_name);
			vo.setOri_name(o_name);
			
			BbsDAO.add(vo);
			
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
