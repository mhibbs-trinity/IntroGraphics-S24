PImage orig;
PImage gimg;
PImage copy;

void settings() {
  //orig = loadImage("SundayInPark.jpg");
  //orig = loadImage("alamo.png");
  orig = loadImage("balloons.png");
  //orig = loadImage("city.png");
  //orig = loadImage("MTower.jpg");
  //orig = loadImage("orion.png");
  //orig = loadImage("PearlEarring.jpg");
  //orig = loadImage("riverwalk.png");
  //gimg = loadImage("green_bike.jpg");
  gimg = loadImage("green_dude.jpg");
  //orig = loadImage("robotBoy_run.jpg");
  size(orig.width,orig.height);
}

void setup() {
  copy = copyImg(orig);
}

void drawGreen(PImage img) {
  img.loadPixels();
  loadPixels();
  for(int x=0; x<img.width; x++) {
    for(int y=0; y<img.height; y++) {
      color c = img.pixels[y*img.width + x];
      if(!(green(c) > 100 && red(c) < 100 && blue(c) < 100)) {   
        pixels[y*width + x] = c;
      }
    }
  }
  updatePixels();
}

void drawBlur(PImage img) {
  img.loadPixels();
  loadPixels();
  for(int x=1; x<img.width-1; x++) {
    for(int y=1; y<img.height-1; y++) {
      color c = img.pixels[y*img.width + x];
      color c1 = img.pixels[(y-1)*img.width + x];
      color c2 = img.pixels[(y+1)*img.width + x];
      color c3 = img.pixels[(y)*img.width + x+1];
      color c4 = img.pixels[(y)*img.width + x-1];
      float r = (red(c)+red(c1)+red(c2)+red(c3)+red(c4)) / 5;
      float g = (green(c)+green(c1)+green(c2)+green(c3)+green(c4)) /5;
      float b = (blue(c)+blue(c1)+blue(c2)+blue(c3)+blue(c4))/5;
      if(abs(brightness(c) - brightness(c1)) > 100) {
        pixels[y*width + x] = color(255);
      } else {
        pixels[y*width + x] = color(0);
      }
      //pixels[y*width + x] = color(r,g,b);
    }
  }
  updatePixels();
}


void spotlight(PImage img) {
  img.loadPixels();
  loadPixels();
  for(int x=0; x<img.width; x++) {
    for(int y=0; y<img.height; y++) {
      float d = dist(mouseX,mouseY, x,y);
      if(d < 200) {
        pixels[y*img.width + x] = 
          lerpColor(img.pixels[y*img.width + x], color(0), map(d, 0,200, 0,1));
      }
    }
  }
  updatePixels();
}

void drawShapes(PImage img) {
  img.loadPixels();
  //for(int x=0; x<img.width; x++) {
    for(int i=0; i<100; i++) {
      int x = (int)random(0,img.width);
      int y = (int)random(0,img.height);
      color c = img.pixels[y*img.width + x];
      stroke(c);
      strokeWeight(5);
      fill(c);
      //noFill();
      line(x,y, x+10,y+10);
    }
  //}
}


PImage copyImg(PImage img) {
  img.loadPixels();
  PImage newImg = createImage(img.width,img.height, ARGB);
  newImg.loadPixels();
  for(int i=0; i<img.pixels.length; i++) {
    color c = img.pixels[i];
    float avg = brightness(c);//(red(c) + green(c) + blue(c)) / 3;
    //newImg.pixels[i] = color(avg);
    newImg.pixels[i] = color(green(c), blue(c), red(c));
  }
  newImg.updatePixels();
  return newImg;
}

PImage grayImg(PImage img) {
  img.loadPixels();
  PImage newImg = createImage(img.width,img.height, ARGB);
  newImg.loadPixels();
  for(int i=0; i<img.pixels.length; i++) {
    color c = img.pixels[i];
    float avg = (red(c) + green(c) + blue(c)) / 3;
    newImg.pixels[i] = color(avg);
  }
  newImg.updatePixels();
  return newImg;
}

float bound(float num) {
  if(num < 0) return 0;
  else if(num > 255) return 255;
  else return num;
}

void draw() {
  background(0);
  
  /*
  if(keyPressed) {
    image(copy, 0,0);
  } else {
    image(orig,0,0);
  }*/
  image(orig,0,0);
  if(keyPressed) {
    drawBlur(orig);
  }
  //drawGreen(gimg);
  //spotlight(orig);
  //drawShapes(orig);
  
}
