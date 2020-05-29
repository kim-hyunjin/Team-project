package Team.project.domain;

import java.io.Serializable;
import java.sql.Date;

public class Clazz implements Serializable {
  private static final long serialVersionUID = 1L;
  private int classNo;
  private String name;
  private String description;
  private String room;
  private String classCode;
  private Date createDate;
  private ClazzMember clazzMember;
  private Assignment assignment;
  private Question question;
  private String color;

  public Assignment getAssignment() {
    return assignment;
  }

  public void setAssignment(Assignment assignment) {
    this.assignment = assignment;
  }

  public Question getQuestion() {
    return question;
  }

  public void setQuestion(Question question) {
    this.question = question;
  }

  public int getClassNo() {
    return classNo;
  }

  public void setClassNo(int classNo) {
    this.classNo = classNo;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getDescription() {
    return description;
  }

  public void setDescription(String description) {
    this.description = description;
  }

  public String getRoom() {
    return room;
  }

  public void setRoom(String room) {
    this.room = room;
  }

  public String getClassCode() {
    return classCode;
  }

  public void setClassCode(String classCode) {
    this.classCode = classCode;
  }

  public Date getCreateDate() {
    return createDate;
  }

  public void setCreateDate(Date createDate) {
    this.createDate = createDate;
  }

  public ClazzMember getClazzMember() {
    return clazzMember;
  }

  public void setClazzMember(ClazzMember clazzMember) {
    this.clazzMember = clazzMember;
  }

  public String getColor() {
    return color;
  }

  public void setColor(String color) {
    this.color = color;
  }

  @Override
  public String toString() {
    return "Clazz [classNo=" + classNo + ", name=" + name + ", description=" + description
        + ", room=" + room + ", classCode=" + classCode + ", createDate=" + createDate
        + ", clazzMember=" + clazzMember + ", assignment=" + assignment + ", question=" + question
        + ", color=" + color + "]";
  }


}
