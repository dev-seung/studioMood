package faq.model.vo;

public class Faq {
	private int fNum;
	private int faqNo;
	private String faqTitle;
	private String faqContent;
	public Faq() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Faq(int fNum, int faqNo, String faqTitle, String faqContent) {
		super();
		this.fNum = fNum;
		this.faqNo = faqNo;
		this.faqTitle = faqTitle;
		this.faqContent = faqContent;
	}
	public int getfNum() {
		return fNum;
	}
	public void setfNum(int fNum) {
		this.fNum = fNum;
	}
	public int getFaqNo() {
		return faqNo;
	}
	public void setFaqNo(int faqNo) {
		this.faqNo = faqNo;
	}
	public String getFaqTitle() {
		return faqTitle;
	}
	public void setFaqTitle(String faqTitle) {
		this.faqTitle = faqTitle;
	}
	public String getFaqContent() {
		return faqContent;
	}
	public String getFaqContentBr() {
		return faqContent.replaceAll("\r\n","<br>");
	}
	public void setFaqContent(String faqContent) {
		this.faqContent = faqContent;
	}


}
