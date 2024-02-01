

void setup() {
  size(600,600);
}

void draw() {
  background(255);
  
  fill(#7835E5);
  stroke(0);
  strokeWeight(5);
  beginShape();
  float rotAmt = map(mouseY, 0,height, 0,2*PI);
  float sides = map(mouseX, 0,width, 3,20);
  for(float theta=rotAmt; theta<2*PI+rotAmt; theta+=2*PI/sides) {
    vertex(width/2 + 250 * cos(theta), 
           height/2 + 250 * sin(theta)); 
  }
  endShape(CLOSE);
}
