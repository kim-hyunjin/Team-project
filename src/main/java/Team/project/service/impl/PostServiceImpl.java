package Team.project.service.impl;

import java.util.HashMap;
import java.util.List;
import org.springframework.stereotype.Component;
import Team.project.dao.PostDao;
import Team.project.domain.Criteria;
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
    postDao.insert(post);
  }

  @Override
  public List<Post> listAll(int boardNo) throws Exception {
    return postDao.findAll(boardNo);
  }

  @Override
  public int delete(int no) throws Exception {
    return postDao.delete(no);
  }

  @Override
  public Post get(int no) throws Exception {
    return postDao.findByNo(no);
  }

  @Override
  public int update(Post post) throws Exception {
    return postDao.update(post);
  }

  @Override //
  public List<Post> list(int boardNo, int pageNo) throws Exception {
    HashMap<String, Integer> map = new HashMap<>();
    map.put("bno", boardNo);
    Criteria cri = new Criteria();
    if (pageNo > 0) {
      cri.setPage(pageNo);
    }
    map.put("rowStart", cri.getPageStart());
    map.put("rowEnd", 10);
    return postDao.list(map);
  }

  @Override //
  public List<Post> list(Criteria cri, int boardNo) throws Exception {
    HashMap<String, Integer> map = new HashMap<>();
    map.put("bno", boardNo);
    if (cri.getPage() > 0) {
      cri.setPage(cri.getPage());
    }
    map.put("page", cri.getPage());
    map.put("perPageNum", cri.getPerPageNum());
    map.put("rowStart", cri.getRowStart());
    map.put("rowEnd", cri.getRowEnd());
    return postDao.list(map);
  }

  @Override
  public int listCount(int boardNo) throws Exception {
    return postDao.listCount(boardNo);
  }

  @Override
  public List<Post> search(HashMap<String, Object> params) throws Exception {
    return postDao.findByKeyword(params);
  }

  @Override
  public List<Post> noticeList(int classNo) throws Exception {
    return postDao.findAllNewNoticePost(classNo);
  }


}
