PImage orig;
PImage copy;

void settings() {
  orig = loadImage("SundayInPark.jpg");
  //orig = loadImage("alamo.png");
  //orig = loadImage("balloons.png");
  //orig = loadImage("city.png");
  //orig = loadImage("MTower.jpg");
  //orig = loadImage("orion.png");
  //orig = loadImage("PearlEarring.jpg");
  //orig = loadImage("riverwalk.png");
  //gimg = loadImage("green_bike.jpg");
  //gimg = loadImage("green_dude.jpg");
  //orig = loadImage("robotBoy_run.jpg");
  size(orig.width,orig.height);
}

void setup() {
  
}

float bound(float num) {
  if(num < 0) return 0;
  else if(num > 255) return 255;
  else return num;
}

void draw() {
  background(0);
  
  if(keyPressed) {
    image(copy, 0,0);
  } else {
    image(orig,0,0);
  }
}
