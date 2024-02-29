import java.util.Map;

class CollisionSystem {
  ArrayList<Particle> parts;
  
  public CollisionSystem(int num, float rad) {
    parts = new ArrayList<Particle>();
    while(parts.size() < num) {
      Particle p = new Particle(new PVector(random(rad*2,width-rad*2),random(rad*2,height-rad*2)), rad);
      boolean isect = false;
      for(Particle other : parts) {
        if(p.intersect(other)) {
          isect = true;
          break;
        }
      }
      if(!isect) {
        parts.add(p);
      }
    }
  }
  
  public CollisionSystem(int num) {
    this(num,5);
  }
  
  public void run() {
    for(Particle p : parts) {
      p.run();
    }
  }
  
  /*
  public void runWithIntersections() {
  }
  public void runWithWallIntersections(ArrayList<FixedWall> walls) {
  }
  public void runShowingParticleCollisions() {
  }
  public void runShowingWallCollisions(ArrayList<FixedWall> walls) {
  }
  public void runWithWallCollisions(ArrayList<FixedWall> walls) {
  }
  public void runWithParticleCollisions() {
  }
  public void runWithParticleAndWallCollisions(ArrayList<FixedWall> walls) {
  }
  */
  
  
}
