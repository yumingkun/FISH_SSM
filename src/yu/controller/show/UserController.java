package yu.controller.show;

import org.apache.ibatis.annotations.Param;
//import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import yu.bean.User;
import yu.service.UserService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;


@Controller
@RequestMapping("/show/user")
public class UserController {

//    private static Logger logger = Logger.getLogger(UserController.class);


    @Autowired
    private UserService userService;


    /**
     * 前台处理get请求
     * @param name
     * @return
     */
    @GetMapping("/{name}")
    public String getPage(@PathVariable("name") String name){
        return name;
    }




    @PostMapping("/login")
    public  String login(@RequestParam String username,@RequestParam String password, Model model, HttpSession session){
        User user=new User();
        user.setUsername(username);
        user.setPassword(password);

        User user1=userService.login(user);

        session.setAttribute("user",user1);
        return  "redirect:/show/message/getAllMessage";
    }
    @PostMapping("/register")
    @ResponseBody
    public  User register(@RequestBody User user,Model model){
        int reslut=userService.addUser(user);
        return user;
    }




    @RequestMapping("/find")
    public  String   findAllUser(Model model){
        List<User> users =userService.selectAll();
        model.addAttribute("users",users);

        return "userShow";
    }

    @RequestMapping("/theUser/{userId}")
    public String  getUser(@PathVariable String userId,Model model){
        int id=Integer.parseInt(userId);
        User u=new User();
        u.setId(id);
        User user=userService.getUserById(u);
        model.addAttribute("user",user);

        return "user";

    }

    @RequestMapping("/quit")
    public String quit(HttpSession session){
        session.setAttribute("user","");

        return "login";
    }

    @RequestMapping("/updateUser")
    public String updateUser(User user,HttpSession session){
        User u=(User)session.getAttribute("user");
        u.setUsername(user.getUsername());
        u.setPassword(user.getPassword());
        u.setEmail(user.getEmail());
        int result=userService.updateUser(user);
        if (result>0){
            session.setAttribute("user",u);
        }
        return "forward:theUser/"+user.getId();
    }
}
