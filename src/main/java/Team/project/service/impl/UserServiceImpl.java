package Team.project.service.impl;

import java.util.List;
import org.springframework.stereotype.Component;
import Team.project.dao.UserDao;
import Team.project.domain.User;
import Team.project.service.UserService;

@Component
public class UserServiceImpl implements UserService{

  UserDao userDao;

  public UserServiceImpl(UserDao userDao) {
    this.userDao = userDao;
  }

  @Override
  public void add(User user) throws Exception {
    userDao.insert(user);
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

}
