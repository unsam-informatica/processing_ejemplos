void setup(){
  PImage src = loadImage("https://elblogverde.com/wp-content/uploads/2013/03/casa-ecologica.jpg");

  size(1000,500);
  noStroke();

  //display original image
  image(src,0,0);

  //display RGB average color
  fill(extractColorFromImage(src));
  rect(src.width,0,src.width,src.height);

  //display (perceptual)Lab average color
  fill(extractAverageColorFromImage(src));
  rect(src.width*2,0,src.width,src.height);

  //display the most dominant colour
  fill(extractDominantColorFromImage(src));
  rect(src.width*3,0,src.width,src.height);

}

color extractDominantColorFromImage(PImage img){
  //create a hashmap - the key is the colour, the value associated is the number of pixels per colour
  HashMap<Integer,Integer> colorCounter = new HashMap<Integer,Integer>();
  int numPixels = img.pixels.length;

  for (int i=0; i<numPixels; i++){
    int colorKey = img.pixels[i];
    //if the colour has already been added to the hashmap, increment the count
    if(colorCounter.containsKey(colorKey)){
      colorCounter.put(colorKey,colorCounter.get(colorKey)+1);
    }else{//otherwise count it as 1
      colorCounter.put(colorKey,1);
    }
  }
  //find the most dominant colour - note you can implement this to return more than one if you need to
  int max = 0;//what's the highest density of pixels per one colour
  int dominantColor = 0;//which colour is it

  //for each key (colour) in the keyset  
  for(int colorKey : colorCounter.keySet()){
    //get the pixel count per colour
    int count = colorCounter.get(colorKey);
    //if this one is the highest, updated the max value and keep track of the colour
    if(count > max){
      max = count;
      dominantColor = colorKey; 
    }
  }
  //return the winner (colour with most pixels associated)
  return dominantColor;
}

color extractColorFromImage(PImage img) 
{ 
    img.loadPixels(); 
    int r = 0, g = 0, b = 0; 
    for (int i=0; i<img.pixels.length; i++) 
    { 
        color c = img.pixels[i]; 
        r += c>>16&0xFF; 
        g += c>>8&0xFF; 
        b += c&0xFF;
    } 
    r /= img.pixels.length; g /= img.pixels.length; b /= img.pixels.length;
    return color(r, g, b);
}

color extractAverageColorFromImage(PImage img){
  float[] average = new float[3];
  CIELab lab = new CIELab();

  int numPixels = img.pixels.length;
  for (int i=0; i<numPixels; i++){
    color rgb = img.pixels[i];

    float[] labValues = lab.fromRGB(new float[]{red(rgb),green(rgb),blue(rgb)});

    average[0] += labValues[0];
    average[1] += labValues[1];
    average[2] += labValues[2];
  }

  average[0] /= numPixels;
  average[1] /= numPixels;
  average[2] /= numPixels;

  float[] rgb = lab.toRGB(average);

  return color(rgb[0] * 255,rgb[1] * 255,rgb[2] * 255);
}

//from https://stackoverflow.com/questions/4593469/java-how-to-convert-rgb-color-to-cie-lab
import java.awt.color.ColorSpace;

public class CIELab extends ColorSpace {

    @Override
    public float[] fromCIEXYZ(float[] colorvalue) {
        double l = f(colorvalue[1]);
        double L = 116.0 * l - 16.0;
        double a = 500.0 * (f(colorvalue[0]) - l);
        double b = 200.0 * (l - f(colorvalue[2]));
        return new float[] {(float) L, (float) a, (float) b};
    }

    @Override
    public float[] fromRGB(float[] rgbvalue) {
        float[] xyz = CIEXYZ.fromRGB(rgbvalue);
        return fromCIEXYZ(xyz);
    }

    @Override
    public float getMaxValue(int component) {
        return 128f;
    }

    @Override
    public float getMinValue(int component) {
        return (component == 0)? 0f: -128f;
    }    

    @Override
    public String getName(int idx) {
        return String.valueOf("Lab".charAt(idx));
    }

    @Override
    public float[] toCIEXYZ(float[] colorvalue) {
        double i = (colorvalue[0] + 16.0) * (1.0 / 116.0);
        double X = fInv(i + colorvalue[1] * (1.0 / 500.0));
        double Y = fInv(i);
        double Z = fInv(i - colorvalue[2] * (1.0 / 200.0));
        return new float[] {(float) X, (float) Y, (float) Z};
    }

    @Override
    public float[] toRGB(float[] colorvalue) {
        float[] xyz = toCIEXYZ(colorvalue);
        return CIEXYZ.toRGB(xyz);
    }

    CIELab() {
        super(ColorSpace.TYPE_Lab, 3);
    }

    private double f(double x) {
        if (x > 216.0 / 24389.0) {
            return Math.cbrt(x);
        } else {
            return (841.0 / 108.0) * x + N;
        }
    }

    private double fInv(double x) {
        if (x > 6.0 / 29.0) {
            return x*x*x;
        } else {
            return (108.0 / 841.0) * (x - N);
        }
    }

//    private Object readResolve() {
//        return getInstance();
//    }

//    private static class Holder {
//        static final CIELab INSTANCE = new CIELab();
//    }

//    private static final long serialVersionUID = 5027741380892134289L;

    private final ColorSpace CIEXYZ =
        ColorSpace.getInstance(ColorSpace.CS_CIEXYZ);

    private final double N = 4.0 / 29.0;

}
