package Team.project.domain;

import java.io.Serializable;

public class ClazzMember implements Serializable {
  private static final long serialVersionUID = 1L;

  private int memberNo;
  private int userNo;
  private int clazzNo;
  private int role;
  private User user;
  
  public int getMemberNo() {
    return memberNo;
  }
  public void setMemberNo(int memberNo) {
    this.memberNo = memberNo;
  }
  public int getUserNo() {
    return userNo;
  }
  public void setUserNo(int userNo) {
    this.userNo = userNo;
  }
  public int getClazzNo() {
    return clazzNo;
  }
  public void setClazzNo(int clazzNo) {
    this.clazzNo = clazzNo;
  }
  public int getRole() {
    return role;
  }
  public void setRole(int role) {
    this.role = role;
  }
  public User getUser() {
    return user;
  }
  public void setUser(User user) {
    this.user = user;
  }
  
  




}
