package Team.project.dao;

import java.util.List;
import java.util.Map;
import Team.project.domain.AssignmentSubmit;

public interface AssignmentSubmitDao {

  public int insert(AssignmentSubmit assignmentSubmit) throws Exception;

  public List<AssignmentSubmit> findAll(int assignmentNo) throws Exception;

  public List<AssignmentSubmit> findAllByClassNoAndUserNo(Map<String, Object> params)
      throws Exception;

  public AssignmentSubmit findByAssignmentNoAndMemberNo(Map<String, Integer> map) throws Exception;

  public int update(AssignmentSubmit assignmentSubmit) throws Exception;

  public int delete(int no) throws Exception;
}
