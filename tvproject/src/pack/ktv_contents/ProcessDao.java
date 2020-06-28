package pack.ktv_contents;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;


import pack.mybatis.SqlMapConfig;

public class ProcessDao {
private SqlSessionFactory factory = SqlMapConfig.getSqlSession(); 
	
	public List<ContDataDto> selectDataAll() { 
		SqlSession sqlSession = factory.openSession();
		List <ContDataDto> list = null;
		
		try {
			SqlMapperInter1 inter = (SqlMapperInter1)sqlSession.getMapper(SqlMapperInter1.class);
			list = inter.selectDataAll();
		} catch (Exception e) {
			System.out.println("selectDataAll err : " + e);
		}finally {
			if(sqlSession != null) sqlSession.close();
		}
		return list;
	}
	
	public ContDataDto selectDataPart(String id) {
		SqlSession sqlSession = factory.openSession();
		ContDataDto dto =null;
		//System.out.println("------id" + id);
		try {
			SqlMapperInter1 inter = (SqlMapperInter1)sqlSession.getMapper(SqlMapperInter1.class);
			dto = inter.selectDataPart(id); 
			
		} catch (Exception e) {
			System.out.println("selectData err : " + e);
		}finally {
			if(sqlSession != null) sqlSession.close();
		}
		
		return dto;
	}
	
	public boolean insertData(ContDataBean bean){
		boolean b = false;
		SqlSession sqlSession = factory.openSession();
		try {
			SqlMapperInter1 inter = (SqlMapperInter1)sqlSession.getMapper(SqlMapperInter1.class);
			//System.out.println(inter.insertData(bean));
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
	
	public boolean updateData(ContDataBean bean){
		boolean b = false;
		SqlSession sqlSession = factory.openSession();
		
		try {
			SqlMapperInter1 inter = (SqlMapperInter1)sqlSession.getMapper(SqlMapperInter1.class);
			//System.out.println("dddddddddd"+bean.getCont_code() + " " + bean.getCont_title());
			//ContDataDto dto = inter.selectDataPart(bean.getCont_code());
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
	
	public boolean deleteData(ContDataBean bean){ 
		boolean b = false;
		SqlSession sqlSession = factory.openSession();
		try {
			SqlMapperInter1 inter = (SqlMapperInter1)sqlSession.getMapper(SqlMapperInter1.class);
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
