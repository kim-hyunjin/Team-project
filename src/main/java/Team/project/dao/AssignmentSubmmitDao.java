package Team.project.dao;

import java.util.List;
import Team.project.domain.AssignmentSubmmit;

public interface AssignmentSubmmitDao {

  public int insert(AssignmentSubmmit assignmentSubmmit) throws Exception;

  public List<AssignmentSubmmit> findAll() throws Exception;

  public AssignmentSubmmit findByNo(int no) throws Exception;

  public int update(AssignmentSubmmit assignmentSubmmit) throws Exception;

  public int delete(int no) throws Exception;
}
