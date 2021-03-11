package kajastayVO;

public class CpInfo1VO {
	String name;
	String memname;
	String cptype;
	String cp_address;
	String cp_tel;
	String cp_detail;
	String cp_detail2;
	String first_img;
	public CpInfo1VO() {}
	public CpInfo1VO(String name, String memname, String cptype, String cp_address, String cp_tel, String cp_detail, String cp_detail2, String first_img) {
		super();
		this.name = name;
		this.memname = memname;
		this.cptype = cptype;
		this.cp_address = cp_address;
		this.cp_tel = cp_tel;
		this.cp_detail = cp_detail;
		this.cp_detail2 = cp_detail2;
		this.first_img = first_img;
	}
	public String getName() {
		return name;
	}
	public String getMemname() {
		return memname;
	}
	public String getCptype() {
		return cptype;
	}
	public String getCp_address() {
		return cp_address;
	}
	public String getCp_tel() {
		return cp_tel;
	}
	public String getCp_detail() {
		return cp_detail;
	}
	public String getCp_detail2() {
		return cp_detail2;
	}
	public String getFirst_img() {
		return first_img;
	}
}
