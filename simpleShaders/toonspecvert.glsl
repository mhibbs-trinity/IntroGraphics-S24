#define PROCESSING_LIGHT_SHADER

uniform mat4 modelview;
uniform mat4 transform;
uniform mat3 normalMatrix;
uniform vec3 cameraPosition;

uniform vec4 lightPosition;

attribute vec4 vertex;
attribute vec4 color;
attribute vec3 normal;

varying vec4 vertColor;
varying vec3 lightDir;
varying vec3 hVector;
varying vec3 ecNormal;

void main() {
  gl_Position = transform * vertex;    
  vec3 ecVertex = vec3(modelview * vertex);   
  ecNormal = normalize(normalMatrix * normal);
  vec3 toEye = normalize(cameraPosition - ecVertex);
  
  lightDir = normalize(lightPosition.xyz - ecVertex);
  hVector = normalize(lightDir + toEye); 
  vertColor = color;
}