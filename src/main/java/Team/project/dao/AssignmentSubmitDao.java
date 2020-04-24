package Team.project.dao;

import java.util.List;
import Team.project.domain.AssignmentSubmit;

public interface AssignmentSubmitDao {

  public int insert(AssignmentSubmit assignmentSubmit) throws Exception;

  public List<AssignmentSubmit> findAllAssignment(int no) throws Exception;
  
  //public List<AssignmentSubmit> findAllAssignment() throws Exception;

  public AssignmentSubmit findByNo(int no) throws Exception;

  public int update(AssignmentSubmit assignmentSubmit) throws Exception;

  public int delete(int no) throws Exception;
}
