size(800,800);
strokeWeight(5);

// declaración de variables
float centroX=width*0.5; // canvas de 800, centro del canvas/lienzo en 400
float centroY=height*0.5; // canvas de 800, centro del canvas/lienzo en 400
float margenInf=100;

// punto y linea sobre plano
/*
stroke(255,0,0);
point(centroX,(height*0.25));
point(centroX,(height*0.75));
stroke(0,255,0);
line(0,height,width,0);
stroke(0,0,255);
line(0,height-margenInf,width,height-margenInf);
*/

// elipses
/*
// elipse roja
fill(255,0,0,127);
ellipseMode(CENTER); // x, y se ubican en el centro de la elipse
ellipse(centroX,centroY,50,50); // x, y, ancho, alto
// elipse verde
fill(0,255,0,127);
ellipseMode(CORNER); // x, y se ubican en la esquina superior izquierda
ellipse(centroX,centroY,50,50); // x, y, ancho, alto
// elipse azul
fill(0,0,255,127);
ellipseMode(CORNERS); // x1, y1 se ubican en la esquina inferior derecha / x2, y2 en la esquina superior izquierda 
ellipse(centroX,centroY,50,50); // x1, y1, x2, y2
*/

// rectángulos
/*
// rectángulo rojo
fill(255,0,0,127);
rectMode(CORNER); // x, y se ubican en la esquina superior izquierda del rectángulo
rect(centroX,centroY,100,100);
// rectángulo verde
fill(0,255,0,127);
rectMode(CENTER); // x, y se ubican en el centro del rectángulo
rect(centroX,centroY,100,100);
// rectángulo azul
fill(0,0,255,127);
rectMode(CORNERS); // x1, y1 se ubican en la esquina inferior derecha / x2, y2 en la esquina superior izquierda
rect(centroX,centroY,100,100);
*/
