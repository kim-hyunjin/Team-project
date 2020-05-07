package Team.project.service.impl;

import java.util.HashMap;
import java.util.List;
import org.springframework.stereotype.Component;
import Team.project.dao.MultipleDao;
import Team.project.domain.Multiple;
import Team.project.service.MultipleService;

@Component
public class MultipleServiceImpl implements MultipleService {

  MultipleDao multipleDao;

  public MultipleServiceImpl(MultipleDao multipleDao) {
    this.multipleDao = multipleDao;
  }

  @Override
  public void add(Multiple mulitple) throws Exception {
    multipleDao.insert(mulitple);
  }

  @Override
  public List<Multiple> list(int qno) throws Exception {
    return multipleDao.findAll(qno);
  }

  @Override
  public int delete(int no) throws Exception {
    return multipleDao.delete(no);
  }

  @Override
  public Multiple get(int no) throws Exception {
    return multipleDao.findByNo(no);
  }

  @Override
  public int update(Multiple multiple) throws Exception {
    return multipleDao.update(multiple);
  }

  @Override
  public Multiple getAnswer(int questionNo, int multipleNo) throws Exception {
    HashMap<String, Integer> map = new HashMap<>();
    map.put("qNO", questionNo);
    map.put("mNo", multipleNo);
    return multipleDao.getAnswer(map);
  }



}
