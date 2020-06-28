package pack.ktv_gogek;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface SqlMapperInter2 {
	@Select("select * from ktv_gogek")
	public List<GogekDto> selectDataAll();
	
	@Select("select gogek_code,gogek_id,gogek_pw,gogek_birth,gogek_regdate,gogek_cash from ktv_gogek where gogek_code=#{gogek_code}")
	public GogekDto selectDataPart(String id);
	
	@Insert("insert into ktv_gogek values(#{gogek_code},#{gogek_id},#{gogek_pw},#{gogek_birth},#{gogek_regdate},#{gogek_cash})")
	public int insertData(GogekBean bean);
	
	@Update("update ktv_gogek set gogek_id=#{gogek_id},gogek_pw=#{gogek_pw},gogek_birth=#{gogek_birth},gogek_regdate=#{gogek_regdate},gogek_cash=#{gogek_cash} where gogek_code=#{gogek_code}")
	public int updateData(GogekBean bean);
	
	@Delete("delete from ktv_gogek where gogek_code=#{gogek_code}")
	public int deleteData(GogekBean bean);
	
}
