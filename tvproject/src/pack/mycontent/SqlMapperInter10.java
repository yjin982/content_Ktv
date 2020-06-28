package pack.mycontent;

import java.util.List;

import org.apache.ibatis.annotations.Select;

public interface SqlMapperInter10 {	


		@Select("select * from ktv_contents")
		public List<MycontDto> selectDataAll();  
	//	
//		@Select("select cont_code,cont_title,cont_date,cont_genre,cont_info,cont_like,cont_image from ktv_contents where cont_code=#{cont_code}")
//		public ContDataDto selectDataPart(String id);
	//	
//		@Insert("insert into ktv_contents values(#{cont_code},#{cont_title},#{cont_date},#{cont_genre},#{cont_info},#{cont_like},#{cont_image})")
//		public int insertData(ContDataBean bean);
	//	
//		@Update("update ktv_contents set cont_title=#{cont_title},cont_date=#{cont_date},cont_genre=#{cont_genre},cont_info=#{cont_info},cont_image=#{cont_image} where cont_code=#{cont_code}")
//		public int updateData(ContDataBean bean);
	//	
//		@Delete("delete from ktv_contents where cont_code=#{cont_code}")
//		public int deleteData(ContDataBean bean);
	}


