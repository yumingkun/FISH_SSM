package yu.dao;

import org.apache.ibatis.annotations.Param;
import yu.bean.Comment;

import java.util.List;


public interface CommentDao {

    /**
     * 查询一篇文章所有的评论
     * @param messageId
     * @return
     */
    List<Comment> findComment(@Param("messageId")int  messageId );

    /**
     * 添加评论
     * @param comment
     * @return
     */
    int addComment(Comment comment);
}
