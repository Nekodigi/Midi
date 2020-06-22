class Player extends Thread{
  String Path;
  Sequencer sequencer;
  
  Player(String path) {
      this.Path =path;
  }
  
  void run(){
    File midiFile = new File(dataPath(Path));
    try {
      sequencer = MidiSystem.getSequencer();
      sequencer.setSequence(MidiSystem.getSequence(midiFile));
      sequencer.open();
      Receiver receiver = new myListener();
      Transmitter transmitter = sequencer.getTransmitter();
      transmitter.setReceiver(receiver);
      sequencer.start();
      while (true) {
          if (sequencer.isRunning()) {
              try {
                  Thread.sleep(1000); // Check every second
              } catch (Exception e) {
                  break;
              }
          } else
              break;
      }
      // Close the MidiDevice & free resources
      sequencer.stop();
      sequencer.close();
    }catch(Exception e) {
      e.printStackTrace();
      exit();
    }
  }
}
