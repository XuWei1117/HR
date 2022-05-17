package com.sky; /**
 * Create by xww
 * 2021/9/18
 **/

import javax.imageio.ImageIO;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

@SuppressWarnings("all")
@WebServlet("/checkCodeServlet")
public class CheckCodeServlet extends HttpServlet {
    public String getCheckCode(){
        String str = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNPQRSTUVWXYZ0123456789";
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < 4; i++) {
            Random random = new Random();
            int n = random.nextInt(str.length());
            char c = str.charAt(n);
            sb.append(c);
        }
        return sb.toString();
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int width = 100;
        int height = 40;
        BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_3BYTE_BGR);
        Graphics g = image.getGraphics();
        g.setColor(Color.white);
        g.fillRect(0,0,width,height);
        g.setColor(Color.pink);
        g.setFont(new Font("微软雅黑", Font.BOLD,28));
        String checkCode = new CheckCodeServlet().getCheckCode();
        request.getSession().setAttribute("checkCode", checkCode);
        g.drawString(checkCode,14,28);
        request.getSession().setAttribute("checkCode", checkCode);
        ImageIO.write(image, "jpg", response.getOutputStream());

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
