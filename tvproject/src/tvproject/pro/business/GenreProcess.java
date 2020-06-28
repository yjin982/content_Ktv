package tvproject.pro.business;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import tvproject.pro.mybatis.SqlMapConfig;

public class GenreProcess {
	private SqlSessionFactory factory = SqlMapConfig.getSqlSession();
	
	public List<GenreTopDto> selectTop10(){ //인기순 작품 10개의 정보 가져오기
		SqlSession sqlSession = factory.openSession();
		List<GenreTopDto> list = null;
		
		try {
			GenreTopMapper mapper = (GenreTopMapper)sqlSession.getMapper(GenreTopMapper.class);
			list = mapper.selectTop10();
		}catch (Exception e) {
			System.out.println("selectTop10 err " + e);
		}finally {
			if(sqlSession != null) sqlSession.close();
		}
		
		return list;
	}
	
	
	public List<GenreTopDto> selectGenreAll(){ //장르명 가져오기
		SqlSession sqlSession = factory.openSession();
		List<GenreTopDto> list = null;
		
		try {
			GenreTopMapper mapper = (GenreTopMapper)sqlSession.getMapper(GenreTopMapper.class);
			list = mapper.selectGenreAll();
		}catch (Exception e) {
			System.out.println("selectGenreAll err " + e);
		}finally {
			if(sqlSession != null) sqlSession.close();
		}
		
		return list;
	}
	
	public List<GenreTopDto> selectGenrePro(String genre){ //장르별 작품 이름 가져오기
		SqlSession sqlSession = factory.openSession();
		List<GenreTopDto> list = null;
		
		try {
			GenreTopMapper mapper = (GenreTopMapper)sqlSession.getMapper(GenreTopMapper.class);
			list = mapper.selectGenrePro(genre);
		}catch (Exception e) {
			System.out.println("selectGenrePro err " + e);
		}
		return list;
	}
	
	public GenreTopDto selectProDetail(String code) { //코드를 가지고 작품 정보 가져오기
		SqlSession sqlSession = factory.openSession();
		GenreTopDto dto = null;
		
		try {
			GenreTopMapper mapper = (GenreTopMapper)sqlSession.getMapper(GenreTopMapper.class);
			dto = mapper.selectProDetail(code);
//			System.out.println(dto.getCont_code() + " " + dto.getCont_title() + " " + dto.getCont_genre());
		}catch (Exception e) {
			System.out.println("selectProDetail err " + e);
		}finally {
			if(sqlSession != null) sqlSession.close();
		}
		
		return dto;
	}
	
	public List<GenreTopDto> selectSearch(String search_word){ //검색결과 가져오기
		SqlSession sqlSession = factory.openSession();
		List<GenreTopDto> list = null;
		try {
			GenreTopMapper mapper = (GenreTopMapper)sqlSession.getMapper(GenreTopMapper.class);
			//System.out.println("----------" + search_word);
			search_word = "%"+search_word+"%";
			list = mapper.selectSearch(search_word);
		}catch (Exception e) {
			System.out.println("selectSearch err " + e);
		}finally {
			if(sqlSession != null) sqlSession.close();
		}
		
		return list;
	}
	
	public boolean updateLike(GenreTopBean bean) {
		SqlSession sqlSession = factory.openSession();
		boolean b = false;
		int l = bean.getCont_like();
		bean.setCont_like(l+1);
		try {
			GenreTopMapper mapper = (GenreTopMapper)sqlSession.getMapper(GenreTopMapper.class);
			if(mapper.updateLike(bean) > 0) {
				b = true;
				sqlSession.commit();
				//System.out.println(bean.getCont_like() + "좋아요");
			}
			
		}catch (Exception e) {
			System.out.println("updateLike err " + e);
			sqlSession.rollback();
		}finally {
			if(sqlSession != null) sqlSession.close();
		}
		
		return b;
	}
	
}
