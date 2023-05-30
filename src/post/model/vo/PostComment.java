package post.model.vo;

public class PostComment {
	private int postCommentNo;
	private int postCommentLevel;
	private String postCommentWriter;
	private String postCommentContent;
	private int postRef;
	private String postCommentDate;
	public PostComment() {
		super();
		// TODO Auto-generated constructor stub
	}
	public PostComment(int postCommentNo, int postCommentLevel, String postCommentWriter, String postCommentContent,
			int postRef, String postCommentDate) {
		super();
		this.postCommentNo = postCommentNo;
		this.postCommentLevel = postCommentLevel;
		this.postCommentWriter = postCommentWriter;
		this.postCommentContent = postCommentContent;
		this.postRef = postRef;
		this.postCommentDate = postCommentDate;
	}
	public int getPostCommentNo() {
		return postCommentNo;
	}
	public void setPostCommentNo(int postCommentNo) {
		this.postCommentNo = postCommentNo;
	}
	public int getPostCommentLevel() {
		return postCommentLevel;
	}
	public void setPostCommentLevel(int postCommentLevel) {
		this.postCommentLevel = postCommentLevel;
	}
	public String getPostCommentWriter() {
		return postCommentWriter;
	}
	public void setPostCommentWriter(String postCommentWriter) {
		this.postCommentWriter = postCommentWriter;
	}
	public String getPostCommentContentBr() {
		return postCommentContent.replaceAll("\r\n", "<br>");
	}
	public String getPostCommentContent() {
		return postCommentContent;
	}
	public void setPostCommentContent(String postCommentContent) {
		this.postCommentContent = postCommentContent;
	}
	public int getPostRef() {
		return postRef;
	}
	public void setPostRef(int postRef) {
		this.postRef = postRef;
	}
	public String getPostCommentDate() {
		return postCommentDate;
	}
	public void setPostCommentDate(String postCommentDate) {
		this.postCommentDate = postCommentDate;
	}
	
}
