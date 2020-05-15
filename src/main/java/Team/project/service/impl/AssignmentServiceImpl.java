package Team.project.service.impl;

import java.util.List;
import org.springframework.stereotype.Component;
import Team.project.dao.AssignmentDao;
import Team.project.domain.Assignment;
import Team.project.service.AssignmentService;

@Component
public class AssignmentServiceImpl implements AssignmentService {

  AssignmentDao assignmentDao;

  public AssignmentServiceImpl(AssignmentDao assignmetDao) {
    this.assignmentDao = assignmetDao;
  }

  @Override
  public void add(Assignment assignment) throws Exception {
    assignmentDao.insert(assignment);

  }

  @Override
  public List<Assignment> list() throws Exception {
    return assignmentDao.findAll();
  }

  @Override
  public int delete(int no) throws Exception {
    return assignmentDao.delete(no);
  }

  @Override
  public Assignment get(int no) throws Exception {
    return assignmentDao.findByNo(no);
  }

  @Override
  public int update(Assignment assignment) throws Exception {
    return assignmentDao.update(assignment);
  }

  @Override
  public List<Assignment> list(int no) throws Exception {
    return assignmentDao.findByClassNo(no);
  }
  @Override
  public List<Assignment> allList(int no) throws Exception {
    return assignmentDao.findByNoOfClass(no);
  }

}
