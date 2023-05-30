package qna.model.vo;

import java.util.ArrayList;

public class QnaViewData {
	private Qna q;
	private ArrayList<QnaComment> list;
	public QnaViewData() {
		super();
		// TODO Auto-generated constructor stub
	}
	public QnaViewData(Qna q, ArrayList<QnaComment> list) {
		super();
		this.q = q;
		this.list = list;
	}
	public Qna getQ() {
		return q;
	}
	public void setQ(Qna q) {
		this.q = q;
	}
	public ArrayList<QnaComment> getList() {
		return list;
	}
	public void setList(ArrayList<QnaComment> list) {
		this.list = list;
	}

}
