package post.model.vo;

public class Post {
	private int pNum;	//페이지수를 구하는 번호
	private int postNo;	//게시글 번호 p_num
	private String postTitle;
	private String postContent;
	private String postWriter;
	private String pDate;
	private String filename;
	private String filepath;
	public Post() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Post(int pNum, int postNo, String postTitle, String postContent, String memberId, String writeDate,
			String filename, String filepath) {
		super();
		this.pNum = pNum;
		this.postNo = postNo;
		this.postTitle = postTitle;
		this.postContent = postContent;
		this.postWriter = postWriter;
		this.pDate = pDate;
		this.filename = filename;
		this.filepath = filepath;
	}
	public int getpNum() {
		return pNum;
	}
	public void setpNum(int pNum) {
		this.pNum = pNum;
	}
	public int getPostNo() {
		return postNo;
	}
	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}
	public String getPostTitle() {
		return postTitle;
	}
	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}
	public String getPostContent() {
		return postContent;
	}
	public void setPostContent(String postContent) {
		this.postContent = postContent;
	}
	public String getPostContentBr() {
		return postContent.replaceAll("\r\n", "<br>");
	}
	public String getPostWriter() {
		return postWriter;
	}
	public void setPostWriter(String postWriter) {
		this.postWriter = postWriter;
	}
	public String getPDate() {
		return pDate;
	}
	public void setPDate(String pDate) {
		this.pDate = pDate;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getFilepath() {
		return filepath;
	}
	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}
	
}
