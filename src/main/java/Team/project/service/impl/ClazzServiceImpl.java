package Team.project.service.impl;

import java.util.List;
import org.springframework.stereotype.Component;
import Team.project.dao.ClazzDao;
import Team.project.domain.Clazz;
import Team.project.service.ClazzService;

@Component
public class ClazzServiceImpl implements ClazzService {

  ClazzDao clazzDao;

  public ClazzServiceImpl(ClazzDao clazzDao) {
    this.clazzDao = clazzDao;
  }

  @Override
  public void add(Clazz clazz) throws Exception {
    clazzDao.insert(clazz);
  }

  @Override
  public List<Clazz> list() throws Exception {
    return clazzDao.findAll();
  }

  @Override
  public int delete(int no) throws Exception {
    return clazzDao.delete(no);
  }

  @Override
  public Clazz get(int no) throws Exception {
    return clazzDao.findByNo(no);
  }

  @Override
  public int update(Clazz clazz) throws Exception {
    return clazzDao.update(clazz);
  }



}
