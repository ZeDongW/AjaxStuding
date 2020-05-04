package cn.zedonge.ajax.js.user;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * @ClassName UserRegister
 * @Description: 模拟用户注册
 * @Author ZeDongW
 * @Date 2020/4/30 0030 13:18
 * @Version 1.0
 * @Modified By:
 * @Modified Time:
 **/
public class UserRegister extends HttpServlet {

    private static final String JACK = "jack";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");
        PrintWriter pw = resp.getWriter();
        String userName = req.getParameter("userName");
        if (JACK.equals(userName)){
            pw.write("<span class='red'>该用户名已被注册</span>");
        } else {
            pw.write("<span class='green'>该用户名可以注册</span>");
        }
        pw.flush();
        pw.close();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
