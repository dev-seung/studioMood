package post.model.vo;

import java.util.ArrayList;

public class PostViewData {
	private Post p;
	private ArrayList<PostComment> list;
	public PostViewData() {
		super();
		// TODO Auto-generated constructor stub
	}
	public PostViewData(Post p, ArrayList<PostComment> list) {
		super();
		this.p = p;
		this.list = list;
	}
	public Post getP() {
		return p;
	}
	public void setP(Post p) {
		this.p = p;
	}
	public ArrayList<PostComment> getList() {
		return list;
	}
	public void setList(ArrayList<PostComment> list) {
		this.list = list;
	}
	
}
