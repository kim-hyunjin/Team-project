package Team.project.service;

import java.util.List;
import Team.project.domain.ClazzMember;

public interface ClazzMemberService {

  void add(ClazzMember clazzMember) throws Exception;

  List<ClazzMember> list() throws Exception;

  List<ClazzMember> list(int no) throws Exception;

  int delete(int no) throws Exception;

  ClazzMember get(int no) throws Exception;

  int update(ClazzMember clazzMember) throws Exception;

  public ClazzMember get(int userNo, int classNo) throws Exception;

  List<ClazzMember> findAllByClassNo(int no) throws Exception;
}
