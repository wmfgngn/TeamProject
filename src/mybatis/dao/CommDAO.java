package mybatis.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import mybatis.service.FactoryService;
import project.vo.BbsVO;
import project.vo.CommVO;
import project.vo.RegVO;

public class CommDAO {

	public static CommVO getComm(int c_idx) {
		CommVO cvo = null;

		SqlSession ss = FactoryService.getFactory().openSession();
		cvo = ss.selectOne("com.getcom", c_idx);
		ss.close();

		return cvo;
	}
	public static boolean editComm(CommVO vo) {
		boolean chk = false;

		SqlSession ss = FactoryService.getFactory().openSession();
		int i = ss.update("com.comedit", vo);

		if(i > 0) {
			chk = true;
			ss.commit();
		} else {
			ss.close();
		}
		
		return chk;
	}
}














