package gallery.model.vo;

public class Gallery {
	int rNum;
	int gNum;
	String gWriter;
	String gContent;
	String gFilename;
	String gFilePath; 
	public int getrNum() {
		return rNum;
	}
	public void setrNum(int rNum) {
		this.rNum = rNum;
	}
	public int getgNum() {
		return gNum;
	}
	public void setgNum(int gNum) {
		this.gNum = gNum;
	}
	public String getgWriter() {
		return gWriter;
	}
	public void setgWriter(String gWriter) {
		this.gWriter = gWriter;
	}
	public String getgContent() {
		return gContent;
	}
	public void setgContent(String gContent) {
		this.gContent = gContent;
	}
	public String getgFilename() {
		return gFilename;
	}
	public void setgFilename(String gFilename) {
		this.gFilename = gFilename;
	}
	public String getgFilePath() {
		return gFilePath;
	}
	public void setgFilePath(String gFilePath) {
		this.gFilePath = gFilePath;
	}
	public Gallery() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Gallery(int gNum, String gWriter, String gContent, String gFilename, String gFilePath) {
		super();
		this.gNum = gNum;
		this.gWriter = gWriter;
		this.gContent = gContent;
		this.gFilename = gFilename;
		this.gFilePath = gFilePath;
	}
	
}
