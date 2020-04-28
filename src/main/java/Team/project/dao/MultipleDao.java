package Team.project.dao;

import java.util.HashMap;
import java.util.List;
import Team.project.domain.Multiple;

public interface MultipleDao {

  public int insert(Multiple mulitple) throws Exception;

  public List<Multiple> findAll() throws Exception;

  public Multiple findByNo(int no) throws Exception;

  public int update(Multiple mulitple) throws Exception;

  public int delete(int no) throws Exception;

  public Multiple get(HashMap<String, Integer> map) throws Exception;

}


