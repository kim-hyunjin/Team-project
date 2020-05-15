package Team.project.service;

import java.util.List;
import Team.project.domain.Assignment;
import Team.project.domain.Question;

public interface QuestionService {

  void add(Question question) throws Exception;

  List<Question> list() throws Exception;

  List<Question> list(int no) throws Exception;

  int delete(int no) throws Exception;

  Question get(int no) throws Exception;

  void update(Question question) throws Exception;
  
  
  // 캘린더 에대한 정보 출력
  List<Question> allList(int no) throws Exception;

}
