package yu.dao;

import yu.bean.User;

import java.util.List;

public interface UserDao {
     /**
      * 后台查找全部用户
      * @return
      */
     List<User> findAll();

     /**前台登录
      *参数类型
      * @return
      */
     User login(User user);


     /**
      * 前台注册
      * @param user
      * @return
      */
     int addUser(User user);



}
