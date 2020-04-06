package Team.project.domain;

import java.sql.Date;

public class Message {
  private String content;
  private Date createDate;


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
}
