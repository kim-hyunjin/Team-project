package Team.project.dao;

import java.util.List;
import Team.project.domain.User;

public interface UserDao {
  public int insert(User user) throws Exception;

  public List<User> findAll() throws Exception;

  public User findByNo(int no) throws Exception;

  public int update(User user) throws Exception;

  public int delete(int no) throws Exception;

  List<User> findByKeyword(String keyword) throws Exception;

}
