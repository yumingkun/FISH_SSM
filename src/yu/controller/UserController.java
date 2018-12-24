package yu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import yu.bean.User;
import yu.service.UserService;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/show")
public class UserController {


    @Autowired
    private UserService userService;


    @RequestMapping("/find")
    public  String   findAllUser(Model model){
        List<User> users =userService.selectAll();
        model.addAttribute("users",users);

        return "userShow";
    }
}
