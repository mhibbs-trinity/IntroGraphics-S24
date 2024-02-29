class Particle {
  PVector pos, vel, acc;
  color c;
  float r;
  float lifespan;
  PImage texture;
  
  Particle(PVector p, PImage img) {
    texture = img;
    pos = p;
    vel = new PVector(random(-2,2), random(-2,2));
    acc = new PVector(0,0);
    c = color(128,128,128);
    r = 5;
    lifespan = 255;
  }
  
  void applyForce(PVector force) {
    acc.add(force); 
  }
  
  void display() {
    noStroke();
    fill(red(c),green(c),blue(c), lifespan);
    //ellipse(pos.x,pos.y, r*2,r*2);
    tint(color(255,255,255, map(lifespan, 0,255, 0,50)));
    image(texture, pos.x,pos.y);
  } 
  void update() {
    vel.add(acc);
    acc.mult(0);
    pos.add(vel);
    lifespan -= 1;
  }
}
