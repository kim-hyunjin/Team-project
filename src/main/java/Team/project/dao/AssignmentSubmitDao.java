package Team.project.dao;

import java.util.List;
import Team.project.domain.AssignmentSubmit;

public interface AssignmentSubmitDao {

  public int insert(AssignmentSubmit assignmentSubmit) throws Exception;

<<<<<<< HEAD
  public List<AssignmentSubmit> findAll(int no) throws Exception;
=======
  public List<AssignmentSubmit> findAll() throws Exception;
>>>>>>> upstream/master

  public AssignmentSubmit findByNo(int no) throws Exception;

  public int update(AssignmentSubmit assignmentSubmit) throws Exception;

  public int delete(int no) throws Exception;
}
