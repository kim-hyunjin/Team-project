package Team.project.domain;

import java.io.Serializable;

public class ClazzMember implements Serializable {
  private static final long serialVersionUID = 1L;

  private int memberNo;
  private int userNo;
  private int clazzNo;
  private int role;
  private User user;


  public int getMember_no() {
    return memberNo;
  }

  public void setMember_no(int member_no) {
    this.memberNo = member_no;
  }

  public int getUser_no() {
    return userNo;
  }

  public void setUser_no(int user_no) {
    this.userNo = user_no;
  }

  public int getClazz_no() {
    return clazzNo;
  }

  public void setClazz_no(int clazz_no) {
    this.clazzNo = clazz_no;
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
