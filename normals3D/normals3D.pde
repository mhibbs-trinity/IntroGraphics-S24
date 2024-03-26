
void setup() {
  size(600,600, P3D);
}

void draw() {
  background(0);
  translate(width/2,height/2,0);
  
  pointLight(255,255,255, map(mouseX,0,width,-width/2,width/2),
                          map(mouseY,0,height,-height/2, height/2),1000);
  
  PVector n = new PVector(map(mouseX, 0,width, 1,100),
                          0, map(mouseY, 0,height, 1,100));
                          
  PVector a = new PVector(0,0,0);
  PVector b = new PVector(-200,-200,-100);
  PVector c = new PVector( 200,-200,-100);
  PVector d = new PVector( 200, 200,-100);
  PVector e = new PVector(-200, 200,-100);
  
  beginShape(TRIANGLES);
  
  PVector norm = PVector.sub(b,a);
  norm = norm.cross(PVector.sub(c,a));
  norm.normalize();
  normal(norm.x, norm.y, norm.z);
  
  doVertex(a);
  doVertex(b);
  doVertex(c);
  
  doVertex(a);
  doVertex(c);
  doVertex(d);
  
  doVertex(a);
  doVertex(d);
  doVertex(e);
  
  doVertex(a);
  doVertex(e);
  doVertex(b);
  endShape();
                          
                          
                
  /*
  n.normalize();
  fill(255,0,0);
  beginShape();
  normal(n.x,n.y,n.z);
  vertex(-200,-200);
  vertex( 200,-200);
  vertex( 200, 200);
  vertex(-200, 200);
  endShape();
  */
  
}

void doVertex(PVector v) {
  vertex(v.x,v.y,v.z);
}
