// variable que nos permite el cambio, por defecto es falsa ya que al cargar
// vemos la escena01
boolean cambioEscena = false;
int mitadAlto;
int mitadAncho;

void setup() {
  size(500, 500);
  textAlign(CENTER, CENTER);
  rectMode(CENTER);
  mitadAncho=width/2;
  mitadAlto=height/2;
}

void draw() {
  // si cambioEscena es verdadera dibuja todo lo que esté dentro de la función escena02
  // si es falsa muestra escena01
  if(cambioEscena==true){ 
    escena02();
  }else{
    escena01();
  }
}

void keyPressed() {
  // al presionar cualquier tecla cambia el estado de la variable
  // si es verdadera cambia a falsa, si es falsa a verdadera
  cambioEscena = !cambioEscena;
}

// ubicar todo lo que queremos dibujar dentro de cada escena.
void escena01() {
  background(0);
  fill(255);
  text("ESCENA 01", mitadAncho, mitadAlto);
  ellipse(mouseX, mouseY, 50, 50);
}

void escena02() {
  background(255);
  fill(0);
  text("ESCENA 02", mitadAncho, mitadAlto);
  rect(mouseX, mouseY, 50, 50);
}
