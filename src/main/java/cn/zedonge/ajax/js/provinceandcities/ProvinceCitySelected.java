package cn.zedonge.ajax.js.provinceandcities;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * @ClassName ProvinceCitySelected
 * @Description: 省份城市选择
 * @Author ZeDongW
 * @Date 2020/5/2 0002 19:46
 * @Version 1.0
 * @Modified By:
 * @Modified Time:
 **/
public class ProvinceCitySelected extends HttpServlet {

    private final static String HUBEI = "湖北";
    private final static String GUANGDONG = "广东";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/xml;charset=UTF-8");
        String province = req.getParameter("province");
        StringBuilder sb = new StringBuilder();
        sb.append("<?xml version='1.0' encoding='UTF-8'?><root>");
        if (HUBEI.equals(province)){
            sb.append("<city>武汉</city>");
            sb.append("<city>黄冈</city>");
            sb.append("<city>鄂州</city>");
            sb.append("<city>荆州</city>");
        } else if (GUANGDONG.equals(province)){
            sb.append("<city>广州</city>");
            sb.append("<city>深圳</city>");
            sb.append("<city>佛山</city>");
        }
        sb.append("</root>");
        PrintWriter writer = resp.getWriter();
        writer.write(sb.toString());
        writer.flush();
        writer.close();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
