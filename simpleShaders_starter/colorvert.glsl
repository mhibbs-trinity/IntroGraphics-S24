#define PROCESSING_LIGHT_SHADER

uniform mat4 transform;
uniform mat4 modelview;
uniform mat3 normalMatrix;

uniform vec4 lightPosition;

attribute vec4 vertex;
attribute vec4 color;
attribute vec3 normal;

varying vec4 vertColor;
varying vec3 camNormal;
varying vec3 lightDir;

void main() {
  gl_Position = transform * vertex;   

  vec3 camVertex = (modelview * vertex).xyz;
  camNormal = normalize(normalMatrix * normal);
  lightDir = normalize(lightPosition.xyz - camVertex);

  vertColor = color; //vec4(vec3(intense), 1.0);
}