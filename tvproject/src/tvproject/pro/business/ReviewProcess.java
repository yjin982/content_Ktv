package tvproject.pro.business;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import tvproject.pro.mybatis.SqlMapConfig;

public class ReviewProcess {
	private SqlSessionFactory factory = SqlMapConfig.getSqlSession();
	
	public boolean insertReview(ReviewBean bean) { //리뷰 작성
		boolean b = false;
		SqlSession sqlSession = factory.openSession();
		
		try {
			ReviewMapper mapper = (ReviewMapper)sqlSession.getMapper(ReviewMapper.class);
			
			bean.setRev_no(Integer.toString(mapper.getMaxNo() + 1));
			//System.out.println("-----" + bean.getRev_no());
			
			if(mapper.insertReview(bean) > 0) {
				b = true;
				sqlSession.commit();
			}
			
		}catch (Exception e) {
			System.out.println("insertReview err " + e);
			sqlSession.rollback();
		}finally {
			if(sqlSession != null) sqlSession.close();
		}
		
		return b;
	}
	
	public List<ReviewDto> getAllReview(String rev_ccode){ //리뷰 가져오기
		SqlSession sqlSession = factory.openSession();
		List<ReviewDto> list = null;
		
		try {
			ReviewMapper inter = (ReviewMapper)sqlSession.getMapper(ReviewMapper.class); //object으로 주기때문에 인터페이스로 캐스팅
			list = inter.getAllReview(rev_ccode);
		}catch (Exception e) {
			System.out.println("getAllReview err " + e);
		}finally {
			if(sqlSession != null) sqlSession.close();
		}
		
		return list;
	}
	
	public String getGogekCode(String id) { //고객 코드 가져오기
		SqlSession sqlSession = factory.openSession();
		String s = "";
		//System.out.println("프로세스의 " + id);
		try {
			ReviewMapper inter = (ReviewMapper)sqlSession.getMapper(ReviewMapper.class); //object으로 주기때문에 인터페이스로 캐스팅
			s = inter.getGogekCode(id);
			//System.out.println("셀렉트한 코드값" + s);
		}catch (Exception e) {
			System.out.println("getGogekCode err " + e);
		}finally {
			if(sqlSession != null) sqlSession.close();
		}
		
		return s;
	}
	
	public String getGogekId(String id) {
		SqlSession sqlSession = factory.openSession();
		//System.out.println("받아온 아이디이이ㅣ" + id);
		String s = "";
		//System.out.println("프로세스의 " + id);
		try {
			ReviewMapper inter = (ReviewMapper)sqlSession.getMapper(ReviewMapper.class);
			s = inter.getGogekId(id);
			//System.out.println("아이디이이ㅣ" + s);
		}catch (Exception e) {
			System.out.println("getGogekId err " + e);
		}finally {
			if(sqlSession != null) sqlSession.close();
		}
		
		return s;
	}
}
