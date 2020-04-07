package Team.project.service;

import java.util.List;
import Team.project.domain.Tag;

public interface TagService {
  void add(Tag tag) throws Exception;

  List<Tag> list() throws Exception;

  int delete(int no) throws Exception;

  Tag get(int no) throws Exception;

  int update(Tag tag) throws Exception;
}
