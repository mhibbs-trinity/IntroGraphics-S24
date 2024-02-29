class ParticleSystem {
  ArrayList<Particle> parts;
  PVector origin;
  PImage img;
  
  ParticleSystem(PVector orig, PImage i) {
    img = i;
    origin = orig;
    parts = new ArrayList<Particle>();
  }
  
  void applyForce(PVector force) {
    for(Particle p : parts) {
      p.applyForce(force);
    }
  }
  
  void addParticle() {
    parts.add(0, new Particle(origin.copy(), img));
  }
  
  void run() {
    addParticle();
    for(int i=0; i<parts.size(); i++) {
      parts.get(i).display();
      parts.get(i).update();
      if(parts.get(i).lifespan < 0) {
        parts.remove(i);
        i--;
      }
    }
  }
  
}
