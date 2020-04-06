package Team.project.dao;

import java.util.List;

public interface Clazz_member {
  public int insert(Clazz_member clazz_member) throws Exception;

  public List<Clazz_member> findAll() throws Exception;

  public Clazz_member findByNo(int no) throws Exception;

  public int update(Clazz_member clazz_member) throws Exception;

  public int delete(int no) throws Exception;
}

