package yu.service;

import yu.bean.User;

import java.util.List;

public interface UserService {
    public List<User> selectAll();

    User login(User user);

    int addUser(User user);
}
