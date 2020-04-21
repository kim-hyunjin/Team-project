package Team.project.domain;

import java.io.Serializable;
import java.sql.Date;

public class User implements Serializable {

  private static final long serialVersionUID = 1L;

  private int userNo;
  private String email;
  private String name;
  private String password;
  private String tel;
  private String major;
  private String introduce;
  private String profilePhoto;
  private int loginMethod;
  private Date createDate;


  @Override
  public String toString() {
    return "User [userNo=" + userNo + ", email=" + email + ", name=" + name + ", password="
        + password + ", tel=" + tel + ", major=" + major + ", introduce=" + introduce
        + ", profilePhoto=" + profilePhoto + ", loginMethod=" + loginMethod + ", createDate="
        + createDate + "]";
  }

  public int getUserNo() {
    return userNo;
  }

  public void setUserNo(int userNo) {
    this.userNo = userNo;
  }

  public String getEmail() {
    return email;
  }

  public void setEmail(String email) {
    this.email = email;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getPassword() {
    return password;
  }

  public void setPassword(String password) {
    this.password = password;
  }

  public String getTel() {
    return tel;
  }

  public void setTel(String tel) {
    this.tel = tel;
  }

  public String getMajor() {
    return major;
  }

  public void setMajor(String major) {
    this.major = major;
  }

  public String getIntroduce() {
    return introduce;
  }

  public void setIntroduce(String introduce) {
    this.introduce = introduce;
  }

  public String getProfilePhoto() {
    return profilePhoto;
  }

  public void setProfilePhoto(String profilePhoto) {
    this.profilePhoto = profilePhoto;
  }

  public int getLoginMethod() {
    return loginMethod;
  }

  public void setLoginMethod(int loginMethod) {
    this.loginMethod = loginMethod;
  }

  public Date getCreateDate() {
    return createDate;
  }

  public void setCreateDate(Date createDate) {
    this.createDate = createDate;
  }



}
