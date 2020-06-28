package pack.business;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

public interface SqlMapperInter {
	
	//회원 추가
	@Insert("insert into ktv_gogek (gogek_code, gogek_id, gogek_pw, gogek_birth, gogek_regdate) "
			+ "values(#{gogek_code},#{gogek_id},#{gogek_pw},#{gogek_birth},now())")
	public int insertData(GogekBean bean);
	
	//아이디 확인용
	@Select("select * from ktv_gogek where gogek_id=#{id}")
	public GogekDto selectDataPart(String id);
	
	//아이디 중복확인	
	@Select("select * from ktv_gogek where gogek_id=#{gogek_id}")
	public GogekDto checkId(String gogek_id);
	
	//마지막 코드번호
	@Select("select count(gogek_code) as count from ktv_gogek")
	public int getlastCode();
	
	}
