package yu.controller.show;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import yu.bean.Carousel;
import yu.bean.Category;
import yu.service.CarouselService;
import yu.service.CategoryService;

import java.util.List;

@Controller
@Transactional
@RequestMapping("/show/message")
public class MessageController {

    @Autowired
    private CategoryService categoryService;
    @Autowired
    private CarouselService carouselService;

    @GetMapping("toWrite")
    public String toWrite(){
        return  "write";
    }

    @RequestMapping("/getAllMessage")
    public String index(Model  model){
        //专题
        List<Category> categories=categoryService.getAll();
        model.addAttribute("categories",categories);
        //轮播图
        List<Carousel> carousels=carouselService.getAllCarousel();
        model.addAttribute("carousels",carousels);
        return "allMessage";
    }
}
