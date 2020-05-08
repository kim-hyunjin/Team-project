package Team.project.dao;

import java.util.List;
import Team.project.domain.Clazz;

public interface ClazzDao {

  public int insert(Clazz clazz) throws Exception;

  public List<Clazz> findAll() throws Exception;

  public Clazz findByNo(int no) throws Exception;

  public int update(Clazz clazz) throws Exception;

  public int delete(int no) throws Exception;

  public List<Clazz> findByUserNo(int userNo) throws Exception;
  
  // 수업참여코드
  public Clazz findByCode(String code) throws Exception;
}

