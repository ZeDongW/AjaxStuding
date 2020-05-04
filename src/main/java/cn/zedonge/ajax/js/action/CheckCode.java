package cn.zedonge.ajax.js.action;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * @ClassName CheckCode
 * @Description: 验证码校验
 * @Author ZeDongW
 * @Date 2020/5/4 0004 20:27
 * @Version 1.0
 * @Modified By:
 * @Modified Time:
 **/
public class CheckCode extends ActionSupport {

    /**
     * Description: 验证码校验
     * @methodName: checkCode
     * @param
     * @throws
     * @return: java.lang.String
     * @author: ZeDongW
     * @date: 2020/5/4 0004 20:28
     */
    public String checkCode() {
        //获取request对象
        HttpServletRequest req = ServletActionContext.getRequest();
        //获取response对象
        HttpServletResponse resp = ServletActionContext.getResponse();
        //设置返回格式
        resp.setContentType("text/html;charset=UTF-8");
        //获取session对象
        HttpSession session = req.getSession();
        //返回图片路径
        String image = "image/MsgError.gif";
        //获取请求的验证码
        String code = ServletActionContext.getRequest().getParameter("code").toUpperCase();
        //获取session中的验证码
        String checkCode = ((String) session.getAttribute("CHECKCODE")).toUpperCase();
        //校验验证码是否相等
        if (checkCode.equals(code)){
            image = "image/MsgSent.gif";
        }
        PrintWriter pw = null;
        try {
            //获取输出流
            pw = resp.getWriter();
            //输出图片路径
            pw.write(image);
            //刷新缓冲流
            pw.flush();
        } catch (IOException e) {
            throw new RuntimeException(e);
        } finally {
            //流对象不为空
            if (pw != null) {
            //关闭流对象
            pw.close();
            }
        }
        return null;
    }
}
