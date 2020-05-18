package Team.project.service;

import javax.servlet.http.HttpServletRequest;

public interface MailSendService {

  String getKey(boolean authkey, int size);
  
  void mailSendWithKey(String email, String name, HttpServletRequest request);
  
  int alterUserKey(String email, String key);
  
  void findPassword(String emaile) throws Exception;


}
