package cn.zedonge.ajax.js.action;

import cn.zedonge.ajax.js.entity.Bean;
import com.opensymphony.xwork2.ActionSupport;

import java.util.ArrayList;
import java.util.List;

/**
 * @ClassName ProvinceCityArea
 * @Description: 省份城市区域下拉框三级联动
 * @Author ZeDongW
 * @Date 2020/5/5 0005 11:15
 * @Version 1.0
 * @Modified By:
 * @Modified Time:
 **/
public class ProvinceCityArea extends ActionSupport {

    private static final String HUBEI = "湖北";
    private static final String GUANGDONG = "广东";
    private static final String YUNNAN = "云南";
    private static final String WUHAN = "武汉";
    private static final String HUANGGANG = "黄冈";
    private static final String XIANNING = "咸宁";
    private static final String GUANGZHOU = "广州";
    private static final String SHENZHEN = "深圳";
    private static final String KUNMING = "昆明";

    /**
     * 城市集合
     */
    private List<String> cityList;

    /**
     * 区域集合
     */
    private List<String> areaList;

    public List<String> getCityList() {
        return cityList;
    }

    public List<String> getAreaList() {
        return areaList;
    }

    private Bean bean;

    public Bean getBean() {
        return bean;
    }

    public void setBean(Bean bean) {
        this.bean = bean;
    }

    /**
     * Description: 根据选择的省份返回城市
     * @methodName: selectProvince
     * @param
     * @throws
     * @return: java.lang.String
     * @author: ZeDongW
     * @date: 2020/5/5 0005 11:37
     */
    public String province(){
        //获取省份
        String province = bean.getProvince();
        cityList = new ArrayList<>();
        if (HUBEI.equals(province)){
            cityList.add(WUHAN);
            cityList.add(HUANGGANG);
            cityList.add(XIANNING);
        } else if (GUANGDONG.equals(province)){
            cityList.add(GUANGZHOU);
            cityList.add(SHENZHEN);
        }else if (YUNNAN.equals(province)){
            cityList.add(KUNMING);
        }

        return "success";
    }

    /**
     * Description: 根据选择的城市返回地区
     * @methodName: selectCity
     * @param
     * @throws
     * @return: java.lang.String
     * @author: ZeDongW
     * @date: 2020/5/5 0005 11:38
     */
    public String city(){
        //获取城市
        String city = bean.getCity();
        areaList = new ArrayList<>();
        switch (city){
            case WUHAN:
                areaList.add("硚口");
                areaList.add("江岸");
                areaList.add("武昌");
                break;
            case HUANGGANG:
                areaList.add("麻城");
                areaList.add("红安");
                break;
            case XIANNING:
                areaList.add("温泉");
                areaList.add("嘉鱼");
                areaList.add("通山");
                break;
            case GUANGZHOU:
                areaList.add("天河");
                areaList.add("番禺");
                break;
            case SHENZHEN:
                areaList.add("南山");
                areaList.add("保安");
                areaList.add("龙岗");
                break;
            case KUNMING:
                areaList.add("盘龙");
                areaList.add("官渡");
                break;
            default:
                break;
        }

        return "success";
    }

}
