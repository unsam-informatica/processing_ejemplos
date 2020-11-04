// si la letra 'a' es presionada y mantenida muestra una linea
// si la letra 's' es presionada y no necesariamente mantenida muestra la imagen
// si ninguna de las dos condiciones se cumple muestra una elipse
// imágenes de referencia para este sketch en el drive, carpeta processing
PImage imgEsqueleto; 

void setup() {
  size(400, 400);
  strokeWeight(4);
  imgEsqueleto = loadImage("gs_esqueleto.jpg");
}

void draw() {
  background(204);
  if ((keyPressed == true) && (key == 'a')) {
    line(50, 25, 50, 75);
  }else if (key == 's') {
    image(imgEsqueleto, 0, 0, 200, 300);
  } else { // Otherwise, draw an ellipse
    ellipse(50, 50, 50, 50);
  }
}
