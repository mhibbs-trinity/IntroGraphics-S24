
class DragCircle {
  float x,y,d;
  float offX,offY;
  color regular = color(128);
  color hover = color(200);
  boolean hovering = false;
  boolean firstPress = false;
  boolean isPressed = false;
  boolean isDragged = false;
  
  DragCircle(float _x, float _y, float _d) {
    x=_x; y=_y; d=_d;
  }
  
  void display() {
    if(!mousePressed) {
      firstPress = false;
      isPressed = false;
      isDragged = false;
    } else {
      if(isPressed) {
        firstPress = false;
      } else {
        firstPress = true;
        isPressed = true;
      }
    }
    
    float far = dist(mouseX,mouseY, x,y);
    if(far < d/2) {
      hovering = true;
    } else {      
      hovering = false;
    }
    
    if(hovering && firstPress) {
      isDragged = true;
      offX = x-mouseX;
      offY = y-mouseY;
    }
    
    if(isDragged) {
      x = mouseX+offX;
      y = mouseY+offY;
    }
    
    if(hovering) {
      fill(hover);
    } else {
      fill(regular);
    }
   
    ellipse(x,y,d,d);
  }
}
