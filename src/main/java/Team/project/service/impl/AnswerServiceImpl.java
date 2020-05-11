package Team.project.service.impl;

import java.util.HashMap;
import java.util.List;
import org.springframework.stereotype.Component;
import Team.project.dao.AnswerDao;
import Team.project.domain.Answer;
import Team.project.service.AnswerService;

@Component
public class AnswerServiceImpl implements AnswerService {

  AnswerDao answerDao;

  public AnswerServiceImpl(AnswerDao answerDao) {
    this.answerDao = answerDao;
  }

  @Override
  public void add(Answer answer) throws Exception {
    answerDao.insert(answer);
  }

  @Override
  public List<Answer> findAll() throws Exception {
    return answerDao.findAll();
  }

  @Override
  public int delete(int no) throws Exception {
    return answerDao.delete(no);
  }

  @Override
  public Answer get(int no) throws Exception {
    return answerDao.findByNo(no);
  }

  @Override
  public int update(Answer answer) throws Exception {
    return answerDao.update(answer);
  }

  @Override
  public List<Answer> list(int no) throws Exception {
    return answerDao.findByUserNo(no);
  }

  @Override
  public List<Answer> findAll(int qno) throws Exception {
    return answerDao.findAllByQuestionNo(qno);
  }

  @Override
  public Answer get(int memberNo, int questionNo) throws Exception {
    HashMap<String, Integer> map = new HashMap<>();
    map.put("memberNo", memberNo);
    map.put("questionNo", questionNo);
    return answerDao.findbyMemberNoAndQuestionNo(map);
  }



}
