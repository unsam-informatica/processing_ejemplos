// carga constante de imágenes correlativas
// imágenes de referencia para este sketch en el drive, carpeta processing

int maxImages = 10;
int imageIndex = 0;

PImage [] images = new PImage [maxImages]; 

void setup (){
  size (500,500);
  for(int i = 0; i < images.length; i++) {
    images[i] = loadImage("img0"+i+".jpg"); 
    println ("img0"+i+".jpg");
  }
}

void draw () {
  image (images[imageIndex],0,0);
  imageIndex = (imageIndex+1) % images.length;
  println (imageIndex);
}
