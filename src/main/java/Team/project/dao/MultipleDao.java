package Team.project.dao;

import java.util.HashMap;
import java.util.List;
import Team.project.domain.Multiple;
import Team.project.domain.Question;

public interface MultipleDao {

  public void insert(Multiple multiple) throws Exception;

  public int insertWithQuestion(Question question) throws Exception;

  public List<Multiple> findAll(int qno) throws Exception;

  public Multiple findByNo(int no) throws Exception;

  public void update(Multiple multiple) throws Exception;

  public void delete(int multipleNo) throws Exception;

  public void deleteAll(int questionNo) throws Exception;

  public Multiple getAnswer(HashMap<String, Integer> map) throws Exception;

}


