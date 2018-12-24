package yu.dao;

import yu.bean.User;

import java.util.List;

public interface UserDao {
     List<User> findAll();
}
