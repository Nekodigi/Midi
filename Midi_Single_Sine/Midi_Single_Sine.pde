import ddf.minim.*;
import ddf.minim.signals.*;
import javax.sound.midi.*;

boolean[] keys = new boolean[128];
Player player;
int x = 0;
SineWave sine;
Minim minim;
AudioOutput out;

void setup() {
  minim = new Minim(this);
  out = minim.getLineOut(Minim.MONO);
  sine = new SineWave(440*pow(pow(2, 1./12), 1), 0.2, out.sampleRate());
  out.addSignal(sine);
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
    sine.setAmp(100);
    sine.setFreq(13.75*pow(pow(2, 1./12), i));
  }else sine.setAmp(0);
  x = (i-30)*15;
  keys[i] = state;
}
