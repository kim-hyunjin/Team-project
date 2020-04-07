package Team.project.service;

import java.util.List;
import Team.project.domain.AssignmentSubmmit;

public interface AssignmentSubmmitService {

  void add(AssignmentSubmmit assignmentSubmmit) throws Exception;

  List<AssignmentSubmmit> list() throws Exception;

  int delete(int no) throws Exception;

  AssignmentSubmmit get(int no) throws Exception;

  int update(AssignmentSubmmit assignmentSubmmit) throws Exception;

}
