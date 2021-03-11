package kajastayVO;

import java.util.Date;

public class bkVO {
	int bkcode;
	String name;
	String memname;
	String tel;
	String romnum;
	Date in_date;
	Date out_date;
	int price;
	String flag;
	String second_img;
	public bkVO() {}
	public bkVO(int bkcode, String name, String memname, String tel, String romnum, Date in_date, Date out_date, int price, String flag, String second_img) {
		super();
		this.bkcode=bkcode;
		this.name = name;
		this.memname = memname;
		this.tel = tel;
		this.romnum = romnum;
		this.in_date = in_date;
		this.out_date = out_date;
		this.price = price;
		this.flag=flag;
		this.second_img = second_img;
	}
	public int getBkcode() {
		return bkcode;
	}
	public String getName() {
		return name;
	}
	public String getMemname() {
		return memname;
	}
	public String getTel() {
		return tel;
	}
	public String getRomnum() {
		return romnum;
	}
	public Date getIn_date() {
		return in_date;
	}
	public Date getOut_date() {
		return out_date;
	}
	public int getPrice() {
		return price;
	}
	public String getFlag() {
		return flag;
	}
	public String getSecond_img() {
		return second_img;
	}
	public void setBkcode(int bkcode) {
		this.bkcode = bkcode;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setMemname(String memname) {
		this.memname = memname;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public void setRomnum(String romnum) {
		this.romnum = romnum;
	}
	public void setIn_date(Date in_date) {
		this.in_date = in_date;
	}
	public void setOut_date(Date out_date) {
		this.out_date = out_date;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	public void setSecond_img(String second_img) {
		this.second_img = second_img;
	}
}
