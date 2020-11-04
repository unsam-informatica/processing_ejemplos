PImage photo;
PGraphics maskImage;
void setup() {
  size(512, 512);
  photo = loadImage("nada.jpg");
}
void draw() {
  maskImage = createGraphics(512,512);
  maskImage.beginDraw();
  maskImage.rect(mouseX,mouseY,600,20);
  maskImage.endDraw();
  photo.mask(maskImage);
  image(photo, 0, 0);
}
