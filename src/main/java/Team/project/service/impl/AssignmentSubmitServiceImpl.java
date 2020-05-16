package Team.project.service.impl;

import java.util.HashMap;
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
  public List<AssignmentSubmit> list(int assignmentNo) throws Exception {
    return assignmentSubmitDao.findAll(assignmentNo);
  }

  @Override
  public List<AssignmentSubmit> list(int classNo, int userNo) throws Exception {
    HashMap<String, Object> params = new HashMap<>();
    params.put("classNo", classNo);
    params.put("userNo", userNo);
    return assignmentSubmitDao.findAllByClassNoAndUserNo(params);
  }

  @Override
  public int delete(int no) throws Exception {
    return assignmentSubmitDao.delete(no);
  }

  @Override
  public AssignmentSubmit get(int assignmentNo, int memberNo) throws Exception {
    HashMap<String, Integer> map = new HashMap<>();
    map.put("assignmentNo", assignmentNo);
    map.put("memberNo", memberNo);
    return assignmentSubmitDao.findByAssignmentNoAndMemberNo(map);
  }

  @Override
  public int update(AssignmentSubmit assignmentSubmit) throws Exception {
    return assignmentSubmitDao.update(assignmentSubmit);
  }

}
