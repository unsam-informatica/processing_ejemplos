// declaración de variables globales (pueden ser usadas en el setup, draw, mousePressed, etc.
float centroX;
float centroY;
int espaciado = 20;
float x;
float y;
float easing = 0.05;
int lineaY;
boolean fondo = true;

// setup: se ejecuta al comienzo de la ejecución y solo una vez
void setup(){
  
  size(800,800);
  centroX=width*0.5;
  centroY=height*0.5;  
  
}

// draw: se ejecuta constantemente, desde la primera linea a la última y comienza nuevamente (por defecto 60 cuadros por segundo)
void draw(){
  
  if(fondo){
    background(255);
  }
  
  // grilla de puntos
  for(int i=0; i <= width ; i+=espaciado){
    for(int a=0; a <= height ; a+=espaciado){
      point(i,a);
    }
  }
  
  // linea horizontal en movimiento
  line(0, lineaY, width, lineaY);
  lineaY+=1;
  if (lineaY > height) {
    lineaY = 0; 
  }
  
  // variables locales dentro de draw, tienen que ser actualizadas constantemente
  float ladoRect = mouseY*0.5;
  float c = map(mouseX, 0, width, 0, 175); // dato entrada, rango mínimo, rango máximo, nuevo rango mínimo, nuevo rango máximo
  fill(200, c, 0);
  
  // rect, elipse y linea
  rectMode(CENTER);
  rect(centroX, centroY, ladoRect, ladoRect);
  ellipse(mouseX, mouseY, 40, 40);
  line(centroX, centroY, mouseX, mouseY);
  
  // elipse que sigue al mouse
  float dx = mouseX - x;
  x += dx * easing;
  float dy = mouseY - y;
  y += dy * easing;
  ellipse(x, y, 20, 20);
}

// mousePressed: se ejecuta únicamente ante el click del usuario
void mousePressed(){
  
  strokeWeight(random(1,5)); // devuelve un valor aleatorio entre el primero (mínimo) y segundo (máximo)
  stroke(random(0,150));
  
}

// keyPressed: se ejecuta únicamente ante la presión de una tecla
void keyPressed(){
  
  if(key==ENTER){ // cuando se apreta una tecla chequea si esa letra es ENTER y ejecuta el código entre corchetes
    fondo=false;
  }else{ // en caso contrario ejecuta el siguiente código
    fondo=true;
  }
  
}
