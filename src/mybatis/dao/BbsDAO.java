package mybatis.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import mybatis.service.FactoryService;
import project.vo.BbsVO;

public class BbsDAO {
	
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

}
