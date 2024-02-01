class RunSquare {
  float x,y;
  float destX, destY;
  float origX, origY;
  boolean moving = false;
  float fracMove = 0;
  
  RunSquare(float _x, float _y) {
    x = _x; y = _y;
  }
  
  void moveTo(float dx, float dy) {
    origX=x; origY=y;
    destX=dx; destY=dy;
    moving = true;
  }
  
  void display() {
    if(moving) {
      /* Fractional move
      float amtX = (destX - x) / 20;
      float amtY = (destY - y) / 20;
      x += amtX;
      y += amtY;
      if(dist(x,y, destX,destY) < 0.001) {
        moving = false;
      }
      */
      //Constant move
      x = lerp(origX, destX, fracMove);
      y = lerp(origY, destY, fracMove);
      fracMove += 0.05;
      if(fracMove >= 1.0) {
        moving = false;
        fracMove = 0;
      }
      
      
    }
    rectMode(CENTER);
    fill(128);
    rect(x,y,100,100);
  }
}
