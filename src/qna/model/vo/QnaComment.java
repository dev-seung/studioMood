package qna.model.vo;

public class QnaComment {
	private int qnaCommentNo;
	private String qnaCommentWriter;
	private String qnaCommentContent;
	private int qnaRef;
	private String qnaCommentDate;
	public QnaComment() {
		super();
		// TODO Auto-generated constructor stub
	}
	public QnaComment(int qnaCommentNo, String qnaCommentWriter, String qnaCommentContent,
			int qnaRef, String qnaCommentDate) {
		super();
		this.qnaCommentNo = qnaCommentNo;
		this.qnaCommentWriter = qnaCommentWriter;
		this.qnaCommentContent = qnaCommentContent;
		this.qnaRef = qnaRef;
		this.qnaCommentDate = qnaCommentDate;
	}
	public int getQnaCommentNo() {
		return qnaCommentNo;
	}
	public void setQnaCommentNo(int qnaCommentNo) {
		this.qnaCommentNo = qnaCommentNo;
	}
	public String getQnaCommentWriter() {
		return qnaCommentWriter;
	}
	public void setQnaCommentWriter(String qnaCommentWriter) {
		this.qnaCommentWriter = qnaCommentWriter;
	}
	public String getQnaCommentContentBr() {
		return qnaCommentContent.replaceAll("\r\n", "<br>");
	}
	public String getQnaCommentContent() {
		return qnaCommentContent;
	}
	public void setQnaCommentContent(String qnaCommentContent) {
		this.qnaCommentContent = qnaCommentContent;
	}
	public int getQnaRef() {
		return qnaRef;
	}
	public void setQnaRef(int qnaRef) {
		this.qnaRef = qnaRef;
	}
	public String getQnaCommentDate() {
		return qnaCommentDate;
	}
	public void setQnaCommentDate(String qnaCommentDate) {
		this.qnaCommentDate = qnaCommentDate;
	}

}
