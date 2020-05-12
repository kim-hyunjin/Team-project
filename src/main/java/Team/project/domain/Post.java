package Team.project.domain;

import java.io.Serializable;
import java.sql.Date;

public class Post implements Serializable {

  private static final long serialVersionUID = 1L;

  private int postNo; // pk // fk - board_no(게시판번호) fk- member_no(작성자번호)
  private int boardNo;
  private int memberNo;
  private String title;
  private String content;
  private Date createDate;
  private String file;

  // association
  private Board board;
  private User user;


  public int getPostNo() {
    return postNo;
  }

  public void setPostNo(int postNo) {
    this.postNo = postNo;
  }

  public int getBoardNo() {
    return boardNo;
  }

  public void setBoardNo(int boardNo) {
    this.boardNo = boardNo;
  }

  public int getMemberNo() {
    return memberNo;
  }

  public void setMemberNo(int memberNo) {
    this.memberNo = memberNo;
  }

  public String getTitle() {
    return title;
  }

  public void setTitle(String title) {
    this.title = title;
  }

  public String getContent() {
    return content;
  }

  public void setContent(String content) {
    this.content = content;
  }

  public Date getCreateDate() {
    return createDate;
  }

  public void setCreateDate(Date createDate) {
    this.createDate = createDate;
  }

  public Board getBoard() {
    return board;
  }

  public void setBoard(Board board) {
    this.board = board;
  }

  public String getFile() {
    return file;
  }

  public void setFile(String file) {
    this.file = file;
  }


  public User getUser() {
    return user;
  }

  public void setUser(User user) {
    this.user = user;
  }

  @Override
  public String toString() {
    return "Post [postNo=" + postNo + ", boardNo=" + boardNo + ", memberNo=" + memberNo + ", title="
        + title + ", content=" + content + ", createDate=" + createDate + ", file=" + file
        + ", board=" + board + ", user=" + user + "]";
  }



}
