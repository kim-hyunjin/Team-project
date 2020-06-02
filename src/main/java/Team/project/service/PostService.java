package Team.project.service;

import java.util.HashMap;
import java.util.List;
import Team.project.domain.Criteria;
import Team.project.domain.Post;

public interface PostService {

  void add(Post post) throws Exception;

  /////////////////////////////////////////////////////////////////////////////////////////
  List<Post> listAll(int boardNo) throws Exception;

  int delete(int no) throws Exception;

  Post get(int no) throws Exception;

  int update(Post post) throws Exception;

  List<Post> list(int boardNo, int pageNo) throws Exception; //

  List<Post> list(Criteria cri, int boardNo) throws Exception;

  int listCount(int boardNo) throws Exception; //

  List<Post> search(HashMap<String, Object> params) throws Exception;

  List<Post> noticeList(int classNo) throws Exception;
}

