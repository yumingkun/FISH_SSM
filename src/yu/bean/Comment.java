package yu.bean;

import java.util.Date;

//评论
public class Comment {
    // id user_id message_id content laud create_time


    //类型         类型名       类型解释
    private int id;            //id
    private int user_id;        //评论者id
    private int message_id;     //文章ID
    private String content;   //评论内容
    private int laud;          //赞
    private Date create_time;  //评论时间


    private User user;         //此文章评论者的信息


    public Comment() {
    }

    public Comment(int id, int user_id, int message_id, String content, int laud, Date create_time, User user) {
        this.id = id;
        this.user_id = user_id;
        this.message_id = message_id;
        this.content = content;
        this.laud = laud;
        this.create_time = create_time;
        this.user = user;
    }

    public int getId() {
        return id;
    }

    public int getUser_id() {
        return user_id;
    }

    public int getMessage_id() {
        return message_id;
    }

    public String getContent() {
        return content;
    }

    public int getLaud() {
        return laud;
    }

    public Date getCreate_time() {
        return create_time;
    }

    public User getUser() {
        return user;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public void setMessage_id(int message_id) {
        this.message_id = message_id;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public void setLaud(int laud) {
        this.laud = laud;
    }

    public void setCreate_time(Date create_time) {
        this.create_time = create_time;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Override
    public String toString() {
        return "Comment{" +
                "id=" + id +
                ", user_id=" + user_id +
                ", message_id=" + message_id +
                ", content='" + content + '\'' +
                ", laud=" + laud +
                ", create_time=" + create_time +
                ", user=" + user +
                '}';
    }
}