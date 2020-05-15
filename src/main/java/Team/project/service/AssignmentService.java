package Team.project.service;

import java.util.List;
import Team.project.domain.Assignment;

public interface AssignmentService {

  void add(Assignment assignment) throws Exception;

  List<Assignment> list() throws Exception;

  List<Assignment> list(int no) throws Exception;

  int delete(int no) throws Exception;

  Assignment get(int no) throws Exception;

  int update(Assignment assignment) throws Exception;
  
  // 캘린더 에대한 정보 출력

  List<Assignment> allList(int no) throws Exception;
  
}
