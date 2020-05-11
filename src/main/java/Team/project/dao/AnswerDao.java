package Team.project.dao;

import java.util.List;
import java.util.Map;
import Team.project.domain.Answer;

public interface AnswerDao {

  public int insert(Answer answer) throws Exception;

  public List<Answer> findAll() throws Exception;

  public Answer findByNo(int no) throws Exception;

  public int update(Answer answer) throws Exception;

  public int delete(int no) throws Exception;

  public List<Answer> findByUserNo(int no) throws Exception;

  public List<Answer> findAllByQuestionNo(int qno) throws Exception;

  public Answer findbyMemberNoAndQuestionNo(Map<String, Integer> map);
}


