package Team.project.domain;

import java.io.Serializable;

public class BoardTag implements Serializable {
  private static final long serialVersionUID = 1L;

  private int postNo;
  private int tagNo;


  public int getTagNo() {
    return tagNo;
  }
  public void setTagNo(int tagNo) {
    this.tagNo = tagNo;
  }
  public int getPostNo() {
    return postNo;
  }
  public void setPostNo(int postNo) {
    this.postNo = postNo;
  }

}
