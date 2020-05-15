package Team.project.domain;

import java.io.Serializable;
import java.sql.Date;

public class Question implements Serializable {

  private static final long serialVersionUID = 1L;

  private int questionNo;
  private int memberNo;
  private String title;
  private String content;
  private String filePath; // 실제론 UUID로 생성된 파일 ID가 들어감
  
//  @DateTimeFormat(pattern = "yyyy-MM-dd")
  private Date deadline;
  private Date createDate;




//  public void setDeadline(String deadline) {
//    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//    try {
//        this.deadline = sdf.parse(deadline);
//    } catch (ParseException e) {
//        // TODO Auto-generated catch block
//        e.printStackTrace();
//    }
//    
//}
//  public Date getDeadline() {
//    return deadline;
//  }

  public int getQuestionNo() {
    return questionNo;
  }


  public Date getDeadline() {
    return deadline;
  }




  public void setDeadline(Date deadline) {
    this.deadline = deadline;
  }




  public void setQuestionNo(int questionNo) {
    this.questionNo = questionNo;
  }




  public int getMemberNo() {
    return memberNo;
  }




  public void setMemberNo(int memberNo) {
    this.memberNo = memberNo;
  }




  public String getTitle() {
    return title;
  }




  public void setTitle(String title) {
    this.title = title;
  }




  public String getContent() {
    return content;
  }




  public void setContent(String content) {
    this.content = content;
  }




  public String getFilePath() {
    return filePath;
  }




  public void setFilePath(String filePath) {
    this.filePath = filePath;
  }





  public Date getCreateDate() {
    return createDate;
  }




  public void setCreateDate(Date createDate) {
    this.createDate = createDate;
  }




  @Override
  public String toString() {
    return "Question [questionNo=" + questionNo + ", memberNo=" + memberNo + ", title=" + title
        + ", content=" + content + ", filePath=" + filePath + ", deadline=" + deadline
        + ", createDate=" + createDate;
  }



}
