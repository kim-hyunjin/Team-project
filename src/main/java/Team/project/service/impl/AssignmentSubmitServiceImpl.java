package Team.project.service.impl;

import java.util.List;
import org.springframework.stereotype.Component;
import Team.project.dao.AssignmentSubmitDao;
import Team.project.domain.AssignmentSubmit;
import Team.project.service.AssignmentSubmitService;

@Component
public class AssignmentSubmitServiceImpl implements AssignmentSubmitService {

  AssignmentSubmitDao assignmentSubmitDao;

  public AssignmentSubmitServiceImpl(AssignmentSubmitDao assignmentSubmitDao) {
    this.assignmentSubmitDao = assignmentSubmitDao;
  }

  @Override
  public void add(AssignmentSubmit assignmentSubmit) throws Exception {
    assignmentSubmitDao.insert(assignmentSubmit);
  }

  @Override
  public List<AssignmentSubmit> list() throws Exception {
    return assignmentSubmitDao.findAll();
  }

  @Override
  public int delete(int no) throws Exception {
    return assignmentSubmitDao.delete(no);
  }

  @Override
  public AssignmentSubmit get(int no) throws Exception {

    return assignmentSubmitDao.findByNo(no);
  }

  @Override
  public int update(AssignmentSubmit assignmentSubmit) throws Exception {
    return assignmentSubmitDao.update(assignmentSubmit);
  }

}
