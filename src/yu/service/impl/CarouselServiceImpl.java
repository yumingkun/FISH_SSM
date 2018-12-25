package yu.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import yu.bean.Carousel;
import yu.dao.CarouselDao;
import yu.dao.CategoryDao;
import yu.service.CarouselService;

import java.util.List;


@Service
public class CarouselServiceImpl implements CarouselService {

    @Autowired
    private CarouselDao carouselDao;

    @Override
    public List<Carousel> getAllCarousel() {
        return carouselDao.findAll();
    }
}
