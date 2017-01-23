class Sound {
  int octave;

  Sound() {
    octave = 48;
  }

  void initialize() {
    //PROMIDI LIBRARY
    sequencer = new Sequencer();

    midiIO = MidiIO.getInstance();
    midiIO.printDevices();
    midiIO.closeOutput(1);
    midi1 = midiIO.getMidiOut(13,13); //pawns
    midi2 = midiIO.getMidiOut(10, 10); //rooks
    midi3 = midiIO.getMidiOut(11, 11); //knights
    midi4 = midiIO.getMidiOut(12, 12); //bishops
    midi5 = midiIO.getMidiOut(9, 9); //queens
    midi6 = midiIO.getMidiOut(8, 8); //kings


    //    Track track = new Track("one", midiOut);

    //    track.setQuantization(Q._1_8);
    //    track.addEvent(new Note(55, 90, 40), 0);
    //    track.addEvent(new Note(59, 90, 40), 0);
    //    track.addEvent(new Note(60, 90, 60), 0);
    //    track.addEvent(new Note(64, 90, 40), 0);
    //    track.addEvent(new Note(72, 90, 40), 0);
    //    track.addEvent(new Note(73, 90, 40), 1);
    //
    //    Song song = new Song("test", 120);
    //    song.addTrack(track);
    //    sequencer.setSong(song);
    //    sequencer.setLoopStartPoint(0);
    //    sequencer.setLoopEndPoint(512);
    //    sequencer.setLoopCount(-1);
    //PROMIDI LIBRARY
  }

  void triggerSDFX(int soundNo) {
    int m = (int)map(soundNo, 0, 7, octave, octave+12);
    if (pieceNum == 32) octave = 36;
    else if (pieceNum >= 8 && pieceNum <= 15 || pieceNum >= 24 && pieceNum <= 31) {  //pawns
      note = new Note(m, 90, 60000);
      midi1.sendNote(note);
      octave = m;
    }

    else if (pieceNum == 0 || pieceNum == 7 || pieceNum == 16 || pieceNum == 23) { //rooks
      octave = 48;
      note = new Note(m, 90, 45000);
      midi2.sendNote(note);
    }
    else if (pieceNum == 1 || pieceNum == 6 || pieceNum == 17 || pieceNum == 22) { //knights
      octave = 24;
      note = new Note(m, 90, 30000);
      midi3.sendNote(note);
    }

    else if (pieceNum == 2 || pieceNum == 21 || pieceNum == 5 || pieceNum == 18) { //bishops
      octave = 48;
      note = new Note(m, 90, 30000);
      midi4.sendNote(note);
    }
    else if (pieceNum == 3 || pieceNum == 19) { //queens
      octave = 36;
      note = new Note(m, 90, 60000);
      midi5.sendNote(note);
    }
    else if (pieceNum == 4 || pieceNum == 20) { //kings
      note = new Note(m, 90, 60000);
      midi6.sendNote(note);
    }
    //    if (m == 51) m = 52;
    println(m);
  }

  void correlate() {

    if (chess.getData() == "d4") {
    }
  }
}

