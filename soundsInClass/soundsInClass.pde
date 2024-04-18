import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioPlayer clip;

void setup() {
  size(800,300);
  minim = new Minim(this);
  
  //String filename = "lastofus.mp3";
  String filename = "Dora.mp3";
  
  clip = minim.loadFile(filename);
  clip.play();
}

void draw() {
  background(0);
  
  stroke(255);
  
  float bufSz = clip.bufferSize();
  println(bufSz);
  for(int i=0; i<bufSz-1; i++) {
    float samp = clip.mix.get(i);
    float nsamp = clip.mix.get(i+1);
    line(map(i, 0,bufSz, 0,width),
         map(samp, -1,1, 0,height),
         map(i+1, 0,bufSz, 0,width),
         map(nsamp, -1,1, 0,height));
  }

}
