package project.action;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;

import javax.servlet.ServletContext;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class fDownAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String fname = request.getParameter("f_name");
		System.out.println(fname);
		String cPage = request.getParameter("cPage");
		ServletContext application = request.getServletContext();
		
		//위의 값들을 연결하여 절대경로화 시킨다.
		String path = application.getRealPath(
			"/upload/"+fname);
		
		File f = new File(path);
		
		//실재 존재하는지 판단!
		if(f.exists()){
			
			byte[] buf = new byte[2048]; //바구니
			int len = -1;
			
			//다운로드에 필요한 스트림 준비(읽어서 바로 쓰기를 한다.)
			//읽기에 필요한 스트림들
			BufferedInputStream bis = null;
			FileInputStream fis = null;
			
			//쓰기에 필요한 스트림들
			BufferedOutputStream bos = null;
			ServletOutputStream sos = null;//응답을  하는 것이
			//접속자 PC로 다운로드를 시켜야 하기 때문에
			//response를 통해 스트림을 얻어내야 한다.
			//그것이 바로 ServletOutputStream이다.
			
			try{
				//접속자 화면에 다운로드 창을 보여준다.
				response.setContentType(
					"application/x-msdownload");
				response.setHeader(
					"Content-Disposition",
					"attachment;filename="+
					new String(fname.getBytes(), "8859_1"));
				//-------------------------------------------
				
				//다운로드할 File과 연결되는 스트림 생성
				fis = new FileInputStream(f);
				bis = new BufferedInputStream(fis);
				
				//response를 통해 이미 out이라는 스트림이 
				//내장객체로 준비되어 있다. 그래서 오류가 발생함
				
				//out.clear();
				//out = pageContext.pushBody();
				
				sos = response.getOutputStream();//*******
				bos = new BufferedOutputStream(sos);
				
				while((len = bis.read(buf)) != -1){
					//읽은 자원은 buf에 모두 있고, 읽은 갯수는 len이
					//기억하고 있다. 그러므로 쓰기할 때는
					//buf에서 읽은 수만큼 즉, len만큼 쓰기 하면 된다.
					bos.write(buf, 0, len);
					bos.flush();
				}
				
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				try{
					if(fis != null)
						fis.close();
					if(bis != null)
						bis.close();
					if(sos != null)
						sos.close();
					if(bos != null)
						bos.close();
				}catch(Exception e){}
			}			
		}
		return "";
	}

}
