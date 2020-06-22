import javax.sound.midi.*;
boolean[] keys = new boolean[128];
Player player;

void setup() {
  size(1000, 500);
  player = new Player("Different Heaven - Nekozilla.mid");
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
}

void noteTrigger(int i, int channel, boolean state) {
  keys[i] = state;
}
