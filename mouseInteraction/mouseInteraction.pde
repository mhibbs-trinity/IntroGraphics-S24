
void setup() {
  size(600,600);
  background(0);
}

void draw() {
  
  fill(255);
  rectMode(CORNERS);
  
  stroke(255,100);
  if(mousePressed) {
    if(mouseButton == RIGHT) {
      background(0);
    } else {
      float d = dist(pmouseX,pmouseY, mouseX,mouseY);
      strokeWeight(d);
      line(pmouseX,pmouseY, mouseX,mouseY);
    }  
  }
}
