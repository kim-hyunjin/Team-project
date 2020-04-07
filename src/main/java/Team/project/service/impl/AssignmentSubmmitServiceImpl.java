package Team.project.service.impl;

import java.util.List;
import Team.project.dao.AssignmentSubmmitDao;
import Team.project.domain.AssignmentSubmmit;
import Team.project.service.AssignmentSubmmitService;

public class AssignmentSubmmitServiceImpl implements AssignmentSubmmitService {

  AssignmentSubmmitDao assignmentSubmmitDao;

  public AssignmentSubmmitServiceImpl(AssignmentSubmmitDao assignmentSubmmitDao) {
    this.assignmentSubmmitDao = assignmentSubmmitDao;
  }

  @Override
  public void add(AssignmentSubmmit assignmentSubmmit) throws Exception {
    assignmentSubmmitDao.insert(assignmentSubmmit);
  }

  @Override
  public List<AssignmentSubmmit> list() throws Exception {
    return assignmentSubmmitDao.findAll();
  }

  @Override
  public int delete(int no) throws Exception {
    return assignmentSubmmitDao.delete(no);
  }

  @Override
  public AssignmentSubmmit get(int no) throws Exception {

    return assignmentSubmmitDao.findByNo(no);
  }

  @Override
  public int update(AssignmentSubmmit assignmentSubmmit) throws Exception {
    return assignmentSubmmitDao.update(assignmentSubmmit);
  }

}
