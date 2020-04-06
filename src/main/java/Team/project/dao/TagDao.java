package Team.project.dao;

import java.util.List;
import Team.project.domain.Tag;

public interface TagDao {
  public int insert(Tag tag) throws Exception;

  public List<Tag> findAll() throws Exception;

  public Tag findByNo(int no) throws Exception;

  public int update(Tag tag) throws Exception;

  public int delete(int no) throws Exception;
}
