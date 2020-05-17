package Team.project.dao;

import java.util.List;
import Team.project.domain.Question;

public interface QuestionDao {
  public int insert(Question question) throws Exception;

  public List<Question> findAll() throws Exception;

  public Question findByNo(int no) throws Exception;

  public int update(Question question) throws Exception;

  public int delete(int no) throws Exception;

  // List<ClassMember> findByKeyword(String keyword) throws Exception;

  public List<Question> findAll(int no) throws Exception;
  
  public List<Question> findByNoOfClass(int no) throws Exception;
}


