package mybatis.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import mybatis.service.FactoryService;
import project.vo.BbsVO;
import project.vo.RegVO;

public class BbsDAO {
	
	public static BbsVO[] getList(int begin, int end, String reqnum) {
		BbsVO[] ar = null;
		SqlSession ss = FactoryService.getFactory().openSession();
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("begin", begin);
		map.put("end", end);
		map.put("reqnum", Integer.parseInt(reqnum));
		List<BbsVO> list = ss.selectList("bbs.bbslist", map);
		
		if(list.size() > 0) {
			ar = new BbsVO[list.size()];
			ar = list.toArray(ar);
		}
		ss.close();
		return ar;
	}
	
	public static int getTotalCount() {
		SqlSession ss = FactoryService.getFactory().openSession();
		//int cnt = ss.selectOne("bbs.totalCount");
		ss.close();
		return 0;
	}
	
	// View DAO
	public static BbsVO view(String b_idx) {
		
		SqlSession ss = FactoryService.getFactory().openSession();
		BbsVO vo = ss.selectOne("bbs.view",b_idx);
		
		ss.close();
		
		return vo;
		
	}
	
	// 조회수
	public static void hit(String b_idx) {
		SqlSession ss = FactoryService.getFactory().openSession();
		
		int cnt = ss.update("bbs.hit",b_idx);
		if(cnt>0)
			ss.commit();
		else
			ss.rollback();
		ss.close();
	}
	
	// 로그인
	public static RegVO login(String s_id, String s_pw) {
		SqlSession ss = FactoryService.getFactory().openSession();
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("s_id", s_id);
		map.put("s_pw", s_pw);
		
		RegVO vo = ss.selectOne("login", map);
		ss.close();
		
		return vo;
	}
	
	public static void add(BbsVO vo) {
		SqlSession ss = FactoryService.getFactory().openSession();
		
		int cnt = ss.insert("addBbs", vo);
		if(cnt > 0) {
			ss.commit();
		}
		
		ss.close();
		
		
	}
	
	// 글삭제
	public static boolean delBbs(String b_idx) {
		boolean value = false;
		
		SqlSession ss = FactoryService.getFactory().openSession();
		
		int cnt = ss.selectOne("bbs.del",b_idx);
		
		if(cnt>0) {
			value = true;
			ss.commit();
		}else{
			ss.rollback();
		}
		
		ss.close();
		
		return value;
	}

}














