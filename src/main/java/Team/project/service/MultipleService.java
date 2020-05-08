package Team.project.service;

import java.util.List;
import Team.project.domain.Multiple;

public interface MultipleService {

  List<Multiple> list(int qno) throws Exception;

  void insert(Multiple multiple) throws Exception;

  void update(Multiple multiple) throws Exception;

  Multiple get(int no) throws Exception;

  Multiple getAnswer(int questionNo, int multipleNo) throws Exception;

  void update(List<Multiple> multiples) throws Exception;

  void delete(int multipleNo) throws Exception;
}
