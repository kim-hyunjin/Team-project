package Team.project.domain;

import java.io.Serializable;

public class Multiple implements Serializable {

  private static final long serialVersionUID = 1L;

  private int multipleNo;
  private int questionNo;
  private int no;
  private String multipleContent;

  public int getMultipleNo() {
    return multipleNo;
  }

  public void setMultipleNo(int multipleNo) {
    this.multipleNo = multipleNo;
  }

  public int getQuestionNo() {
    return questionNo;
  }

  public void setQuestionNo(int questionNo) {
    this.questionNo = questionNo;
  }

  public int getNo() {
    return no;
  }

  public void setNo(int no) {
    this.no = no;
  }

  public String getMultipleContent() {
    return multipleContent;
  }

  public void setMultipleContent(String multipleContent) {
    this.multipleContent = multipleContent;
  }



}
