package Team.project.domain;

import java.io.Serializable;
import java.sql.Date;

public class User implements Serializable {

  private static final long serialVersionUID = 1L;
  
  private int userNo;
  private String name;
  private String description;
  private String room;
  private String classCode;
  private Date createDate;


  public int getUserNo() {
    return userNo;
  }
  public void setUserNo(int userNo) {
    this.userNo = userNo;
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
}
