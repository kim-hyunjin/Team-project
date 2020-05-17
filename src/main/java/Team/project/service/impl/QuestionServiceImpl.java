package Team.project.service.impl;

import java.util.List;
import org.springframework.stereotype.Component;
import Team.project.dao.MultipleDao;
import Team.project.dao.QuestionDao;
import Team.project.domain.Question;
import Team.project.service.QuestionService;

@Component
public class QuestionServiceImpl implements QuestionService {

  QuestionDao questionDao;
  MultipleDao multipleDao;

  public QuestionServiceImpl(QuestionDao questionDao, MultipleDao multipleDao) {
    this.questionDao = questionDao;
    this.multipleDao = multipleDao;
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
  public void update(Question question) throws Exception {
    questionDao.update(question);
  }

  @Override
  public List<Question> list(int no) throws Exception {
    return questionDao.findAll(no);
  }
@Override
public List<Question> allList(int no) throws Exception {
  return questionDao.findByNoOfClass(no);
}


}
