class Particle {
  private PVector loc;
  private PVector vel;
  private PVector acc;
  
  public color fillCol = color(0);
  public float r = 5;

  public float mass = 1;

  Particle(PVector l, float rad) {
    this(l);
    r = rad;
  }
  Particle(PVector l) {
    acc = new PVector(0,0);
    vel = new PVector(random(-2,2),random(-2,2));
    loc = l.copy();
  }
  Particle() {
    this(new PVector(0,0));
  }

  void run(float t) {
    update(t);
    display();
  }
  void run() {
    run(1);
  }

  void applyForce(PVector force) {
    PVector f = force.copy();
    f.div(mass);   
    acc.add(f);
  }

  void update() {
    update(1);
  }

  // Method to update location
  void update(float t) {
    //println(PVector.mult(vel,t));
    vel.add(PVector.mult(acc,t));
    loc.add(PVector.mult(vel,t));
    acc.mult(0);
    sideBounce();
  }
  
  void sideBounce() {
    
  }

  // Method to display
  void display() {
    noStroke();
    //fill(fillCol);
    ellipse(loc.x,loc.y,r*2,r*2);
  }

  boolean intersect(Particle other) {
    return false;
  }
  
  boolean intersect(FixedWall wall) {
    return false;
  }
  
  float getCollisionTime(Particle other) {
    return 10000;
  }
  
  float getCollisionTime(FixedWall w) {
     return 10000;
  }
  
  void performCollision(Particle other) {
    
  }

  void performCollision(FixedWall wall) {
    
  }

}
