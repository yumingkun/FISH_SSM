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

}
