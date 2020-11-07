// puedo definir varias imágenes en una misma linea
PImage mapa, img1, img2, img3;
float escalaThumb=2;

void setup(){
  size(800,800);
  mapa=loadImage("relativity.jpg");
  img1=loadImage("Metamorphose05.jpg");
  img2=loadImage("Metamorphose13.jpg");
  img3=loadImage("Metamorphose17.jpg");
  // todas las imágenes del sketch tiene su punto de coordenadas en el centro
  imageMode(CENTER);
}

void draw(){
  background(0);
  // mapa, lo ubico al centro del ancho y alto del sketch, lo mismo con la imagen en gran
  image(mapa, width/2, height/2);
  // imágenes thumb
  image(img1,150,600, img1.width/escalaThumb, img1.height/escalaThumb);
  image(img2,400,400, img2.width/escalaThumb, img2.height/escalaThumb);
  image(img3,600,300, img3.width/escalaThumb, img3.height/escalaThumb);
  // imagen grande
  /*
  fill(0, 200);
  rect(0,0,width, height);
  image(img1, width/2, height/2);
  */
}
