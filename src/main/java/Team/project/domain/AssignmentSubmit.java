package Team.project.domain;

import java.io.Serializable;
import java.sql.Date;

public class AssignmentSubmit implements Serializable {
  private static final long serialVersionUID = 1L;
  private int memberNo;
  private int assignmentNo;
  private String file;
  private int score;
  private String content;
  private String feedback;
  private Date createDate;
  private ClazzMember clazzMember;
  private User user;
  private Assignment assignment;
  private FileVO fileVO;

  public int getMemberNo() {
    return memberNo;
  }

  public void setMemberNo(int memberNo) {
    this.memberNo = memberNo;
  }

  public int getAssignmentNo() {
    return assignmentNo;
  }

  public void setAssignmentNo(int assignmentNo) {
    this.assignmentNo = assignmentNo;
  }

  public String getFile() {
    return file;
  }

  public void setFile(String file) {
    this.file = file;
  }

  public int getScore() {
    return score;
  }

  public void setScore(int score) {
    this.score = score;
  }

  public String getContent() {
    return content;
  }

  public void setContent(String content) {
    this.content = content;
  }

  public String getFeedback() {
    return feedback;
  }

  public void setFeedback(String feedback) {
    this.feedback = feedback;
  }

  public Date getCreateDate() {
    return createDate;
  }

  public void setCreateDate(Date createDate) {
    this.createDate = createDate;
  }

  public ClazzMember getClazzMember() {
    return clazzMember;
  }

  public void setClazzMember(ClazzMember clazzMember) {
    this.clazzMember = clazzMember;
  }

  public User getUser() {
    return user;
  }

  public void setUser(User user) {
    this.user = user;
  }

  public Assignment getAssignment() {
    return assignment;
  }

  public void setAssignment(Assignment assignment) {
    this.assignment = assignment;
  }

  @Override
  public String toString() {
    return "AssignmentSubmit [memberNo=" + memberNo + ", assignmentNo=" + assignmentNo + ", file="
        + file + ", score=" + score + ", content=" + content + ", feedback=" + feedback
        + ", createDate=" + createDate + ", clazzMember=" + clazzMember + ", user=" + user
        + ", assignment=" + assignment + "]";
  }

  public FileVO getFileVO() {
    return fileVO;
  }

  public void setFileVO(FileVO fileVO) {
    this.fileVO = fileVO;
  }



}
