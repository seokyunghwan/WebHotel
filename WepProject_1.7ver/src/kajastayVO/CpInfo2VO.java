package kajastayVO;

public class CpInfo2VO {
	String name;
	String romnum;
	String rmtype;
	String second_img;
	int rent_pr;
	int allday_pr;
	public CpInfo2VO() {}
	public CpInfo2VO(String name,String romnum,String rmtype,String second_img,int rent_pr,int allday_pr) {
		super();
		this.name = name;
		this.romnum = romnum;
		this.rmtype = rmtype;
		this.second_img = second_img;
		this.rent_pr = rent_pr;
		this.allday_pr = allday_pr;
	}
	public String getName() {
		return name;
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
	
}
