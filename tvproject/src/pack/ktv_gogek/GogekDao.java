package pack.ktv_gogek;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import pack.ktv_contents.SqlMapperInter1;
import pack.mybatis.SqlMapConfig;

public class GogekDao {
private SqlSessionFactory factory = SqlMapConfig.getSqlSession();

	public List<GogekDto> selectDataAll(){
		SqlSession sqlSession = factory.openSession();
		List<GogekDto> list = null;
		
		try {
			SqlMapperInter2 inter = (SqlMapperInter2)sqlSession.getMapper(SqlMapperInter2.class);
			list = inter.selectDataAll();
		} catch (Exception e) {
			System.out.println("selectDataAll err : " + e);
		}finally {
			if(sqlSession != null) sqlSession.close();
		}
		return list;
	}
	
	public GogekDto selectDataPart(String id) {
		SqlSession sqlSession = factory.openSession();
		GogekDto dto = null;
		try {
			SqlMapperInter2 inter = (SqlMapperInter2)sqlSession.getMapper(SqlMapperInter2.class);
			dto = inter.selectDataPart(id); 
		} catch (Exception e) {
			System.out.println("selectData err : " + e);
		}finally {
			if(sqlSession != null) sqlSession.close();
		}
		return dto;
	}
	
	public boolean insertData(GogekBean bean) {
		boolean b = false;
		SqlSession sqlSession = factory.openSession();
		try {
			SqlMapperInter2 inter = (SqlMapperInter2)sqlSession.getMapper(SqlMapperInter2.class);
			if(inter.insertData(bean) > 0) b = true;
			sqlSession.commit();
		} catch (Exception e) {
			System.out.println("insertData err : " + e);
			sqlSession.rollback();
		}finally {
			if(sqlSession != null) sqlSession.close();
		}
		return b;
	}
	
	public boolean uqdateData(GogekBean bean) {
		boolean b = false;
		SqlSession sqlSession = factory.openSession();
		
		try {
			SqlMapperInter2 inter = (SqlMapperInter2)sqlSession.getMapper(SqlMapperInter2.class);
			if(inter.updateData(bean) > 0) {
				b = true;
				sqlSession.commit();
			}
		} catch (Exception e) {
			System.out.println("updateData err : " + e);
			sqlSession.rollback();
		}finally {
			if(sqlSession != null) sqlSession.close();
		}
		return b;
	}
	
	public boolean deleteData(GogekBean bean) {
		boolean b = false;
		SqlSession sqlSession = factory.openSession();
		try {
			SqlMapperInter2 inter = (SqlMapperInter2)sqlSession.getMapper(SqlMapperInter2.class);
			int cou = inter.deleteData(bean);
			if(cou > 0) b = true;
			sqlSession.commit();
		} catch (Exception e) {
			System.out.println("deleteData err :" + e);
			sqlSession.rollback();
		} finally {
			if(sqlSession != null) sqlSession.close();
		}		
		return b;
	}
}
