package Team.project.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import Team.project.domain.User;

public interface UserDao {
  public int insert(User user) throws Exception;

  public List<User> findAll() throws Exception;

  public List<User> findByClassNo(int no) throws Exception;

  public User findByRoomNoAndEmail(Map<String, Object> map) throws Exception;
  
  public User findByNo(int no) throws Exception;
  
  public int join(User user) throws Exception;

  public User findByEmail(String email) throws Exception;

  public User findByEmailAndPassword(Map<String, Object> map) throws Exception;
  
  public int update(User user) throws Exception;

  public int delete(int no) throws Exception;

  List<User> findByKeyword(String keyword) throws Exception;
  
  int alterKey(Map<String, Object> params); // 유저 인증키 생성 메서드
  
  int alterUserKey(Map<String, Object> params); //유저 인증키 Y로 바꿔주는 메서드
  
  void updatePassword(HashMap<String, Object> params) throws Exception;
}
