package pack.ktv_contents;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface SqlMapperInter1 {
	@Select("select * from ktv_contents")
	public List<ContDataDto> selectDataAll();
	
	@Select("select cont_code,cont_title,cont_date,cont_genre,cont_info,cont_like,cont_image from ktv_contents where cont_code=#{cont_code}")
	public ContDataDto selectDataPart(String id);
	
	@Insert("insert into ktv_contents values(#{cont_code},#{cont_title},#{cont_date},#{cont_genre},#{cont_info},#{cont_like},#{cont_image})")
	public int insertData(ContDataBean bean);
	
	@Update("update ktv_contents set cont_title=#{cont_title},cont_date=#{cont_date},cont_genre=#{cont_genre},cont_info=#{cont_info},cont_image=#{cont_image} where cont_code=#{cont_code}")
	public int updateData(ContDataBean bean);
	
	@Delete("delete from ktv_contents where cont_code=#{cont_code}")
	public int deleteData(ContDataBean bean);
	
}
