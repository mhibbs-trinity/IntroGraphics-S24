
void setup() {
  size(600,600);
  background(255);
  //pushMatrix();
  frameRate(60000);
}

void draw() {
  resetMatrix();
  //popMatrix();
  background(255);
  stroke(200,60,30);
  strokeWeight(10);
  
  pushMatrix();
  translate(300,0);
  rotate(map(mouseX, 0,width, 0,2*PI));
  rect(0,0, 300,200);
  popMatrix();
  
  stroke(50,200,80);
  pushMatrix();
  rotate(map(mouseX, 0,width, 0,2*PI));
  translate(300,0);
  rect(0,0, 300,200);
  popMatrix();
}


/*
void draw() {
  fill(0);
   translate(50,50);
   for(float x=50; x<width; x+=100) {
     pushMatrix();
     for(float y=50; y<height; y+=100) {
       //applyMatrix(1, 0, x,
       //            0, 1, y);
       ellipse(0,0, 100,100);
       translate(100,0);
       printMatrix();
     }
     popMatrix();
     translate(0,100);
   }
}*/
