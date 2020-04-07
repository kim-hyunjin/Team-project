package Team.project.service;

import java.util.List;
import Team.project.domain.Multiple;

public interface MultipleService {

  void add(Multiple mulitple) throws Exception;

  List<Multiple> list() throws Exception;

  int delete(int no) throws Exception;

  Multiple get(int no) throws Exception;

  int update(Multiple multiple) throws Exception;
}
