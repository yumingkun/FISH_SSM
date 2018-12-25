package yu.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import yu.bean.Category;
import yu.dao.CategoryDao;
import yu.service.CategoryService;

import java.util.List;

@Service
public class CategoryServiceImpl implements CategoryService {

    @Autowired
    private CategoryDao  categoryDao;

    @Override
    public List<Category> getAll() {
        return categoryDao.findAll();
    }
}
