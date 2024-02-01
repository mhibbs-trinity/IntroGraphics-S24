
boolean b = false;
RunSquare sq;
DragCircle circ;
DragCircle c2;

void setup() {
  size(400,400);
  sq = new RunSquare(200,200);
  circ = new DragCircle(200,200, 100);
  c2 = new DragCircle(300,300, 50);
  c2.hover = color(0,200,0);
  c2.regular = color(0,100,0);
}

void draw() {
  if(b) background(255);
  else background(0);
  
  //sq.display();
  circ.display();
  c2.display();
}

void mousePressed() {
  //b = !b;
  sq.moveTo(mouseX, mouseY);
}
