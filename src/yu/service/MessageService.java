package yu.service;

import yu.bean.Message;

import java.util.List;

public interface MessageService {


    int addMessage(Message message);
    List<Message> findAllMessage(int start , int count);
    List<Message> findMessageLimit();
    Message getMessageDetail(int messageId);
    List<Message> getMessageByAuthorId(int userId,int trash);
    int updateTrashMessage(Message message);
    int deleteMessageById(int id);
    int updateMessageById(Message message);
    List<Message> searchMessage(String title);
}
