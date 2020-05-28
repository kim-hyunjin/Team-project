package Team.project.domain;

import java.io.Serializable;
import java.sql.Date;

public class Assignment implements Serializable {

  private static final long serialVersionUID = 1L;

  private int assignmentNo;
  private int classNo;
  private int memberNo;
  private String title;
  private String content;
  private String file;
  private String standard;
  private Date createDate;
  private Date startDate;
  private Date deadline;

  public int getAssignmentNo() {
    return assignmentNo;
  }

  public void setAssignmentNo(int assignmentNo) {
    this.assignmentNo = assignmentNo;
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

  public String getFile() {
    return file;
  }

  public void setFile(String file) {
    this.file = file;
  }

  public String getStandard() {
    return standard;
  }

  public void setStandard(String standard) {
    this.standard = standard;
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

  public Date getDeadline() {
    return deadline;
  }

  public void setDeadline(Date deadline) {
    this.deadline = deadline;
  }

  @Override
  public String toString() {
    return "Assignment [assignmentNo=" + assignmentNo + ", classNo=" + classNo + ", memberNo="
        + memberNo + ", title=" + title + ", content=" + content + ", file=" + file + ", standard="
        + standard + ", createDate=" + createDate + ", startDate=" + startDate + ", deadline="
        + deadline + "]";
  }

}
