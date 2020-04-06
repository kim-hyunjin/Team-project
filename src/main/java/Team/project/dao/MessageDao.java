package Team.project.dao;

import java.util.List;
import Team.project.domain.Message;

public interface MessageDao {
  public int insert(Message message) throws Exception;

  public List<Message> findAll() throws Exception;

  public Message findByNo(int no) throws Exception;

  public int update(Message message) throws Exception;

  public int delete(int no) throws Exception;

}

