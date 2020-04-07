package Team.project.service;

import java.util.List;
import Team.project.domain.Message;

public interface MessageService {
  void add(Message message) throws Exception;

  List<Message> list() throws Exception;

  int delete(int no) throws Exception;

  Message get(int no) throws Exception;

  int update(Message message) throws Exception;
}
