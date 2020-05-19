package Team.project.service;

import java.util.List;
import Team.project.domain.User;

public interface UserService {
  int add(User user) throws Exception;

  List<User> list() throws Exception;
  
  List<User> list(int no) throws Exception;
  
  int delete(int no) throws Exception;

  User get(int roomNo, String email) throws Exception;
  
  User get(int no) throws Exception;

  User get(String email) throws Exception;

  User get(String email, String password) throws Exception;

  int update(User user) throws Exception;

  List<User> search(String keyword) throws Exception;

  int join(User user) throws Exception;


}
