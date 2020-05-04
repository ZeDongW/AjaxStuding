//获取ajax对象
function getAjax(){
    let ajax = null;
    try{
        ajax = new XMLHttpRequest();
    } catch (e) {
        ajax = new ActiveXObject("Microsoft.XMLHTTP");
    }
    return ajax;
}