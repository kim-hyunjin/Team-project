package Team.project.service.impl;

import java.util.List;
import org.springframework.stereotype.Component;
import Team.project.dao.QuestionDao;
import Team.project.domain.Question;
import Team.project.service.QuestionService;

@Component
public class QuestionServiceImpl implements QuestionService {

  QuestionDao questionDao;

  public QuestionServiceImpl(QuestionDao questionDao) {
    this.questionDao = questionDao;
  }

  @Override
  public void add(Question question) throws Exception {
    questionDao.insert(question);
  }

  @Override
  public List<Question> list() throws Exception {
    return questionDao.findAll();
  }

  @Override
  public int delete(int no) throws Exception {
    return questionDao.delete(no);
  }

  @Override
  public Question get(int no) throws Exception {
    return questionDao.findByNo(no);
  }

  @Override
  public int update(Question question) throws Exception {
    return questionDao.update(question);
  }

  @Override
  public List<Question> list(int no) throws Exception {
    return questionDao.findAll(no);
  }



}
