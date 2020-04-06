package Team.project.domain;

import java.sql.Date;

public class Assignment_submmit {
  private int member_no;
  private int assignment_no;
  private String file;
  private int score;
  private String content;
  private String feedback;
  private Date create_date;

  public int getMember_no() {
    return member_no;
  }
  public void setMember_no(int member_no) {
    this.member_no = member_no;
  }
  public int getAssignment_no() {
    return assignment_no;
  }
  public void setAssignment_no(int assignment_no) {
    this.assignment_no = assignment_no;
  }
  public String getFile() {
    return file;
  }
  public void setFile(String file) {
    this.file = file;
  }
  public int getScore() {
    return score;
  }
  public void setScore(int score) {
    this.score = score;
  }
  public String getContent() {
    return content;
  }
  public void setContent(String content) {
    this.content = content;
  }
  public String getFeedback() {
    return feedback;
  }
  public void setFeedback(String feedback) {
    this.feedback = feedback;
  }
  public Date getCreate_date() {
    return create_date;
  }
  public void setCreate_date(Date create_date) {
    this.create_date = create_date;
  }
}
