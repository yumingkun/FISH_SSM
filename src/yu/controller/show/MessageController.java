package yu.controller.show;


//import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import yu.bean.*;
import yu.service.*;
import yu.util.GetImgStr;

import javax.jws.WebParam;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

@Controller
@Transactional
@RequestMapping("/show/message")
public class MessageController {
//    private static Logger logger = Logger.getLogger(MessageController.class);

    @Autowired
    private MessageService messageService;

    @Autowired
    private CategoryService categoryService;
    @Autowired
    private CarouselService carouselService;

    @Autowired
    private GetImgStr getImgStr;

    @Autowired
    private UserService userService;

    @Autowired
    private CommentService commentService;

    @RequestMapping("/toWrite")
    public String toWrite(Model model){
        //专题
        List<Category> categories=categoryService.getAll();
        model.addAttribute("categories",categories);
        return  "write";
    }


    //首页
    @RequestMapping("/getAllMessage")
    public String index(Model  model){
//        //专题
//        List<Category> categories=categoryService.getAll();
//        model.addAttribute("categories",categories);
        //轮播图
        List<Carousel> carousels=carouselService.getAllCarousel();
        //所有文章（首页先加载6条文章）
        List<Message> messages=messageService.findAllMessage(0,6);
        //排行前五的作者
        List<User> users=userService.getUserLimit();
        //文章排行前6的
        List<Message> messageLimit=messageService.findMessageLimit();

        model.addAttribute("carousels",carousels);
        model.addAttribute("messages",messages);
        model.addAttribute("userlimit",users);
        model.addAttribute("messageLimit",messageLimit);
        return "allMessage";
    }

    //加载更多
    @RequestMapping("/more/{num}")
    @ResponseBody
    public List<Message> more(@PathVariable() int num, Model  model){

        //起始位置
        int start=num*6;
        List<Message> messages=messageService.findAllMessage(start,6);
        return messages;
    }

    //添加文章
    @PostMapping("/addMessage")
//    @ResponseBody
    public  String addMessage(@RequestParam String title, @RequestParam String content, @RequestParam String categoryId, HttpSession session,Model model){
        //当前用户
        User user=(User)session.getAttribute("user");
        int user_id=user.getId();
        int category_id=Integer.parseInt(categoryId);
        if (title.length()>=4 && content.length()>=20){
            Message message=new Message();
            message.setTitle(title);
            message.setContent(content);
            message.setSrc(getImgStr.getOneImgStr(content));
            message.setUser_id(user_id);
            message.setCategory_id(category_id);
            message.setCreate_time(new Date());
            int result=messageService.addMessage(message);
            if (result>=0){
                return "redirect:/show/message/getAllMessage";
            }else {
                model.addAttribute("result",0);
                return "forward:toWrite";
            }

        }else {
            model.addAttribute("result",0);
            return "forward:toWrite";
        }



    }

    //文章详细信息
    @RequestMapping("/detail/{id}")
    public String detail(@PathVariable String id,Model model){
        int messageId=Integer.parseInt(id);

        Message message=messageService.getMessageDetail(messageId);
        List<Comment> comments=commentService.getComment(messageId);

        model.addAttribute("message",message);
        model.addAttribute("comments",comments);


        return "messageDetail";
    }

    //作者主页
    @RequestMapping("/author/{authorId}")
    public String getMessageByAuthorId(@PathVariable String authorId,Model model){
        int id=Integer.parseInt(authorId);
        int trash=0;
        List<Message> messages=messageService.getMessageByAuthorId(id,trash);

        User user=new User();
        user.setId(id);
        User author=userService.getUserById(user);

        model.addAttribute("messages",messages);
        model.addAttribute("author",author);

        return "authorMessage";
    }
    //个人博客
    @RequestMapping("/myMessage/{userId}")
    public  String myMessage(@PathVariable String userId,Model model){
        //专题
        List<Category> categories=categoryService.getAll();
        model.addAttribute("categories",categories);
        int id=Integer.parseInt(userId);
        int trash=0;
        List<Message> messages=messageService.getMessageByAuthorId(id,trash);
        model.addAttribute("messages",messages);

        return "userMessage";
    }
    //回收站
    @RequestMapping("/trashMessage/{userId}")
    public  String trashMessage(@PathVariable String userId,Model model){
        int id=Integer.parseInt(userId);
        int trash=1;
        List<Message> messages=messageService.getMessageByAuthorId(id,trash);
        model.addAttribute("messages",messages);

        return "userTrash";
    }
    //点击编辑
    @RequestMapping("/toUpdateMessage/{messageId}")
    @ResponseBody
    public  Message toUpdate(@PathVariable String messageId){
        int id=Integer.parseInt(messageId);
        Message message=messageService.getMessageDetail(id);

        return  message;
    }

    //放入回收站
    @RequestMapping("/trash/{messageId}")
    @ResponseBody
    public  String trash(@PathVariable String messageId){
        int id=Integer.parseInt(messageId);
        Message message=new Message();
        message.setId(id);
        message.setTrash(1);
        int result=messageService.updateTrashMessage(message);

        return "成功放入回收站";
    }



    //恢复
    @RequestMapping("/restore/{messageId}")
    @ResponseBody
    public  String restore(@PathVariable String messageId){
        int id=Integer.parseInt(messageId);
        Message message=new Message();
        message.setId(id);
        message.setTrash(0);
        int result=messageService.updateTrashMessage(message);
//        System.out.printf("--------------------"+result);

        return "成功恢复";
    }


    //彻底删除文章
    @RequestMapping("/delete/{messageId}")
    @ResponseBody
    public  String delete(@PathVariable String messageId){
        int id=Integer.parseInt(messageId);
        int result=messageService.deleteMessageById(id);

        return "成功恢复";
    }


    //更新文章
    @RequestMapping("/updateMessage")
//    @ResponseBody
    public  String update(Message message,HttpSession session,Model model){

        User user=(User) session.getAttribute("user");
        int id =user.getId();

        if (message.getContent().length()>=20 && message.getTitle().length()>=4){
            message.setSrc(getImgStr.getOneImgStr(message.getContent()));
            int result=messageService.updateMessageById(message);
            System.out.printf("更新文章------------------"+result);

            model.addAttribute("result",1);
        }else {
            model.addAttribute("result",0);
        }

        return "forward:myMessage/"+id;
    }

    //搜索文章
    @RequestMapping("/searchMessage")
    public String searchMessage(@RequestParam String search,Model model){
        if (search.length()>0){
            List<Message> messages=messageService.searchMessage(search);
            if (messages.size()>0){
                model.addAttribute("messages",messages);
                return "searchResult";
            }else {

                return "nullMessage";
            }

        }else {//直接回车
            return "nullMessage";
        }

    }

    //点赞
    @RequestMapping("/addLaud/{messageId}")
    @ResponseBody
    public String addLaud(@PathVariable String messageId){
        int id=Integer.parseInt(messageId);
        Message message=new Message();
        message.setId(id);
        message.setLaud(6);
        int result=messageService.addLaud(message);
        if (result>0){
            return "点赞成功";
        }

        return "点赞失败";
    }



}
