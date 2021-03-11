package kajastayVO;

public class RoomVO {
	String romnum;
	String rmtype;
	String second_img;
	int rent_pr ;
	int allday_pr;
	public RoomVO() {}
	public RoomVO(String romnum, String rmtype, String second_img, int rent_pr, int allday_pr) {
		super();
		this.romnum=romnum;
		this.rmtype=rmtype;
		this.second_img=second_img;
		this.rent_pr=rent_pr;
		this.allday_pr=allday_pr;
	}
	public String getRomnum() {
		return romnum;
	}
	public String getRmtype() {
		return rmtype;
	}
	public String getSecond_img() {
		return second_img;
	}
	public int getRent_pr() {
		return rent_pr;
	}
	public int getAllday_pr() {
		return allday_pr;
	}
	public void setRomnum(String romnum) {
		this.romnum = romnum;
	}
	public void setRmtype(String rmtype) {
		this.rmtype = rmtype;
	}
	public void setSecond_img(String second_img) {
		this.second_img = second_img;
	}
	public void setRent_pr(int rent_pr) {
		this.rent_pr = rent_pr;
	}
	public void setAllday_pr(int allday_pr) {
		this.allday_pr = allday_pr;
	}
}
