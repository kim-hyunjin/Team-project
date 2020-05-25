package Team.project.service;

import java.util.List;
import Team.project.domain.Clazz;

public interface ClazzService {

  int add(Clazz clazz) throws Exception;

  List<Clazz> list() throws Exception;

  int delete(int no) throws Exception;

  Clazz get(int no) throws Exception;

  int update(Clazz clazz) throws Exception;

  List<Clazz> list(int no) throws Exception;

  // 수업코드로 참여하기
  Clazz get(String code) throws Exception;
}
