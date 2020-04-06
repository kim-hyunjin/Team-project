package Team.project.dao;

import java.util.List;

public interface AssignmentSubmmit {

  public int insert(AssignmentSubmmit assignment_submmit) throws Exception;

  public List<AssignmentSubmmit> findAll() throws Exception;

  public AssignmentSubmmit findByNo(int no) throws Exception;

  public int update(AssignmentSubmmit assignment_submmit) throws Exception;

  public int delete(int no) throws Exception;
}
