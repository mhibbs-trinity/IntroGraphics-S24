#define PROCESSING_COLOR_SHADER

uniform mat4 transform;

attribute vec4 vertex;
attribute vec4 color;

varying vec4 vertColor;

void main() {
  gl_Position = transform * vertex;    
  vertColor = vec4((vertex.x+200)/400,
                   (vertex.y+200)/400,
                   (vertex.z+200)/400, 1.0);
}