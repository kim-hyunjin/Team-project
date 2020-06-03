package Team.project.service;

import javax.servlet.http.HttpServletRequest;

public interface MailSendService {

  String getKey(boolean authkey, int size);

  void mailSendWithKey(String email, String name, String password, HttpServletRequest request);

  void clazzInvite(String email, int classNo, int role, int invitorNo, HttpServletRequest request)
      throws Exception;

  int alterUserKey(String email, String key);

  void findPassword(String email) throws Exception;


}
