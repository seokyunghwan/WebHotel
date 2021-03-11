package kajastayVO;

public class testReservationVO {
	String name;
	String id;
	String romnum;
	String in_date;
	String out_date;
	String tel;
	int price;
	String second_img;
	public testReservationVO(String name, String id, String romnum, String in_date, String out_date, String tel,
			int price, String second_img) {
		super();
		this.name = name;
		this.id = id;
		this.romnum = romnum;
		this.in_date = in_date;
		this.out_date = out_date;
		this.tel = tel;
		this.price = price;
		this.second_img = second_img;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getRomnum() {
		return romnum;
	}
	public void setRomnum(String romnum) {
		this.romnum = romnum;
	}
	public String getIn_date() {
		return in_date;
	}
	public void setIn_date(String in_date) {
		this.in_date = in_date;
	}
	public String getOut_date() {
		return out_date;
	}
	public void setOut_date(String out_date) {
		this.out_date = out_date;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getSecond_img() {
		return second_img;
	}
	public void setSecond_img(String second_img) {
		this.second_img = second_img;
	}
}
