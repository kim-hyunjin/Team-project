package Team.project.service;

import java.util.List;
import Team.project.domain.Post;

public interface PostService {

  void add(Post post) throws Exception;

  List<Post> list() throws Exception;

  int delete(int no) throws Exception;

  Post get(int no) throws Exception;

  int update(Post post) throws Exception;

  List<Post> list(int no) throws Exception;
}
