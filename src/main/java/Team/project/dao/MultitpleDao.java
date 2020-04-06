package Team.project.dao;

import java.util.List;
import Team.project.domain.Board;
import Team.project.domain.Multiple;

public interface MultitpleDao {

  public int insert(Multiple mulitple) throws Exception;

  public List<Multiple> findAll() throws Exception;

  public Board findByNo(int no) throws Exception;

  public int update(Multiple mulitple) throws Exception;

  public int delete(int no) throws Exception;
}


