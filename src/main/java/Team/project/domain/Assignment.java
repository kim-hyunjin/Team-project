package Team.project.domain;

import java.sql.Date;

public class Assignment {

  private int assignment_no;
  private int clazz_no;
  private int member_no;
  private String title;
  private String content;
  private String file;
  private Date deadline;
  private String standare;
  private Date create_date;


  public int getAssignment_no() {
    return assignment_no;
  }
  public void setAssignment_no(int assignment_no) {
    this.assignment_no = assignment_no;
  }
  public int getClazz_no() {
    return clazz_no;
  }
  public void setClazz_no(int clazz_no) {
    this.clazz_no = clazz_no;
  }
  public int getMember_no() {
    return member_no;
  }
  public void setMember_no(int member_no) {
    this.member_no = member_no;
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
  public Date getDeadline() {
    return deadline;
  }
  public void setDeadline(Date deadline) {
    this.deadline = deadline;
  }
  public String getStandare() {
    return standare;
  }
  public void setStandare(String standare) {
    this.standare = standare;
  }
  public Date getCreate_date() {
    return create_date;
  }
  public void setCreate_date(Date create_date) {
    this.create_date = create_date;
  }

}
