package Team.project.service;

import java.sql.Date;
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
  
  // 캘린더 과제 출력하기(마감일만 표시)
  Clazz get(Date date) throws Exception;
}
