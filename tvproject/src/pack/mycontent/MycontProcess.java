package pack.mycontent;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import pack.mybatis.SqlMapConfig;

public class MycontProcess {
	private SqlSessionFactory factory = SqlMapConfig.getSqlSession();
	
	public List<MycontDto> selectDataAll() {
		SqlSession sqlSession = factory.openSession();
		List<MycontDto> list = null;
		
		try {
			SqlMapperInter10 inter = (SqlMapperInter10)sqlSession.getMapper(SqlMapperInter10.class);
			list = inter.selectDataAll();
		} catch (Exception e) {
			System.out.println("selectDataAll err : " + e);
		} finally {
			if(sqlSession != null) sqlSession.close();
		}
		return list;
	}
	
	
}
