package Team.project.service.impl;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;
import Team.project.dao.UserDao;
import Team.project.domain.User;
import Team.project.service.ClazzService;
import Team.project.service.MailSendService;
import Team.project.service.UserService;

@Component
public class MailSendServiceImpl implements MailSendService {
  @Autowired
  JavaMailSender mailSender;
  @Autowired
  UserDao userDao;
  @Autowired
  UserService userService;
  @Autowired
  ClazzService clazzService;

  public MailSendServiceImpl(UserDao userDao) {
    this.userDao = userDao;
  }

  // 이메일 난수 만드는 메서드
  private String init() {
    Random ran = new Random();
    StringBuffer sb = new StringBuffer();
    int num = 0;

    do {
      num = ran.nextInt(75) + 48;
      if ((num >= 48 && num <= 57) || (num >= 65 && num <= 90) || (num >= 97 && num <= 122)) {
        sb.append((char) num);
      } else {
        continue;
      }

    } while (sb.length() < size);
    if (lowerCheck) {
      return sb.toString().toLowerCase();
    }
    return sb.toString();
  }

  // 난수를 이용한 키 생성
  private boolean lowerCheck;
  private int size;


  @Override
  public String getKey(boolean lowerCheck, int size) {
    this.lowerCheck = lowerCheck;
    this.size = size;
    return init();
  }

  // 회원가입 발송 이메일(인증키 발송)
  @Override
  public void mailSendWithKey(String email, String name, String password,
      HttpServletRequest request) {
    String key = getKey(false, 15);

    Map<String, Object> params = new HashMap<>();
    params.put("email", email);
    params.put("key", key);

    if (userDao.alterKey(params) > 0) {
      MimeMessage mail = mailSender.createMimeMessage();
      String htmlStr = "<h2>안녕하세요. BTS에 가입해주셔서 감사합니다!</h2><br><br>" + "<h3>" + name + "님</h3>"
          + "<p>인증하기 버튼을 누르시면 로그인을 하실 수 있습니다 : " + "<a href='http://localhost:9999"
          + request.getContextPath() + "/app/auth/keyalter?email=" + email + "&key=" + key
          + "&password=" + password + "'>인증하기</a></p>" + "(혹시 잘못 전달된 메일이라면 이 이메일을 무시하셔도 됩니다)";
      try {
        mail.setSubject(String.format("[본인인증] BTS: %s님의 인증메일입니다", name), "utf-8");
        mail.setText(htmlStr, "utf-8", "html");
        mail.addRecipient(javax.mail.Message.RecipientType.TO, new InternetAddress(email));
        mailSender.send(mail);
      } catch (MessagingException e) {
        e.printStackTrace();
      }
    }

  }

  @Override
  public int alterUserKey(String email, String key) {

    int resultCnt = 0;
    Map<String, Object> params = new HashMap<>();
    params.put("email", email);
    params.put("key", key);
    resultCnt = userDao.alterUserKey(params);

    return resultCnt;

  }

  @Override
  public void findPassword(String email) throws Exception {

    String password = getKey(true, 8);

    HashMap<String, Object> params = new HashMap<>();
    params.put("newPassword", password);
    params.put("email", email);
    userDao.updatePassword(params);
    MimeMessage mail = mailSender.createMimeMessage();
    String htmlStr = "<h2>BTS 계정의 임시 비밀번호가 발급되었습니다.</h2><br><br>" + "<h3>" + password
        + "</h3><br><p><a href='http://localhost:9999/Team-project/app/auth/form'>BTS 바로가기</a><br>(혹시 잘못 전달된 메일이라면 이 이메일을 무시하셔도 됩니다)";
    try {
      mail.setSubject("[본인인증] BTS: 임시 비밀번호를 보내드립니다.", "utf-8");
      mail.setText(htmlStr, "utf-8", "html");
      mail.addRecipient(javax.mail.Message.RecipientType.TO, new InternetAddress(email));
      mailSender.send(mail);
    } catch (MessagingException e) {
      e.printStackTrace();
    }

  }

  @Override
  public void clazzInvite(String email, int classNo, int role, int invitorNo,
      HttpServletRequest request) throws Exception {
    User user = userService.get(email);
    String userName = user.getName();
    String clazzName = clazzService.get(classNo).getName();
    String invitor = userService.get(invitorNo).getName();
    MimeMessage mail = mailSender.createMimeMessage();
    String htmlStr = "<h2>안녕하세요. " + userName + "님! " + invitor + "님께서 " + userName + "님을 "
        + clazzName + " 수업으로 초대하셨습니다!</h2><br><br>" + "<h3>" + userName + "님</h3>"
        + "<p>다음 링크를 클릭하시면 수업에 참여하실 수 있습니다. : " + "<a href='http://localhost:9999"
        + request.getContextPath() + "/app/clazz/invited?userNo=" + user.getUserNo() + "&clazzNo="
        + classNo + "&role=" + role + "'>참여하기</a></p>" + "(혹시 잘못 전달된 메일이라면 이 이메일을 무시하셔도 됩니다)";
    try {
      mail.setSubject(String.format("[수업초대] BTS: %s님께서 %s 수업에 초대되셨습니다!", userName, clazzName),
          "utf-8");
      mail.setText(htmlStr, "utf-8", "html");
      mail.addRecipient(javax.mail.Message.RecipientType.TO, new InternetAddress(email));
      mailSender.send(mail);
    } catch (MessagingException e) {
      e.printStackTrace();
    }
  }


}
