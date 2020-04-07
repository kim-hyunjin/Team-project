package Team.project.domain;

import java.io.Serializable;

public class Tag implements Serializable {
  
  private static final long serialVersionUID = 1L;
  
  private int tagNo;
  private String name;



  public int getTagNo() {
    return tagNo;
  }

  public void setTagNo(int tagNo) {
    this.tagNo = tagNo;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }
}
