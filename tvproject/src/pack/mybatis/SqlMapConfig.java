package pack.mybatis;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import pack.business.SqlMapperInter;
import pack.ktv_contents.SqlMapperInter1;
import pack.ktv_gogek.SqlMapperInter2;
import pack.mycontent.SqlMapperInter10;

public class SqlMapConfig {
	public static SqlSessionFactory sqlSession;

	static {
		String source = "pack/mybatis/Configuration.xml";

		try {
			Reader reader = Resources.getResourceAsReader(source);
			sqlSession = new SqlSessionFactoryBuilder().build(reader);
			reader.close();

			Class[] mappers = {SqlMapperInter.class, SqlMapperInter1.class, SqlMapperInter2.class, SqlMapperInter10.class};
			for (Class m : mappers) {
				// Mapper 등록
				sqlSession.getConfiguration().addMapper(m);
			}

		} catch (Exception e) {
			System.out.println("SqlMapConfig err : " + e);
		}
	}

	public static SqlSessionFactory getSqlSession() {
		return sqlSession;
	}
}
