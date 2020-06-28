package pack.business;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import pack.mybatis.SqlMapConfig;

public class GogekProcess {
	private SqlSessionFactory factory = SqlMapConfig.getSqlSession();

	public boolean selectDataPart(String id) {
		SqlSession sqlSession = factory.openSession();
		GogekDto dto = null;
		boolean b = false;
		try {
			SqlMapperInter inter = (SqlMapperInter) sqlSession.getMapper(SqlMapperInter.class);
			dto = inter.selectDataPart(id);
			System.out.println("-------" + dto.getGogek_id() + " ---" +
			dto.getGogek_code());
			if (dto != null) {
				b = true;
			}
		} catch (Exception e) {
			System.out.println("selectDataPart err : " + e);
		} finally {
			if (sqlSession != null)
				sqlSession.close();
		}
		return b;
	}

	public boolean insertData(GogekBean bean) {
		boolean b = false;
		SqlSession sqlSession = factory.openSession();
		try {
			SqlMapperInter inter = (SqlMapperInter) sqlSession.getMapper(SqlMapperInter.class);
			// 마지막코드번호
			int lastCode = inter.getlastCode();
			bean.setGogek_code(lastCode + 1);
			// System.out.println(lastCode + " " + bean.getGogek_code());
			if (inter.insertData(bean) > 0) {
				b = true;
				sqlSession.commit();
			}

		} catch (Exception e) {
			System.out.println("insertData err : " + e);
			sqlSession.rollback();
		} finally {
			if (sqlSession != null)
				sqlSession.close();
		}
		return b;
	}

	public boolean checkId(String id) {
		boolean b = false;
		//System.out.println("1번 " + id);
		SqlSession sqlSession = factory.openSession();
		try {
			SqlMapperInter inter = (SqlMapperInter) sqlSession.getMapper(SqlMapperInter.class);
			GogekDto dto = null;
			dto = inter.selectDataPart(id); 
			
			//아이디 비교
			if (id.equalsIgnoreCase(dto.getGogek_id())) {
				if (dto.getGogek_code() > 0) {
					b = true;
				}
			}
		} catch (Exception e) {
			System.out.println("checkId err : " + e);
		} finally {
			if (sqlSession != null)
				sqlSession.close();
		}

		return b;
	}
	
	
	public boolean selectData(GogekBean bean) {
		boolean b = false;
		SqlSession sqlSession = factory.openSession();
		try {
			SqlMapperInter inter = (SqlMapperInter) sqlSession.getMapper(SqlMapperInter.class);
				
			//아이디 비밀번호 비교
			GogekDto dto = inter.selectDataPart(bean.getGogek_id());
			
			if (dto.getGogek_pw().equalsIgnoreCase(bean.getGogek_pw())) {
				if (dto.getGogek_code() > 0) {
					b = true;
				}
			}
		} catch (Exception e) {
			System.out.println("checkId err : " + e);
		} finally {
			if (sqlSession != null)
				sqlSession.close();
		}

		return b;
		
	}

}
