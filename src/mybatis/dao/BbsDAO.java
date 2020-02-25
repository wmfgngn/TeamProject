package mybatis.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import mybatis.service.FactoryService;

public class BbsDAO {
	
	public static int getTotalCount() {
		SqlSession ss = FactoryService.getFactory().openSession();
		//int cnt = ss.selectOne("bbs.totalCount");
		ss.close();
		return 0;
	}
	

}
