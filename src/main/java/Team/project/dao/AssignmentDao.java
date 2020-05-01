package Team.project.dao;

import java.util.List;
import Team.project.domain.Assignment;

public interface AssignmentDao {

  public int insert(Assignment assignment) throws Exception;

  public List<Assignment> findAll() throws Exception;

  // 성적에서 클래스 정보를 출력
  public Assignment findByNo(int no) throws Exception;

  public int update(Assignment assignment) throws Exception;

  public int delete(int no) throws Exception;
  
  // 수업에서 수업 넘버에 대한 과제 출력
  public List<Assignment> findByClassNo(int no) throws Exception;

  // 수업에서 과제, 질문에 대한 모든 문구 출력
  public List<Assignment> findByLesson(int no) throws Exception;
  
}
