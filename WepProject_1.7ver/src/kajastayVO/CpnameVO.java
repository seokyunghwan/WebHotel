package kajastayVO;

public class CpnameVO {
	String name;//�����̸�
	String id;//�����ھ��̵�
	String cptype;//����Ÿ��
	String cp_address;//�����ּ�
	String cp_tel;//������ȭ��ȣ
	String cp_detail;//�ǳ�
	String cp_detail2;//�ǿ�
	String first_img;//�����̹���
	int rent_pr;//���� ��
	int allday_pr;//����� ��
	String rmtype;//��Ÿ��
	double grade;//����
	public CpnameVO() {}
	public CpnameVO(String name, String id, String cptype, String cp_address
			, String cp_tel, String cp_detail,String cp_detail2, String first_img
			, int rent_pr, int allday_pr, String rmtype,double grade) {
		super();
		this.name=name;
		this.id=id;
		this.cptype=cptype;
		this.cp_address=cp_address;
		this.cp_tel=cp_tel;
		this.cp_detail=cp_detail;
		this.cp_detail2=cp_detail2;
		this.first_img=first_img;
		this.rent_pr=rent_pr;
		this.allday_pr=allday_pr;
		this.rmtype=rmtype;
		this.grade=grade;
	}
	public String getName() {
		return name;
	}
	public String getId() {
		return id;
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
	public int getRent_pr() {
		return rent_pr;
	}
	public int getAllday_pr() {
		return allday_pr;
	}
	public String getRmtype() {
		return rmtype;
	}
	public double getGrade() {
		return grade;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setId(String id) {
		this.id = id;
	}
	public void setCptype(String cptype) {
		this.cptype = cptype;
	}
	public void setCp_address(String cp_address) {
		this.cp_address = cp_address;
	}
	public void setCp_tel(String cp_tel) {
		this.cp_tel = cp_tel;
	}
	public void setCp_detail(String cp_detail) {
		this.cp_detail = cp_detail;
	}
	public void setCp_detail2(String cp_detail2) {
		this.cp_detail2 = cp_detail2;
	}
	public void setFirst_img(String first_img) {
		this.first_img = first_img;
	}
	public void setRent_pr(int rent_pr) {
		this.rent_pr = rent_pr;
	}
	public void setAllday_pr(int allday_pr) {
		this.allday_pr = allday_pr;
	}
	public void setRmtype(String rmtype) {
		this.rmtype = rmtype;
	}
	public void setGrade(double grade) {
		this.grade = grade;
	}
}
