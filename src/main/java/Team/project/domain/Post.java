package Team.project.domain;

import java.io.Serializable;
import java.sql.Date;

public class Post implements Serializable {

  private static final long serialVersionUID = 1L;
  
  private int postNo; // pk // fk - board_no(게시판번호) fk- member_no(작성자번호)
  private String title; 
  private String content;
  private Date createDate;
  private String filePath;
  
  
  public int getPostNo() {
    return postNo;
  }
  public void setPostNo(int postNo) {
    this.postNo = postNo;
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
}
