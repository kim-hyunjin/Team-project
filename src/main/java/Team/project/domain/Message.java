package Team.project.domain;

import java.io.Serializable;
import java.sql.Date;

public class Message implements Serializable {
  
  private static final long serialVersionUID = 1L;

 
  private int messageNo;
  private int callerNo;
  private int receiverNo;
  private String content;
  private Date createDate;
  
  
  
  public int getMessageNo() {
    return messageNo;
  }
  public void setMessageNo(int messageNo) {
    this.messageNo = messageNo;
  }
  public int getCallerNo() {
    return callerNo;
  }
  public void setCallerNo(int callerNo) {
    this.callerNo = callerNo;
  }
  public int getReceiverNo() {
    return receiverNo;
  }
  public void setReceiverNo(int receiverNo) {
    this.receiverNo = receiverNo;
  }
  public String getContent() {
    return content;
  }
  public void setContent(String content) {
    this.content = content;
  }
  public Date getCreateDate() {
    return createDate;
  }
  public void setCreateDate(Date createDate) {
    this.createDate = createDate;
  }
}
