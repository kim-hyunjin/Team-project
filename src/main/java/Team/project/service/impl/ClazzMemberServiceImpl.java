package Team.project.service.impl;

import java.util.HashMap;
import java.util.List;
import org.springframework.stereotype.Component;
import Team.project.dao.ClazzMemberDao;
import Team.project.domain.ClazzMember;
import Team.project.service.ClazzMemberService;

@Component
public class ClazzMemberServiceImpl implements ClazzMemberService {

  ClazzMemberDao clazzMemberDao;

  public ClazzMemberServiceImpl(ClazzMemberDao clazzMemberDao) {
    this.clazzMemberDao = clazzMemberDao;
  }

  @Override
	public List<ClazzMember> list(int classNo) throws Exception {
	  return clazzMemberDao.findAllByClassNo(classNo);
	}
  
  @Override
  public void add(ClazzMember clazzMember) throws Exception {
    clazzMemberDao.insert(clazzMember);
  }

  @Override
  public List<ClazzMember> list() throws Exception {
    return clazzMemberDao.findAll();
  }

  @Override
  public int delete(int no) throws Exception {
    return clazzMemberDao.delete(no);
  }

  @Override
  public ClazzMember get(int no) throws Exception {
    return clazzMemberDao.findByNo(no);
  }

  @Override
  public int update(ClazzMember clazzMember) throws Exception {
    return clazzMemberDao.update(clazzMember);
  }

  @Override
  public ClazzMember get(int userNo, int classNo) throws Exception {
    HashMap<String, Integer> map = new HashMap<>();
    map.put("userNo", userNo);
    map.put("classNo", classNo);
    return clazzMemberDao.findByUserNoAndClassNo(map);
  }

  @Override
  public List<ClazzMember> findAllByClassNo(int no) throws Exception {
    return clazzMemberDao.findAllByClassNo(no);
  }
}
