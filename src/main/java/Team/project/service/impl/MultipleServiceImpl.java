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
  public List<Multiple> list(int qno) throws Exception {
    return multipleDao.findAll(qno);
  }

  @Override
  public Multiple get(int no) throws Exception {
    return multipleDao.findByNo(no);
  }

  @Override
  public Multiple getAnswer(int questionNo, int multipleNo) throws Exception {
    HashMap<String, Integer> map = new HashMap<>();
    map.put("qNO", questionNo);
    map.put("mNo", multipleNo);
    return multipleDao.getAnswer(map);
  }

  @Override
  public void insert(Multiple multiple) throws Exception {
    multipleDao.insert(multiple);
  }

  @Override
  public void update(List<Multiple> multiples) throws Exception {
    if (multiples != null) {
      for (Multiple m : multiples) {
        if (m.getMultipleNo() > 0) {
          multipleDao.update(m);
        } else {
          multipleDao.insert(m);
        }
      }
    }
  }

  @Override
  public void update(Multiple multiple) throws Exception {
    // TODO Auto-generated method stub

  }

  @Override
  public void delete(int multipleNo) throws Exception {
    multipleDao.delete(multipleNo);

  }


}
