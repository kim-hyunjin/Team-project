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
  private String alterKey;

  public String getAlterKey() {
    return alterKey;
  }

  public void setAlterKey(String alterKey) {
    this.alterKey = alterKey;
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

  @Override
  public String toString() {
    return "User [userNo=" + userNo + ", email=" + email + ", name=" + name + ", password="
        + password + ", tel=" + tel + ", major=" + major + ", introduce=" + introduce
        + ", profilePhoto=" + profilePhoto + ", loginMethod=" + loginMethod + ", createDate="
        + createDate + ", alterKey=" + alterKey + "]";
  }

  @Override
  public int hashCode() {
    final int prime = 31;
    int result = 1;
    result = prime * result + ((alterKey == null) ? 0 : alterKey.hashCode());
    result = prime * result + ((createDate == null) ? 0 : createDate.hashCode());
    result = prime * result + ((email == null) ? 0 : email.hashCode());
    result = prime * result + ((introduce == null) ? 0 : introduce.hashCode());
    result = prime * result + loginMethod;
    result = prime * result + ((major == null) ? 0 : major.hashCode());
    result = prime * result + ((name == null) ? 0 : name.hashCode());
    result = prime * result + ((password == null) ? 0 : password.hashCode());
    result = prime * result + ((profilePhoto == null) ? 0 : profilePhoto.hashCode());
    result = prime * result + ((tel == null) ? 0 : tel.hashCode());
    result = prime * result + userNo;
    return result;
  }

  @Override
  public boolean equals(Object obj) {
    if (this == obj) {
      return true;
    }
    if (obj == null) {
      return false;
    }
    if (getClass() != obj.getClass()) {
      return false;
    }
    User other = (User) obj;
    if (alterKey == null) {
      if (other.alterKey != null) {
        return false;
      }
    } else if (!alterKey.equals(other.alterKey)) {
      return false;
    }
    if (createDate == null) {
      if (other.createDate != null) {
        return false;
      }
    } else if (!createDate.equals(other.createDate)) {
      return false;
    }
    if (email == null) {
      if (other.email != null) {
        return false;
      }
    } else if (!email.equals(other.email)) {
      return false;
    }
    if (introduce == null) {
      if (other.introduce != null) {
        return false;
      }
    } else if (!introduce.equals(other.introduce)) {
      return false;
    }
    if (loginMethod != other.loginMethod) {
      return false;
    }
    if (major == null) {
      if (other.major != null) {
        return false;
      }
    } else if (!major.equals(other.major)) {
      return false;
    }
    if (name == null) {
      if (other.name != null) {
        return false;
      }
    } else if (!name.equals(other.name)) {
      return false;
    }
    if (password == null) {
      if (other.password != null) {
        return false;
      }
    } else if (!password.equals(other.password)) {
      return false;
    }
    if (profilePhoto == null) {
      if (other.profilePhoto != null) {
        return false;
      }
    } else if (!profilePhoto.equals(other.profilePhoto)) {
      return false;
    }
    if (tel == null) {
      if (other.tel != null) {
        return false;
      }
    } else if (!tel.equals(other.tel)) {
      return false;
    }
    if (userNo != other.userNo) {
      return false;
    }
    return true;
  }



}
