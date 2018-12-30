package yu.service.impl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import yu.bean.User;
import yu.dao.UserDao;
import yu.service.UserService;

import java.util.List;

@Service
@Transactional
public class UserServiceImpl  implements UserService {

    @Autowired
    private UserDao userDao;

    @Override
    public List<User> selectAll() {
        return userDao.findAll();
    }

    @Override
    public User login(User user) {
        return  userDao.getUser(user);
    }

    @Override
    public int addUser(User user) {
        return userDao.addUser(user);
    }

    @Override
    public List<User> getUserLimit() {
        return userDao.getUserLimit();
    }

    @Override
    public User getUserById(User user) {
        return userDao.getUser(user);
    }

    @Override
    public int updateUser(User user) {
        return userDao.updateUser(user);
    }

    @Override
    public int updateUserHead(User user) {
        return userDao.updateUser(user);
    }


}
