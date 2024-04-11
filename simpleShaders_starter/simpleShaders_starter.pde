PShader shade;

/* Set the mode variable to choose the shader used:
     0 = COLOR shader
     1 = LIGHT per-vertex Lambertian diffuse shader
     2 = LIGHT per-pixel Lambertian diffuse shader
     3 = LIGHT per-pixel Phong spcular shader
     4 = LIGHT per-pixel diffuse toon shader
     5 = LIGHT per-pixel specular toon shader */
int mode = 0;

void setup() {
  size(500,500,P3D);
  noStroke();
  fill(255);
  
  if(mode == 0) {
    shade = loadShader("colorfrag.glsl", "colorvert.glsl");
  } else if(mode == 1) {
    shade = loadShader("lightfrag.glsl", "lightvert.glsl");
  } else if(mode == 2) {
    shade = loadShader("pixlitfrag.glsl", "pixlitvert.glsl");
  } else if(mode == 3) {
    shade = loadShader("pixphongfrag.glsl", "pixphongvert.glsl");
  } else if(mode == 4) {
    shade = loadShader("toonfrag.glsl", "toonvert.glsl");
    shade.set("fraction",1.0);
  } else if(mode == 5) {
    shade = loadShader("toonspecfrag.glsl", "toonspecvert.glsl");
    shade.set("fraction",1.0);
  }
}

void draw() {
  shader(shade);
  background(0);
  
  //if(mode != 0) {
    pointLight(255,255,255, mouseX,mouseY,400);
  //}
  
  translate(width/2, height/2);
  sphereDetail(8);
  fill(100,150,25);
  sphere(200);
}
