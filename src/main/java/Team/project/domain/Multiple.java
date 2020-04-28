package Team.project.domain;

import java.io.Serializable;

public class Multiple implements Serializable {

  private static final long serialVersionUID = 1L;

  private int multipleNo;
  private int no;
  private String content;


  public int getMultipleNo() {
    return multipleNo;
  }

  public void setMultipleNo(int multipleNo) {
    this.multipleNo = multipleNo;
  }

  public String getContent() {
    return content;
  }

  public void setContent(String content) {
    this.content = content;
  }

  public int getNo() {
    return no;
  }

  public void setNo(int no) {
    this.no = no;
  }


}
