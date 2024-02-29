
ArrayList<ParticleSystem> ps;

PImage smoke;

void setup() {
  size(800,800);
  smoke = loadImage("smoke.png");
  ps = new ArrayList<ParticleSystem>();//(new PVector(width/2,height/2));
}

void draw() {
  background(0);
  PVector wind = new PVector(map(mouseX, 0,width, -0.2,0.2), 0);
  for(ParticleSystem sys : ps) {
    sys.run();
    sys.applyForce(new PVector(0,0.1));
    sys.applyForce(wind);
  }
}

void mouseClicked() {
  ps.add(new ParticleSystem(new PVector(mouseX,mouseY), smoke));
}
