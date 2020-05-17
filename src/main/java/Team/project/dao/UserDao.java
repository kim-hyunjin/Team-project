package Team.project.dao;

import java.util.List;
import java.util.Map;
import Team.project.domain.User;

public interface UserDao {
  public int insert(User user) throws Exception;

  public List<User> findAll() throws Exception;

  public List<User> findByClassNo(int no) throws Exception;

  public User findByRoomNoAndEmail(Map<String, Object> map) throws Exception;
  
  public User findByNo(int no) throws Exception;

  public User findByEmail(String email) throws Exception;

  public User findByEmailAndPassword(Map<String, Object> map) throws Exception;
  
  public int update(User user) throws Exception;

  public int delete(int no) throws Exception;

  List<User> findByKeyword(String keyword) throws Exception;
  
  // 가입시 이메일 체크
  public int checkid(String email) throws Exception;
  
}
