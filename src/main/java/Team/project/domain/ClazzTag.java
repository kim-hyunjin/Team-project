package Team.project.domain;

import java.io.Serializable;

public class ClazzTag implements Serializable {
  private static final long serialVersionUID = 1L;

  private int clazzNo;
  private int tagNo;
  public int getClazzNo() {
    return clazzNo;
  }
  public void setClazzNo(int clazzNo) {
    this.clazzNo = clazzNo;
  }
  public int getTagNo() {
    return tagNo;
  }
  public void setTagNo(int tagNo) {
    this.tagNo = tagNo;
  }

}
