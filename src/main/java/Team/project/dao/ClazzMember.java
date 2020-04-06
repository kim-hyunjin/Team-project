package Team.project.dao;

import java.util.List;

public interface ClazzMember {
  public int insert(ClazzMember clazz_member) throws Exception;

  public List<ClazzMember> findAll() throws Exception;

  public ClazzMember findByNo(int no) throws Exception;

  public int update(ClazzMember clazz_member) throws Exception;

  public int delete(int no) throws Exception;
}

