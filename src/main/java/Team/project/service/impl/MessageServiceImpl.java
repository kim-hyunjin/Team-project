package Team.project.service.impl;

import java.util.List;
import org.springframework.stereotype.Component;
import Team.project.dao.MessageDao;
import Team.project.domain.Message;
import Team.project.service.MessageService;

@Component
public class MessageServiceImpl implements MessageService {

  MessageDao msgDao;

  public MessageServiceImpl(MessageDao msgDao) {
    this.msgDao = msgDao;
  }

  @Override
  public void add(Message message) throws Exception {
    msgDao.insert(message);
  }

  @Override
  public List<Message> list() throws Exception {
    return msgDao.findAll();
  }

  @Override
  public int delete(int no) throws Exception {
    return msgDao.delete(no);
  }

  @Override
  public Message get(int no) throws Exception {
    return msgDao.findByNo(no);
  }

  @Override
  public int update(Message message) throws Exception {
    return msgDao.update(message);
  }

}
