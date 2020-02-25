package project.control;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.action.Action;

@WebServlet(
		urlPatterns = { "/control" }, 
		initParams = { 
				@WebInitParam(name = "myParam", 
						value = "/WEB-INF/action.properties")
		})
public class MyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Map<String, Action> actionMap;

	public MyController() {
		super();
		actionMap = new HashMap<String, Action>();
	}

	@Override
	public void init() throws ServletException {
		// 서블릿이 생성될 때 전달된 초기 Parameter 가져오기
		String props_path = getInitParameter("myParam");
		// String props_path = "/WEB-INF/action.properties";
		// ---------------------------------------------

		// application을 따와서 properties파일을 절대 경로화 
		ServletContext application = getServletContext();
		String path = application.getRealPath(props_path);
		// ---------------------------------------------

		// 절대 경로화된 파일의 내용을 stream을 이용해 Properties객체 props에 저장
		// 절대 경로화된 파일의 내용 => <Key - 생성할 객체들의 경로>
		Properties props = new Properties();
		FileInputStream fis = null;

		try {
			fis = new FileInputStream(path);
			props.load(fis);
		} catch (Exception e) {	}
		// ---------------------------------------------

		// props에 저장된 키를 이용해 값(클래스 경로)을 구한 후 객체로 생성, Map<문자열 키 - 객체>구조로 저장 
		Iterator<Object> it = props.keySet().iterator();
		while(it.hasNext()) {
			String key = (String)it.next();
			String value = props.getProperty(key);

			try {
				// 경로를 객체로 생성 (Class.forName()의 반환형 : Object)
				Object obj = Class.forName(value).newInstance();

				actionMap.put(key, (Action)obj);
			} catch (Exception e) { }
		}
		// ---------------------------------------------
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}

	protected void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");

		String type = request.getParameter("type");
		System.out.println("\ntype : " + type);
		if(type == null) {
			type = "list";
		}

		// type의 값은 actionMap의 key로 사용
		Action action = actionMap.get(type);

		String viewPath = action.execute(request, response);

		RequestDispatcher disp = request.getRequestDispatcher(viewPath);
		disp.forward(request, response);
	}
}

