// imágenes de referencia para este sketch en el drive, carpeta processing

int imgCount = 11;
PImage[] imgs = new PImage[imgCount];
float imgW;

int imgActual=1;

void setup() {
  size(640, 360);
  imgW = width/imgCount;
  for (int i = 0; i < imgCount; i++) {
    imgs[i] = requestImage("img"+nf(i, 2)+".jpg");
    //println(imgs[i]);
  }
}

void draw() {
  //int y = (height - imgs[0].height) / 2;
  if((pmouseX != mouseX || pmouseY != mouseY)){
    if(imgActual < imgCount-1){
      imgActual++;
      image(imgs[imgActual], mouseX, mouseY, 100, 100);
      //println(imgActual);
    }else{
      imgActual=0;
    }
    println (imgActual);
  }
  /*for (int i = 0; i < imgs.length; i++) {
    image(imgs[i], mouseX*i, mouseY*i, imgs[i].height, imgs[i].height);
  }*/
}
