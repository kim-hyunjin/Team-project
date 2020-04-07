package Team.project.service;

import java.util.List;
import Team.project.domain.Question;

public interface QuestionService {

  void add(Question question) throws Exception;

  List<Question> list() throws Exception;

  int delete(int no) throws Exception;

  Question get(int no) throws Exception;

  int update(Question question) throws Exception;
}
