package yu.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;
import yu.bean.Message;

import java.util.List;

public interface MessageDao {

    int addMessage(Message message);

    List<Message>  findAllMessage(@Param("start") int start,@Param("count") int count);

    /**
     * 文章排行前六
     * @return
     */
    List<Message> findMessage();

    /**
     * 文章详情
     */
    Message findMessageById(@Param("messageId") int messageId);


    /**
     *查询作者的不在回收站（trash=0）的文章
     * @param userId
     * @return
     */
    List<Message> findMessage(@Param("userId") int userId,@Param("theTrash") int trash);


    /**
     * 文章放入回收站或者恢复或点赞
     * @return
     */
    int updateMessage(Message message);


    /**
     * 彻底删除文章
     * @param id
     * @return
     */
    int deleteMessageById(int id);

    /**
     * 更新文章
     * @param message
     * @return
     */
    int updateMessageById(Message message);


    /**
     * 模糊查询文章
     * @param title
     * @return
     */
    List<Message> searchMessage(@Param("title") String title);


}
