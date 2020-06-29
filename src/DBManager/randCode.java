package DBManager;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

import static javax.imageio.ImageIO.*;


public class randCode extends HttpServlet{

    public randCode(){
        super();
    }
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        BufferedImage code =  new BufferedImage(60,45,BufferedImage.TYPE_INT_RGB);
        Graphics g = code.getGraphics();
        g.setColor(new Color(240,230,140));
        g.fillRect(0,0,60,45);
        char model [] = "abcdefghijklmnopqrstuvwxyz1234567890".toCharArray();
        StringBuffer record = new StringBuffer();
        Random r = new Random();
        int l = model.length;
        for(int i=0;i<4;i++){
            int rand = r.nextInt(l);
            g.setColor(new Color(r.nextInt(255),r.nextInt(255),r.nextInt(255)));
            g.drawString(model[rand]+"",i*10+9,10);
            record.append(model[rand]);
        }
        request.getSession().setAttribute("picCode",record.toString());
        ImageIO.write(code, "jpg", response.getOutputStream());
    }

}
