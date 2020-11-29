import oscP5.*;
import netP5.*;

OscP5 oscP5;

int puertoEntrada = 11113;
int posX, posY;

void setup(){
    size(400, 400);
    background(255);
    oscP5 = new OscP5(this, puertoEntrada);
}

void draw(){
    background(255);
    noStroke();
    fill(255, 0, 0);
    ellipse(posX, posY, 50, 50);
}

void oscEvent(OscMessage mensajeRecibido) {
  posX=mensajeRecibido.get(0).intValue();
  posY=mensajeRecibido.get(1).intValue();
}
