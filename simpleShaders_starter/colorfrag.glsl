#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

#define PROCESSING_LIGHT_SHADER

varying vec4 vertColor;
varying vec3 camNormal;
varying vec3 lightDir;

void main() {
  float intense = max(0.0, dot(camNormal, lightDir));
  gl_FragColor = vec4(vec3(intense), 1.0) * vertColor;
}