package Team.project.service;

import java.util.List;
import Team.project.domain.AssignmentSubmit;

public interface AssignmentSubmitService {

  void add(AssignmentSubmit assignmentSubmit) throws Exception;

  List<AssignmentSubmit> list(int no) throws Exception;

  int delete(int no) throws Exception;

  AssignmentSubmit get(int no) throws Exception;

  int update(AssignmentSubmit assignmentSubmit) throws Exception;

}
