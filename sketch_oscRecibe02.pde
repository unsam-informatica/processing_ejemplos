import oscP5.*;
import netP5.*;

OscP5 oscP5;

int puertoEntrada = 11113;
int posX, posY;
int estadoOscilador = 1;

void setup(){
    size(400, 400);
    background(255);
    oscP5 = new OscP5(this, puertoEntrada);
}

void draw(){
    if(estadoOscilador==1){
        background(255, 0, 0);
    }else{
        background(0, 255, 0);
    }
    println(estadoOscilador);
}

void oscEvent(OscMessage mensajeRecibido) {
  if(mensajeRecibido.checkAddrPattern("/oscilador/estado")==true) {
      estadoOscilador=mensajeRecibido.get(0).intValue();
  }
}
