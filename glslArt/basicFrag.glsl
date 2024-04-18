#define PROCESSING_TEXTURE_SHADER
varying vec4 vertTexCoord;
void main() {
  //Change coordinates into clip space [-1,1]
  vec2 clip = vertTexCoord.xy * 2.0 - 1.0;
  float d = length(clip);
  gl_FragColor = vec4(d,d,d, 1.0);
}


