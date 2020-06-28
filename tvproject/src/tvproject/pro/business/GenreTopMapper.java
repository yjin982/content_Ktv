package tvproject.pro.business;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface GenreTopMapper {
	
	@Select("select * from ktv_contents order by cont_title desc")////////////
	public List<GenreTopDto> selectTop10();
	
	@Select("select DISTINCT cont_genre from ktv_contents")
	public List<GenreTopDto> selectGenreAll();
	
	@Select("select cont_code, cont_title, cont_image from ktv_contents where cont_genre=#{cont_genre}")
	public List<GenreTopDto> selectGenrePro(String genre);
	
	@Select("select * from ktv_contents where cont_code=#{cont_code}")
	public GenreTopDto selectProDetail(String code);
	
	@Update("update ktv_contents set cont_like=#{cont_like} where cont_code=#{cont_code}")
	public int updateLike(GenreTopBean bean);
	
	
	@Select("select * from ktv_contents where cont_title like #{search_word}")
	public List<GenreTopDto> selectSearch(String search_word);
}
