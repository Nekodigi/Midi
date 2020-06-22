class myListener implements Receiver {
  void send(MidiMessage message, long timeStamp) {
    // System.out.println(message.getStatus());
    if (message instanceof ShortMessage) {
      ShortMessage sm = (ShortMessage) message;
      int channel = sm.getChannel();
      int command = sm.getCommand();

      if (command == ShortMessage.NOTE_ON) {
        // String[] NOTE_NAMES = {"C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B"};
        // int note = sm.getData1() % 12;
        // String name = NOTE_NAMES[note];


        int rawKey = sm.getData1();

        Boolean State = true;

        if (sm.getData2() == 0)
            State = false;
        else
            State = true;

        noteTrigger(rawKey, channel, State);
      } else if (command == ShortMessage.NOTE_OFF) {
        int rawKey = sm.getData1();

        noteTrigger(rawKey, channel, false);
      }
    }
  }

  public void close() {
    System.out.println("O");
  }
}
