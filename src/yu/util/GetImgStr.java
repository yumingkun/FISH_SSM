package yu.util;

import org.springframework.stereotype.Component;

import java.util.HashSet;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Component
public class GetImgStr {

    /**
     * 提取富文本中的第一个图片src
     */
    public static  String getOneImgStr(String htmlStr) {
        Set<String> pics = new HashSet<String>();
        String img = "";
        Pattern p_image;
        Matcher m_image;
        //     String regEx_img = "<img.*src=(.*?)[^>]*?>"; //图片链接地址
        String regEx_img = "<img.*src\\s*=\\s*(.*?)[^>]*?>";
        p_image = Pattern.compile(regEx_img, Pattern.CASE_INSENSITIVE);
        m_image = p_image.matcher(htmlStr);

        if (m_image.find()) {
            // 得到<img />数据
            img = m_image.group();
            // 匹配<img>中 的src数据
            Matcher m = Pattern.compile("src\\s*=\\s*\"?(.*?)(\"|>|\\s+)").matcher(img);
            if (m.find()) {
                pics.add(m.group(1));
            }
        }
        return pics.size()>=1 ? pics.iterator().next():"";
    }

}
