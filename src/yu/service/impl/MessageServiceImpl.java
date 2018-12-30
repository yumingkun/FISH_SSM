package yu.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import yu.bean.Message;
import yu.dao.MessageDao;
import yu.service.MessageService;

import java.util.List;


@Service
public class MessageServiceImpl implements MessageService {
    @Autowired
    private MessageDao messageDao;

    public MessageServiceImpl() {
    }

    @Override
    public int addMessage(Message message) {
        return messageDao.addMessage(message);
    }

    @Override
    public List<Message> findAllMessage(int start,int count) {
        return  messageDao.findAllMessage(start,count);
    }

    @Override
    public List<Message> findMessageLimit() {
        return messageDao.findMessage();
    }

    @Override
    public Message getMessageDetail(int messageId) {
        return messageDao.findMessageById(messageId);
    }

    @Override
    public List<Message> getMessageByAuthorId(int userId, int trash) {

        return messageDao.findMessage(userId,trash);

    }

    @Override
    public int updateTrashMessage(Message message) {
        return messageDao.updateMessage(message);
    }

    @Override
    public int deleteMessageById(int id) {
        return messageDao.deleteMessageById(id);
    }

    @Override
    public int updateMessageById(Message message) {
        return messageDao.updateMessageById(message);
    }

    @Override
    public List<Message> searchMessage(String title) {

        return messageDao.searchMessage(title);
    }

    @Override
    public int addLaud(Message message) {
        return messageDao.updateMessage(message);
    }
}
