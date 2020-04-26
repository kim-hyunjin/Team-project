package Team.project.dao;

import java.util.List;
import Team.project.domain.Assignment;

public interface AssignmentDao {

  public int insert(Assignment assignment) throws Exception;

  public List<Assignment> findAll() throws Exception;

  public Assignment findByNo(int no) throws Exception;

  public int update(Assignment assignment) throws Exception;

  public int delete(int no) throws Exception;
  
  public List<Assignment> findByClassNo(int no) throws Exception;
}
