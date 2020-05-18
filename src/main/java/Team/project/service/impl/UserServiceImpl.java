package Team.project.service.impl;

import java.util.HashMap;
import java.util.List;
import org.springframework.stereotype.Repository;
import Team.project.dao.UserDao;
import Team.project.domain.User;
import Team.project.service.UserService;

@Repository
public class UserServiceImpl implements UserService {

  UserDao userDao;

  public UserServiceImpl(UserDao userDao) {
    this.userDao = userDao;
  }

  @Override
  public int add(User user) throws Exception {
    return userDao.insert(user);
  }

  @Override
  public List<User> list() throws Exception {
    return userDao.findAll();
  }

  @Override
  public int delete(int no) throws Exception {
    return userDao.delete(no);
  }

  @Override
  public User get(int no) throws Exception {
    return userDao.findByNo(no);
  }

  @Override
  public int update(User user) throws Exception {
    return userDao.update(user);
  }

  @Override
  public List<User> search(String keyword) throws Exception {
    return userDao.findByKeyword(keyword);
  }

  @Override
  public User get(String email, String password) throws Exception {
    HashMap<String, Object> params = new HashMap<>();
    params.put("email", email);
    params.put("password", password);
    return userDao.findByEmailAndPassword(params);
  }

  @Override
  public List<User> list(int no) throws Exception {
    return userDao.findByClassNo(no);
  }

  @Override
  public User get(String email) throws Exception {
    return userDao.findByEmail(email);
  }

  @Override
  public User get(int roomNo, String email) throws Exception {
    HashMap<String, Object> map = new HashMap<>();
    map.put("roomNo", roomNo);
    map.put("email", email);
    
    return userDao.findByRoomNoAndEmail(map);
  }

  @Override
  public int join(User user) throws Exception {
    return userDao.join(user);
  }

}
