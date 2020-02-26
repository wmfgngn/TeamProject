package mybatis.dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import mybatis.service.FactoryService;

public class RegDAO {
	
	//회원 추가 DAO 
	public static boolean add(String id,String pw, String name,String[] phone, String gender) {
		boolean chk = false;
		
		// INSERT INTO REGIST_T(r_idx,s_id,s_pw,s_name,s_phone,s_gender,status,b_idx)
		// VAlUES ( Regist_t_seq.NEXTVAL,#{s_id},#{s_pw},#{s_name},#{s_phone},#{s_gender},0,#{b_idx})
		
		String s_phone = "";
		for(int i = 0 ; i < phone.length ; i++) {
			s_phone += phone[i];
		}
		System.out.println(s_phone);
		
		if(gender.equals("M")) {
			gender = "1";
		} else {
			gender = "0";
		}
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("s_id",id);
		map.put("s_pw",pw);
		map.put("s_name",name);
		map.put("s_phone",s_phone);
		map.put("s_gender",gender);
		
		SqlSession ss = FactoryService.getFactory().openSession();
		
		int cnt = ss.insert("reg.add" ,map); // 회원 추가
		if(cnt > 0) {
			chk =true;
			ss.commit();
		}
		ss.close();
		return chk;
	}
	// 가입완료 된 멤버 아이디로 찾기 
	public static RegVO search(String id) {
		SqlSession ss = FactoryService.getFactory().openSession();
		 
		RegVO vo = ss.selectOne("reg.member",id);
		ss.close();
		
		return vo;
	}

	
}
