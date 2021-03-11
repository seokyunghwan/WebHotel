package kajastayVO;

public class MemVo {
	String id;
	String pw;
	String memname;
	String email;
	String tel;
	String type;
	public MemVo() {}
	public MemVo(String id, String pw, String memname, String email, String tel, String type) {
		super();
		this.id = id;
		this.pw = pw;
		this.memname = memname;
		this.email =email ;
		this.tel = tel;
		this.type = type;
	}
	public String getId() {
		return id;
	}
	public String getPw() {
		return pw;
	}
	public String getMemname() {
		return memname;
	}
	public String getEmail() {
		return email;
	}
	public String getTel() {
		return tel;
	}
	public String getType() {
		return type;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public void setMemname(String memname) {
		this.memname = memname;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
}
