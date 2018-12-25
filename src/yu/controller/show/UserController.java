package yu.controller.show;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import yu.bean.User;
import yu.service.UserService;

import javax.servlet.http.HttpServletRequest;
import java.util.List;


@Controller
@RequestMapping("/show/user")
public class UserController {

    private static Logger logger = Logger.getLogger(UserController.class);


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
    public  String login(@RequestParam String username,@RequestParam String password, Model model, HttpServletRequest request){
        User user=new User();
        user.setPassword(username);
        user.setPassword(password);
        User user1=userService.login(user);
        request.getSession().setAttribute("user",request);
        model.addAttribute("user",user1);
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
}
