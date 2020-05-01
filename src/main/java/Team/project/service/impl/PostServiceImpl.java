package Team.project.service.impl;

import java.util.List;
import org.springframework.stereotype.Component;
import Team.project.dao.PostDao;
import Team.project.domain.Post;
import Team.project.service.PostService;

@Component
public class PostServiceImpl implements PostService {

  PostDao postDao;

  public PostServiceImpl(PostDao postDao) {
    this.postDao = postDao;
  }

  @Override
  public void add(Post post) throws Exception {

  }

  @Override
  public List<Post> list() throws Exception {
    // TODO Auto-generated method stub
    return null;
  }

  @Override
  public int delete(int no) throws Exception {
    // TODO Auto-generated method stub
    return 0;
  }

  @Override
  public Post get(int no) throws Exception {
    // TODO Auto-generated method stub
    return null;
  }

  @Override
  public int update(Post post) throws Exception {
    // TODO Auto-generated method stub
    return 0;
  }

  @Override
  public List<Post> list(int no) throws Exception {
    return postDao.findAll(no);
  }

  @Override
  public List<Post> timelineList(int no) throws Exception {
    return postDao.findList(no);
  }

}
