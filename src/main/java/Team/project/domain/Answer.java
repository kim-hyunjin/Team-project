package Team.project.domain;

import java.io.Serializable;
import java.sql.Date;

public class Answer implements Serializable {
  private static final long serialVersionUID = 1L;
  private int memberNo;
  private int questionNo;
  private String content;
  private int multipleNo;
  private Date createDate;
  private User user;


  public int getMemberNo() {
    return memberNo;
  }

  public void setMemberNo(int memberNo) {
    this.memberNo = memberNo;
  }

  public int getQuestionNo() {
    return questionNo;
  }

  public void setQuestionNo(int questionNo) {
    this.questionNo = questionNo;
  }

  public int getMultipleNo() {
    return multipleNo;
  }

  public void setMultipleNo(int multipleNo) {
    this.multipleNo = multipleNo;
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

  public User getUser() {
    return user;
  }

  public void setUser(User user) {
    this.user = user;
  }


}
