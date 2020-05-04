<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="image/jpeg"  import="java.awt.*,java.awt.image.*,java.util.*,javax.imageio.*" %>
<%!
	//随机数对象
	Random random = new Random();

	/**
	 * 生成随机颜色
	 * @return
	 */
	public Color getColor(){
		int r = random.nextInt(256);//0-255
		int g = random.nextInt(256);
		int b = random.nextInt(256);
		return new Color(r,g,b);
	}

	/**
	 * 生成随机字符
	 * @return
	 */
	public String getString(){
		StringBuffer sb = new StringBuffer();

		for (int i = 0; i < 4; i++) {
			int n = random.nextInt(62);
			if (n < 10){
				sb.append(n);
			} else if (n<36){
				sb.append((char)(n+55));
			} else {
				sb.append((char)(n+61));
			}
		}
		return sb.toString();
	}
%>
<%
	//设置图片不缓存
	response.setHeader("pragma", "mo-cache");
	response.setHeader("cache-control", "no-cache");
	response.setDateHeader("expires", 0);
	
	BufferedImage image = new BufferedImage(80,23,BufferedImage.TYPE_INT_RGB);
	
	Graphics g = image.getGraphics();
	g.setColor(new Color(200,200,200));
	g.fillRect(0,0,80,23);
	
	//生成不规则干扰线条
	for (int i = 0; i < 80; i++) {
		int x = random.nextInt(80);
		int y = random.nextInt(23);
		int xl = random.nextInt(x+10);
		int yl = random.nextInt(y+10);
		g.setColor(getColor());
		g.drawLine(x, y, x + xl, y + yl);
	}
	
	
	g.setFont(new Font("serif", Font.BOLD,16));
	g.setColor(Color.BLACK);
	String checkCode = getString();//"2525"
	
	StringBuffer sb = new StringBuffer();
	for(int i = 0; i< checkCode.length(); i++){
		sb.append(checkCode.charAt(i)+" ");//"2 5 2 5"
	}
	g.drawString(sb.toString(),15,20);
	
	session.setAttribute("CHECKCODE", checkCode);//2525
	
	ImageIO.write(image,"jpeg",response.getOutputStream());
	out.clear();
	out = pageContext.pushBody();
%>


