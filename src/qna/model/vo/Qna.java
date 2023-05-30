package qna.model.vo;

public class Qna {
	private int qNum;	//
	private int qnaNo;	//공지사항 번호
	private String qTitle;
	private String qWriter;
	private String qContent;
	private String qDate;
	private String openChk;
	public Qna() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Qna(int qNum, int qnaNo, String qTitle, String qWriter, String qContent, String qDate, String openChk) {
		super();
		this.qNum = qNum;
		this.qnaNo = qnaNo;
		this.qTitle = qTitle;
		this.qWriter = qWriter;
		this.qContent = qContent;
		this.qDate = qDate;
		this.openChk = openChk;
	}
	public int getqNum() {
		return qNum;
	}
	public void setqNum(int qNum) {
		this.qNum = qNum;
	}
	public int getQnaNo() {
		return qnaNo;
	}
	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}
	public String getqTitle() {
		return qTitle;
	}
	public void setqTitle(String qTitle) {
		this.qTitle = qTitle;
	}
	public String getqWriter() {
		return qWriter;
	}
	public void setqWriter(String qWriter) {
		this.qWriter = qWriter;
	}
	public String getQContentBr() {
		return qContent.replaceAll("\r\n", "<br>");
	}
	public String getqContent() {
		return qContent;
	}
	public void setqContent(String qContent) {
		this.qContent = qContent;
	}
	public String getqDate() {
		return qDate;
	}
	public void setqDate(String qDate) {
		this.qDate = qDate;
	}
	public String getOpenChk() {
		return openChk;
	}
	public void setOpenChk(String openChk) {
		this.openChk = openChk;
	}

}
