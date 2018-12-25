package yu.test;

import org.junit.Test;
import yu.bean.User;
import yu.service.UserService;
import yu.service.impl.UserServiceImpl;

public class UserTest {

    @Test
    public void login(){
        UserService userService=new UserServiceImpl();
        User user=new User();
        user.setUsername("wuwuwu");
        user.setPassword("123456");
        userService.login(user);

    }
}
