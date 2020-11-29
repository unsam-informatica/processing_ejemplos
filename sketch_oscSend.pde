import oscP5.*; 
import netP5.*;

OscP5 oscP5;
NetAddress direccionRemota;

int puertoEntrada = 11112;
int puertoSalida = 11113;
String ip = "127.0.0.1";

void setup(){
    size(400, 400);
    background(0);
    oscP5 = new OscP5(this, puertoEntrada);
    direccionRemota = new NetAddress(ip, puertoSalida);
}

void draw(){
    OscMessage mensaje1 = new OscMessage("/mouse/posicion");
    mensaje1.add(mouseX);
    mensaje1.add(mouseY); 
    oscP5.send(mensaje1, direccionRemota); 
}
