// Joe Do
// implement a Java program to manipulate the hue property of images
import java.io.*;
import javax.imageio.*;
import java.awt.image.*;
import java.awt.Color;

public class ColorChanger{

  public static void main (String args[]) throws IOException{

    System.out.println("Joe Do");
    BufferedImage raw, processed;
    raw = ImageIO.read(new File("flower.png"));

    int width = raw.getWidth();
    int height = raw.getHeight();

    processed = new BufferedImage(width, height, raw.getType());
    float hue = 180/360.0f;

    for(int y=0; y<height;y++){
      for(int x=0;x<width;x++){
        //this is how we grab the RGB value of a pixel at x,y coordinates in the image
        int rgb = raw.getRGB(x,y);

      //extract the red value
        int red = (rgb >> 16) & 0x000000FF;

      //extract the green value
        int green = (rgb >> 8 ) & 0x000000FF;

      //extract the blue value
        int blue = (rgb) & 0x000000FF;

      // use Color.RGBtoHSB() method to convert RGB values to HSB
      float[] HSB = Color.RGBtoHSB(red, green, blue, null);
      float saturation = HSB[1];
      float brightness = HSB[2];


      // use Color.HSBtoRGB() method to convert the HSB value to a new RGB //value
      int newRGB = Color.HSBtoRGB(hue, saturation, brightness);
      red = (newRGB >> 16) & 0xFF;
      green = (newRGB >> 8) & 0xFF;
      blue = newRGB & 0xFF;

      // set the new RGB value to a pixel at x,y coordinates in the image
        processed.setRGB(x,y,newRGB);
      }
    }

    ImageIO.write(processed, "PNG", new File("processed180.png"));
  }
}
