#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

#define PROCESSING_COLOR_SHADER

varying vec4 vertColor;

void main() {
  gl_FragColor = vertColor;//vec4(1.0,1.0,1.0, 1.0);
}