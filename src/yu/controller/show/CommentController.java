package yu.controller.show;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import yu.bean.Comment;
import yu.service.CommentService;

import java.util.Date;

@Controller
@RequestMapping("/show/comment")
public class CommentController {
    @Autowired
    private CommentService commentService;


    @RequestMapping("/addComment")
    @ResponseBody
    public String addComment(@RequestBody Comment comment){
        comment.setCreate_time(new Date());
        int result=commentService.addComment(comment);
        return  "评论成功";
    }



    @RequestMapping("/addFollow/{followId}/{userId}")
    @ResponseBody
    public String addFollow(@PathVariable String followId,@PathVariable String userId){
        //第一次关注是insert 第二次关注是update


        return  "关注成功";
    }

}
