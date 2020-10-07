// importar librerías para extender las capacidades de processing
import processing.sound.*;
import processing.video.*;

//variables globales 
float centroX, centroY;

// imagen fija
PImage imgCiudad, imgVisor, imgEsqueleto, logo; 
boolean mostrarLogo = false;

// sonido
SoundFile apertura;

// imagen en movimiento
Movie caida;

//--------------------------------------------------------------------

void setup() {
  
  size(800, 800);
  centroX=width*0.5;
  centroY=height*0.5;
  
  // imagen fija
  imgCiudad = loadImage("gs_ciudad.jpg");
  imgVisor = loadImage("gs_visor.jpg");
  imgVisor.filter(BLUR, 10);
  imgEsqueleto = loadImage("gs_esqueleto.jpg");
  logo = loadImage("gs_logo.png");
  
  // sonido
  apertura = new SoundFile(this, "gs_apertura.mp3");
  apertura.amp(0.5);
  apertura.loop();
  
  // imagen en movimiento
  caida = new Movie(this, "gs_caida.mp4");
  caida.loop();
  
}

//--------------------------------------------------------------------

/* función que permite la lectura de los frames de un video
para ser interpretados como una secuencia de imágenes fijas
(lo que realmente es)*/
void movieEvent(Movie caida) {
  caida.read();
}

//------------------------------------------------------------------

void draw() {
  
  background(0);
  
  image(imgCiudad, 0, 0, imgCiudad.width, imgCiudad.height);
  
  if(mostrarLogo==true){
    float factorEscala=0.5;
    float logoAncho=logo.width*factorEscala;
    float logoAlto=logo.height*factorEscala;
    image(logo, centroX-logoAncho*0.5, (centroY*0.5)-logoAlto*0.5, logoAncho, logoAlto);
  }
  
  // imagen en movimiento
  image(caida, 0, centroY);
  
  image(imgVisor, centroX, centroY, width*.5, height*.25);
  
  float ladoVentana=200;
  float altoVentana=ladoVentana/2;
  for(int i=0; i<width;i+=ladoVentana){
    for(int a=0; a<width;a+=altoVentana){
      image(imgEsqueleto, i, centroY+centroY*0.5+a, ladoVentana, altoVentana);
    }
  }
  
}

//--------------------------------------------------------------------

void keyPressed(){
  
  if(key==ENTER){
    mostrarLogo=true;
  }else{
    mostrarLogo=false;
  }
  
}
