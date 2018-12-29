package yu.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import yu.bean.Comment;
import yu.dao.CommentDao;
import yu.service.CommentService;

import java.util.List;

@Service
public class CommentServiceImpl implements CommentService {

    @Autowired
    private CommentDao commentDao;
    @Override
    public List<Comment> getComment(int messageId) {
        return commentDao.findComment(messageId);
    }

    @Override
    public int addComment(Comment comment) {
        return commentDao.addComment(comment);
    }
}
