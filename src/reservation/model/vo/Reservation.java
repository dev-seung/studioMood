package reservation.model.vo;

public class Reservation {
	int rNum;
	String name;
	String phone;
	String rDate;
	String sTime;
	String eTime;
	String concept;
	int cutNum;
	String rCheck;
	String rPass;
	public Reservation() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Reservation(int rNum, String name, String phone, String rDate, String sTime, String eTime, String concept,
			int cutNum, String rCheck, String rPass) {
		super();
		this.rNum = rNum;
		this.name = name;
		this.phone = phone;
		this.rDate = rDate;
		this.sTime = sTime;
		this.eTime = eTime;
		this.concept = concept;
		this.cutNum = cutNum;
		this.rCheck = rCheck;
		this.rPass = rPass;
	}
	public int getrNum() {
		return rNum;
	}
	public void setrNum(int rNum) {
		this.rNum = rNum;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getrDate() {
		return rDate;
	}
	public void setrDate(String rDate) {
		this.rDate = rDate;
	}
	public String getsTime() {
		return sTime;
	}
	public void setsTime(String sTime) {
		this.sTime = sTime;
	}
	public String geteTime() {
		return eTime;
	}
	public void seteTime(String eTime) {
		this.eTime = eTime;
	}
	public String getConcept() {
		return concept;
	}
	public void setConcept(String concept) {
		this.concept = concept;
	}
	public int getCutNum() {
		return cutNum;
	}
	public void setCutNum(int cutNum) {
		this.cutNum = cutNum;
	}
	public String getrCheck() {
		return rCheck;
	}
	public void setrCheck(String rCheck) {
		this.rCheck = rCheck;
	}
	public String getrPass() {
		return rPass;
	}
	public void setrPass(String rPass) {
		this.rPass = rPass;
	}
	
}
