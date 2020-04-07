package Team.project.domain;

import java.io.Serializable;

public class Board implements Serializable {
  private static final long serialVersionUID = 1L;

  private int boardNo;
  private String title;
  private int classNo;
  private boolean notice;

  public int getBoardNo() {
    return boardNo;
  }
  public void setBoardNo(int boardNo) {
    this.boardNo = boardNo;
  }
  public int getClassNo() {
    return classNo;
  }
  public void setClassNo(int classNo) {
    this.classNo = classNo;
  }
  public String getTitle() {
    return title;
  }
  public void setTitle(String title) {
    this.title = title;
  }
  public boolean isNotice() {
    return notice;
  }
  public void setNotice(boolean notice) {
    this.notice = notice;
  }
}