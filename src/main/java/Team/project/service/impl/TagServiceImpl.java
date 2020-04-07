package Team.project.service.impl;

import java.util.List;
import org.springframework.stereotype.Component;
import Team.project.dao.TagDao;
import Team.project.domain.Tag;
import Team.project.service.TagService;

@Component
public class TagServiceImpl implements TagService {

  TagDao tagDao;

  public TagServiceImpl(TagDao tagDao) {
    this.tagDao = tagDao;
  }

  @Override
  public void add(Tag tag) throws Exception {
    tagDao.insert(tag);
  }

  @Override
  public List<Tag> list() throws Exception {
    return tagDao.findAll();
  }

  @Override
  public int delete(int no) throws Exception {
    return tagDao.delete(no);
  }

  @Override
  public Tag get(int no) throws Exception {
    return tagDao.findByNo(no);
  }

  @Override
  public int update(Tag tag) throws Exception {
    return tagDao.update(tag);
  }

}
