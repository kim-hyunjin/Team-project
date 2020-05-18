package Team.project.domain;

import java.io.Serializable;
import java.sql.Date;

public class Question implements Serializable {

  private static final long serialVersionUID = 1L;

  private int questionNo;
  private int classNo;
  private int memberNo;
  private String title;
  private String content;
  private String filePath; // 실제론 UUID로 생성된 파일 ID가 들어감
  private Date deadline;
  private Date createDate;
  private Date startDate;
  public int getQuestionNo() {
    return questionNo;
  }
  public void setQuestionNo(int questionNo) {
    this.questionNo = questionNo;
  }
  public int getClassNo() {
    return classNo;
  }
  public void setClassNo(int classNo) {
    this.classNo = classNo;
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
  public String getFilePath() {
    return filePath;
  }
  public void setFilePath(String filePath) {
    this.filePath = filePath;
  }
  public Date getDeadline() {
    return deadline;
  }
  public void setDeadline(Date deadline) {
    this.deadline = deadline;
  }
  public Date getCreateDate() {
    return createDate;
  }
  public void setCreateDate(Date createDate) {
    this.createDate = createDate;
  }
  public Date getStartDate() {
    return startDate;
  }
  public void setStartDate(Date startDate) {
    this.startDate = startDate;
  }
  @Override
  public String toString() {
    return "Question [questionNo=" + questionNo + ", classNo=" + classNo + ", memberNo=" + memberNo
        + ", title=" + title + ", content=" + content + ", filePath=" + filePath + ", deadline="
        + deadline + ", createDate=" + createDate + ", startDate=" + startDate + "]";
  }
  
   


}
