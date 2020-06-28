package tvproject.pro.mybatis;

import java.io.Reader;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import tvproject.pro.business.GenreTopMapper;
import tvproject.pro.business.ReviewMapper;

public class SqlMapConfig {
	public static SqlSessionFactory sqlSession; // sql 사용시 필요 메소드를 가지고 있음. (Factory= 스스로 new)
	
	static {
		String source = "tvproject/pro/mybatis/Configuration.xml";
		
		try {
			Reader reader = Resources.getResourceAsReader(source); //설정파일을 읽어서
			sqlSession = new SqlSessionFactoryBuilder().build(reader); //세션으로 넘겨줌(웹에서의 세션 X, 하나의 작업단위)
			reader.close();
			
			//mybatis Annotation을 사용할 경우 추가 코드
			Class[] mappers = {GenreTopMapper.class, ReviewMapper.class}; //인터페이스 더 있으면 {} 안에 , 찍고 더 쓰기(그래서 배열)
			for(Class m:mappers) { //mappers의 갯수만큼
				//Mapper등록
				sqlSession.getConfiguration().addMapper(m); //세션에 db연결정보 + sql문까지 추가
			}
		}catch (Exception e) {
			System.out.println("SqlMapConfig err");
			e.printStackTrace();
		}
	}
	
	public static SqlSessionFactory getSqlSession() { 
		return sqlSession;
	}
}
