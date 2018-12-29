package yu.bean;

import java.util.Date;

public class Message {


    //类型         类型名       类型解释
    private int id;           //id
    private String title;      //标题
    private String content;    //内容
    private Date create_time;   //创建时间
    private int laud;          //点赞数量
    private String src;        //文章提取出的第一张图片
    private int auditing;      //审核状态
    private int category_id;   //专题id
    private int user_id;       //用户id
    private int trash;         //回收站


    private Category category; //专题
    private User user;       //评论者

    public Message() {
    }

    public Message(int id, String title, String content, Date create_time, int laud, String src, int auditing, int category_id, int user_id, Category category, User user) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.create_time = create_time;
        this.laud = laud;
        this.src = src;
        this.auditing = auditing;
        this.category_id = category_id;
        this.user_id = user_id;
        this.category = category;
        this.user = user;
    }


    public int getTrash() {
        return trash;
    }

    public void setTrash(int trash) {
        this.trash = trash;
    }

    public int getId() {
        return id;
    }

    public String getTitle() {
        return title;
    }

    public String getContent() {
        return content;
    }

    public Date getCreate_time() {
        return create_time;
    }

    public int getLaud() {
        return laud;
    }

    public String getSrc() {
        return src;
    }

    public int getAuditing() {
        return auditing;
    }

    public int getCategory_id() {
        return category_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public Category getCategory() {
        return category;
    }

    public User getUser() {
        return user;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public void setCreate_time(Date create_time) {
        this.create_time = create_time;
    }

    public void setLaud(int laud) {
        this.laud = laud;
    }

    public void setSrc(String src) {
        this.src = src;
    }

    public void setAuditing(int auditing) {
        this.auditing = auditing;
    }

    public void setCategory_id(int category_id) {
        this.category_id = category_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public void setUser(User user) {
        this.user = user;
    }
}

