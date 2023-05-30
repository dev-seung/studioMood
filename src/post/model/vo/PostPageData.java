package post.model.vo;

import java.util.ArrayList;

public class PostPageData {
	private ArrayList<Post> list;
	private String pageNavi;
	public PostPageData() {
		super();
		// TODO Auto-generated constructor stub
	}
	public PostPageData(ArrayList<Post> list, String pageNavi) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
	}
	public ArrayList<Post> getList() {
		return list;
	}
	public void setList(ArrayList<Post> list) {
		this.list = list;
	}
	public String getPageNavi() {
		return pageNavi;
	}
	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}
	
}
