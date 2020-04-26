package Team.project.domain;

import java.io.Serializable;

public class AssignmentTag implements Serializable {
  private static final long serialVersionUID = 1L;

  private int assignmentNo;
  private int tagNo;


  public int getTagNo() {
    return tagNo;
  }
  public void setTagNo(int tagNo) {
    this.tagNo = tagNo;
  }
  public int getAssignmentNo() {
    return assignmentNo;
  }
  public void setAssignmentNo(int assignmentNo) {
    this.assignmentNo = assignmentNo;
  }

}
