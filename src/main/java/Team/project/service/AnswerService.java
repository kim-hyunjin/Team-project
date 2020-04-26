package Team.project.service;

import java.util.List;
import Team.project.domain.Answer;
import Team.project.domain.Assignment;

public interface AnswerService {

  void add(Answer answer) throws Exception;

  List<Answer> findAll() throws Exception;

  int delete(int no) throws Exception;

  Answer get(int no) throws Exception;

  int update(Answer answer) throws Exception;
  
  List<Answer> list(int no) throws Exception;
}
