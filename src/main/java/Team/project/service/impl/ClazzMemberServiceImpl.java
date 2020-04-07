package Team.project.service.impl;

import java.util.List;
import Team.project.dao.ClazzMemberDao;
import Team.project.domain.ClazzMember;
import Team.project.service.ClazzMemberService;

public class ClazzMemberServiceImpl implements ClazzMemberService {

  ClazzMemberDao clazzMemberDao;

  public ClazzMemberServiceImpl(ClazzMemberDao clazzMemberDao) {
    this.clazzMemberDao = clazzMemberDao;
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
}
