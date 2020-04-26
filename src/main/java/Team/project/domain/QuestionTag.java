package Team.project.domain;

import java.io.Serializable;

public class QuestionTag implements Serializable {
  private static final long serialVersionUID = 1L;

  private int questionNo;
  private int tagNo;


  public int getTagNo() {
    return tagNo;
  }
  public void setTagNo(int tagNo) {
    this.tagNo = tagNo;
  }
  public int getQuestionNo() {
    return questionNo;
  }
  public void setQuestionNo(int questionNo) {
    this.questionNo = questionNo;
  }

}
