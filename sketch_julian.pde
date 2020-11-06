// instalar la librería minim desde Tool > Add Tools > Libraries antes de ejecutarlo.

import ddf.minim.*;
import ddf.minim.ugens.*;

Minim       minim;
AudioOutput out;
Oscil       wave;

boolean oscilador01 = true;
float amp, freq;

void setup(){
  size(512, 200, P3D);
  minim = new Minim(this);
  out = minim.getLineOut();
  wave = new Oscil( 440, 0.5f, Waves.SINE );
  wave.patch( out );
}

void draw(){
  background(0);
  stroke(255);
  strokeWeight(1);
  for(int i = 0; i < out.bufferSize() - 1; i++)
  {
    line( i, 50  - out.left.get(i)*50,  i+1, 50  - out.left.get(i+1)*50 );
    line( i, 150 - out.right.get(i)*50, i+1, 150 - out.right.get(i+1)*50 );
  }
  stroke( 128, 0, 0 );
  strokeWeight(4);
  for( int i = 0; i < width-1; ++i ){
    point( i, height/2 - (height*0.49) * wave.getWaveform().value( (float)i / width ) );
  }
}

void mouseMoved(){
  amp = map( mouseY, 0, height, 1, 0 );
  wave.setAmplitude( amp );
  freq = map( mouseX, 0, width, 110, 880 );
  wave.setFrequency( freq );
}

void keyPressed(){ 
  switch( key ){
    case '1': 
      if(oscilador01){
        wave.setAmplitude(0);
        wave.setFrequency(0);
      }else{
        wave.setFrequency(freq);
        wave.setAmplitude(amp);
      }
      oscilador01 = !oscilador01;
      break;
     
    case '2':
      wave.setWaveform( Waves.TRIANGLE );
      break;
     
    case '3':
      wave.setWaveform( Waves.SAW );
      break;
     
    default: break; 
  }
}
