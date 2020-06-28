package tvproject.pro.business;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

public interface ReviewMapper {
	@Select("SELECT gogek_code FROM ktv_gogek WHERE gogek_id = #{gogek_id}") //아이디에 해당하는 코드 가져오기
    public String getGogekCode(String id);
	
	@Select("SELECT gogek_id FROM ktv_gogek WHERE gogek_code = #{gogek_code}") //아이디에 해당하는 코드 가져오기
    public String getGogekId(String id);
	
	@Select("SELECT count(rev_no) as MaxNo FROM ktv_review") //리뷰테이블 최근 번호 가져오기
    public int getMaxNo();
	
	@Select("SELECT cont_title FROM ktv_contents where cont_code=#{rev_ccode}") //작품코드로 작품명 가져오기
    public String getContTitle(String id);
	
	@Select("Select * from ktv_review where rev_ccode=#{rev_ccode}") //작품코드에 해당하는 전체 리뷰 가져오기
	public List<ReviewDto> getAllReview(String rev_ccode);
	
	@Insert("insert into ktv_review values(#{rev_no}, #{rev_gcode}, #{rev_ccode}, #{rev_title},#{rev_pw}, #{rev_cont})")
	public int insertReview(ReviewBean bean);
}
