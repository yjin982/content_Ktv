package pack.mycontent;

import java.sql.Timestamp;

public class MycontDto {
	private String buy_gcode, buy_ccode;
	private Timestamp buy_date;
	
	public String getBuy_gcode() {
		return buy_gcode;
	}
	public void setBuy_gcode(String buy_gcode) {
		this.buy_gcode = buy_gcode;
	}
	public String getBuy_ccode() {
		return buy_ccode;
	}
	public void setBuy_ccode(String buy_ccode) {
		this.buy_ccode = buy_ccode;
	}
	public Timestamp getBuy_date() {
		return buy_date;
	}
	public void setBuy_date(Timestamp buy_date) {
		this.buy_date = buy_date;
	}
	
	
}
