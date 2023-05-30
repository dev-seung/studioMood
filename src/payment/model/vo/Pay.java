package payment.model.vo;

public class Pay {
	String Concept;
	int CutNum;
	String rCheck;
	String Phone;
	public Pay() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getConcept() {
		return Concept;
	}
	public void setConcept(String concept) {
		Concept = concept;
	}
	public int getCutNum() {
		return CutNum;
	}
	public void setCutNum(int cutNum) {
		CutNum = cutNum;
	}
	public String getrCheck() {
		return rCheck;
	}
	public void setrCheck(String rCheck) {
		this.rCheck = rCheck;
	}
	public String getPhone() {
		return Phone;
	}
	public void setPhone(String phone) {
		Phone = phone;
	}
	public Pay(String concept, int cutNum, String rCheck, String phone) {
		super();
		Concept = concept;
		CutNum = cutNum;
		this.rCheck = rCheck;
		Phone = phone;
	}
	
}
