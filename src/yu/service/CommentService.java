package yu.service;

import org.apache.ibatis.annotations.Param;
import yu.bean.Comment;
import yu.dao.CommentDao;

import java.util.List;

public interface CommentService {
    List<Comment> getComment(int  messageId );
    int addComment(Comment comment);
}
