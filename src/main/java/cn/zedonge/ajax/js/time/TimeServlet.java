package cn.zedonge.ajax.js.time;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @ClassName TimeServlet
 * @Description: 获取时间当前
 * @Author ZeDongW
 * @Date 2020/4/28 0028 11:27
 * @Version 1.0
 * @Modified By:
 * @Modified Time:
 **/
public class TimeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        req.setAttribute("nowTime", sdf.format(new Date()));
        req.getRequestDispatcher("/time.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
