package yu.controller.manage;

import org.apache.log4j.Logger;
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
@RequestMapping("/show")
public class UserController {

    private static Logger logger = Logger.getLogger(UserController.class);


    @Autowired
    private UserService userService;



    @GetMapping("/{name}")
    public String getPage(@PathVariable("name") String name){
        return name;
    }

    @PostMapping("/login")
    public  String login(@RequestParam String username, @RequestParam String password, Model model, HttpServletRequest request){
        User user=new User();
        user.setUsername(username);
        user.setPassword(password);
        User result=userService.login(user);
        request.getSession().setAttribute("user",request);
        model.addAttribute("user",result);
        return  "test";

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
