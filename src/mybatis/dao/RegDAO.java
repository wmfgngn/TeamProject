package mybatis.dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import mybatis.service.FactoryService;

public class RegDAO {
	
	
	
	//회원 추가 DAO 
	public static boolean add(String id,String pw, String name,String [] phone,String gender) {
		boolean chk = false;
		
		String s_phone =makeString(phone, "↓");
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("id",id);
		map.put("pw",pw);
		map.put("name",name);
		map.put("phone",s_phone);
		map.put("gender",gender);
		
		SqlSession ss = FactoryService.getFactory().openSession();
		
		int cnt = ss.insert("reg.add" ,map); // 회원 추가
		if(cnt > 0) {
			chk =true;
		
			ss.commit();
		}
		ss.close();
		return chk;
		
	}
	
	
	//메이크 스트링 
	private static String makeString(String[] ar,String delim) {
		StringBuffer sb =new StringBuffer();
		for(int i=0; i<ar.length; i++) {
			sb.append(ar[i]);
			
			if(i < ar.length-1)
				sb.append(delim);
		}
		return sb.toString();
	}
	
	
	
}
