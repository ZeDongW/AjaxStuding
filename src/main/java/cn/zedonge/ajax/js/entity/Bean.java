package cn.zedonge.ajax.js.entity;

/**
 * @ClassName Bean
 * @Description:
 * @Author ZeDongW
 * @Date 2020/5/5 0005 13:26
 * @Version
 * @Modified By:
 * @Modified Time:
 **/
public class Bean {
    private String province;
    private String city;

    public Bean() {
    }

    public Bean(String province, String city) {
        this.province = province;
        this.city = city;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }
}
