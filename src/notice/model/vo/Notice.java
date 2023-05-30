package notice.model.vo;

public class Notice {
	private int rNum;
	private int noticeNo;	//게시글 넘버
	private String noticeTitle;
	private String noticeContent;
	private String noticeWriter;
	private String noticeDate;
	public Notice() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Notice(int rNum, int noticeNo, String noticeTitle, String noticeContent, String noticeWriter,
			String noticeDate) {
		super();
		this.rNum = rNum;
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.noticeWriter = noticeWriter;
		this.noticeDate = noticeDate;
	}
	public int getrNum() {
		return rNum;
	}
	public void setrNum(int rNum) {
		this.rNum = rNum;
	}
	public int getNoticeNo() {
		return noticeNo;
	}
	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}
	public String getNoticeTitle() {
		return noticeTitle;
	}
	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}
	public String getNoticeContent() {
		return noticeContent;
	}
	public String getNoticeContentBr() {
		return noticeContent.replaceAll("\r\n","<br>");
	}
	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}
	public String getNoticeWriter() {
		return noticeWriter;
	}
	public void setNoticeWriter(String noticeWriter) {
		this.noticeWriter = noticeWriter;
	}
	public String getNoticeDate() {
		return noticeDate;
	}
	public void setNoticeDate(String noticeDate) {
		this.noticeDate = noticeDate;
	}
}
