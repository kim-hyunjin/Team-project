package Team.project.service.impl;

import java.util.List;
import org.springframework.stereotype.Component;
import Team.project.dao.AssignmentDao;
import Team.project.domain.Assignment;
import Team.project.service.AssignmentService;

@Component
public class AssignmentServiceImpl implements AssignmentService {

  AssignmentDao assignmetDao;

  public AssignmentServiceImpl(AssignmentDao assignmetDao) {
    this.assignmetDao = assignmetDao;
  }

  @Override
  public void add(Assignment assignment) throws Exception {
    assignmetDao.insert(assignment);

  }

  @Override
  public List<Assignment> list() throws Exception {
    return assignmetDao.findAll();
  }

  @Override
  public int delete(int no) throws Exception {
    return assignmetDao.delete(no);
  }

  @Override
  public Assignment get(int no) throws Exception {

    return assignmetDao.findByNo(no);
  }

  @Override
  public int update(Assignment assignment) throws Exception {
    return assignmetDao.update(assignment);
  }
}
