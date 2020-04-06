package Team.project.dao;

import java.util.List;

public interface Assignment_submmit {

  public int insert(Assignment_submmit assignment_submmit) throws Exception;

  public List<Assignment_submmit> findAll() throws Exception;

  public Assignment_submmit findByNo(int no) throws Exception;

  public int update(Assignment_submmit assignment_submmit) throws Exception;

  public int delete(int no) throws Exception;
}
