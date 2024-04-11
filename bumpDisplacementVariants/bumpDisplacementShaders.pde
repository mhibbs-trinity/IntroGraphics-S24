
PShader bumpy;
PImage colTex;
PImage htTex;
PImage normTex;
float rot;

TextureSphere ts;

PImage perlinTex;

float off = 0.2f;


int mode = 1; //Set to 1 for displacement mapping; to 0 for bump mapping

void setup() {
  size(600,600, P3D);
  noStroke();
  colTex = loadImage("pebble_color.png");
  //colTex = loadImage("gray.png");
  htTex = loadImage("pebble_height.png");
  normTex = loadImage("pebble_normal.png");

  if(mode == 0) {
    bumpy = loadShader("bumpfrag.glsl", "bumpvert.glsl");
    bumpy.set("normmap", normTex);
  }
  else if(mode == 1) { 
    bumpy = loadShader("dispfrag.glsl", "dispvert.glsl");
    bumpy.set("htmap", htTex);
    bumpy.set("normmap", normTex);
  }
  
  perlinTex = createImage(600,600,ARGB);
  perlinTex.loadPixels();
  for(int x=0; x<perlinTex.width; x++) {
    for(int y=0; y<perlinTex.height; y++) {
      perlinTex.pixels[y*perlinTex.width + x] = color(256 * noise(x/50f,y/50f));
    }
  }
  perlinTex.updatePixels();
  
  ts = new TextureSphere(100, 50, colTex);
  bumpy.set("htmap", perlinTex);
  
}

void draw() {
  background(0); 
  pointLight(255,255,255, mouseX,mouseY,300);
  stroke(255);
  strokeWeight(5);
  point(mouseX,mouseY,300);
  strokeWeight(1);
  
  translate(width/2,height/2);
  rotateY(rot);
  //translate(-width/2,-height/2);
  
  noStroke();
  fill(255);
  shader(bumpy);
  
  if(mode == 1) {
    bumpy.set("scale", float(mouseY)/height * 100.0);
    ts.display();
  }
  else if(mode == 0) {
    ts.display();
  }
  
  //resetMatrix();
  //resetShader();
  image(perlinTex, 0,0);
  
  perlinTex.loadPixels();
  for(int x=0; x<perlinTex.width; x++) {
    for(int y=0; y<perlinTex.height; y++) {
      perlinTex.pixels[y*perlinTex.width + x] = color(256 * noise(off + x/50f,off + y/50f));
    }
  }
  perlinTex.updatePixels();
  off += 0.007;
  
}

void mouseDragged() {
  float diff = mouseX - pmouseX;
  rot += diff/width;
}
