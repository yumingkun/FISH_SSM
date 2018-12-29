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
     User getUser(User user);


     /**
      * 前台注册
      * @param user
      * @return
      */
     int addUser(User user);

     /**
      * 得到文章数排行前五的作者信息
      * @return
      */
      List<User> getUserLimit();

     /**
      * 更新用户
      * @param user
      * @return
      */
      int updateUser(User user);





}
