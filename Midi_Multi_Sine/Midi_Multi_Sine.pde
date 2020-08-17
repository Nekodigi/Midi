import ddf.minim.*;
import ddf.minim.ugens.*;
import ddf.minim.signals.*;
import javax.sound.midi.*;

boolean[] keys = new boolean[128];
SineWave [] sines = new SineWave [128];//SineWave, SquareWave, TriangleWave, SawWave, PulseWave 
Player player;
int x = 0;
Minim minim;
AudioOutput out;

void setup() {
  minim = new Minim(this);
  out = minim.getLineOut(Minim.MONO);
  for(int i=0; i<128; i++){
    sines[i] = new SineWave (13.75*pow(pow(2, 1./12), i), 0.2, out.sampleRate());
    sines[i].setAmp(0);
    sines[i].portamento(1);
    out.addSignal(sines[i]);
  }
  //new Oscil(13.75*pow(pow(2, 1./12), i), 0.2, out.sampleRate(), Waves.SINE);
  size(1000, 500);
  player = new Player("Symphony25_1.mid");
  player.start();
  
}
void draw() {
  background(255);
  for (int i = 30; i < 100; i++) {
    if (keys[i]) {
      fill(0);
    } else {
      fill(255);
    }
    rect((i-30)*15, height-100, 15, 100);
  }
  rect(x, height/2, 10, 10);
}

void noteTrigger(int i, int channel, boolean state) {
  if(state){ 
    sines[i].setAmp(0.5);//when set 1 it cause noise
  }else sines[i].setAmp(0);
  x = (i-30)*15;
  keys[i] = state;
}
