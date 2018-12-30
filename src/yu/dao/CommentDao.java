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

    /**
     * 用户所有的评论
     * @return
     */
    List<Comment> findCommentByUserId(@Param("userId") int userId);


    /**
     * 删除评论
     * @param commentId
     * @return
     */
    int  deleteComment(@Param("commentId") int commentId);
}
