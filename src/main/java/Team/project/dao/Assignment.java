package Team.project.dao;

import java.util.List;

public interface Assignment {

  public int insert(Assignment assignment) throws Exception;

  public List<Assignment> findAll() throws Exception;

  public Assignment findByNo(int no) throws Exception;

  public int update(Assignment assignment) throws Exception;

  public int delete(int no) throws Exception;
}
