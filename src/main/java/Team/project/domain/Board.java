package Team.project.domain;

import java.io.Serializable;

public class Board implements Serializable {
	private static final long serialVersionUID = 1L;
	private int boardNo; // pk // fk - class_no (클래스번호)
	private String title;
	private int classNo;
	private int notice; // 0 : 모두 작성 가능, 1 : 선생님만 글 작성 가능

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getClassNo() {
		return classNo;
	}

	public void setClassNo(int classNo) {
		this.classNo = classNo;
	}

	public int getNotice() {
		return notice;
	}

	public void setNotice(int notice) {
		this.notice = notice;
	}

	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", title=" + title + ", classNo=" + classNo + ", notice=" + notice + "]";
	}

}
