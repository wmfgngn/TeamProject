package mybatis.dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import mybatis.service.FactoryService;
import project.vo.RegVO;

public class RegDAO {

	//회원 추가 DAO 
	public static boolean add(String id,String pw, String name,String[] phone, String gender) {
		boolean chk = false;

		// INSERT INTO REGIST_T(r_idx,s_id,s_pw,s_name,s_phone,s_gender,status,b_idx)
		// VAlUES ( Regist_t_seq.NEXTVAL,#{s_id},#{s_pw},#{s_name},#{s_phone},#{s_gender},0,#{b_idx})

		SqlSession ss = FactoryService.getFactory().openSession();
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
		RegVO vo = ss.selectOne("reg.getid",id);
		ss.close();

		return vo;
	}

	//회원 정보 수정 
	public static boolean crystal(String s_pw,String s_phone,String s_id) {
		boolean chk = false;
		SqlSession ss =FactoryService.getFactory().openSession();
		Map<String, String> map = new HashMap<String, String>();
		map.put("s_pw",s_pw);
		map.put("s_phone",s_phone);
		map.put("s_id",s_id);

		int cnt =ss.update("reg.crystal",map);

		if(cnt >0) {
			chk = true;
			ss.commit();
		}else
			ss.rollback();
		ss.close();

		return chk; 

	}
	//회정 탈퇴
	public static boolean taltoe(String s_pw,String r_idx) {
		boolean chk = false;
		SqlSession ss =FactoryService.getFactory().openSession();
		Map<String, String> map = new HashMap<String, String>();
		map.put("s_pw",s_pw);
		map.put("r_idx",r_idx);
		int cnt = ss.update("reg.taltoe",map);

		if(cnt >0) {
			chk =true;
			ss.commit();
		}else
			ss.rollback();
		ss.close();
		return chk;	
	}
	//아이디 찾기
	public static RegVO findId(String idPhone, String idName) {
		RegVO vo = null;
		SqlSession ss = FactoryService.getFactory().openSession();
		Map<String, String> map = new HashMap<String, String>();
		map.put("idPhone", idPhone);
		map.put("idName", idName);

		vo = ss.selectOne("reg.findId", map);

		if(vo != null) {
			ss.close();
		}

		return vo;
	}
	
	// 추천수
	public static void recomend(String b_idx) {
		SqlSession ss = FactoryService.getFactory().openSession();
		
		int cnt = ss.update("reg.recomend", b_idx);
		if(cnt>0)
			ss.commit();
		else
			ss.rollback();
		ss.close();
	}
	
	//비밀번호 찾기
	public static RegVO findPw(String pwPhone, String pwId) {
		RegVO vo = null;
		SqlSession ss = FactoryService.getFactory().openSession();
		Map<String, String> map = new HashMap<String, String>();
		map.put("pwPhone", pwPhone);
		map.put("pwId", pwId);

		vo = ss.selectOne("reg.findPw", map);

		if(vo != null) {
			ss.close();
		}

		return vo;
	}

}
