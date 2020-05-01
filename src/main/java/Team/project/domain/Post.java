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
  private String filePath;
  private Board board;
  // association

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

  public String getFilePath() {
    return filePath;
  }

  public void setFilePath(String filePath) {
    this.filePath = filePath;
  }

  public Board getBoard() {
    return board;
  }

  public void setBoard(Board board) {
    this.board = board;
  }



}
