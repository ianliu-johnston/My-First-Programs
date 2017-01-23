//Keyboard functions
void keyPressed() {
  if (keyPressed) {
    //Space bar displays only camera feed
    if (key == 32) { 
      vidEFX = 0;
      camEFX = 0;
      colorBurst3IO = 1;
      edgeToggle = 2;
      deformToggle = 2;
    }
    //keys that make different types of glitches
    //applies randomized bitshifting to colorBurst Movie.
    else if (key == 'a') vidEFX = 1;
    else if (key == 's') vidEFX = 2;
    else if (key == 'd') vidEFX = 3;
    else if (key == 'f') vidEFX = 4;
    else if (key == 'g') vidEFX = 5;
    //applies fixed bitshifting to camera feed. 
    else if (key == 'q') camEFX = 2;
    else if (key == 'w') camEFX = 10;
    else if (key == 'e') camEFX = 19;
    else if (key == 'r') camEFX = 3;
    else if (key == 't') camEFX = 11;
    else if (key == 'y') camEFX = 20;
    else if (key == 'u') camEFX = 4;
    else if (key == 'i') camEFX = 12;
    else if (key == 'o') camEFX = 21;
    else if (key == 'p') camEFX = 8; //green channel only
    else if (key == '[') camEFX = 16; //red channel only
    else if (key == ']') camEFX = 23; //bitshifted almost to the very end of visibility

    //on-off functions
    else if (key == '1') { 
      vidToggle++;
      if (vidToggle %2 ==0) vidEFX = 1;  //Movie ON/reset
      else vidEFX = 0;
    }
    else if (key == '2') colorBurst3IO++;  //rainbow overlay ON/OFF
    else if (key == '3') {
      camToggle++;
      if (camToggle %2 == 0) {
        camEFX = 0; //camera ON
      }
      else camEFX = 31; //camera OFF
    }
    else if (key == '4') edgeToggle++; //turn on edgeDetect shader
    else if (key == '5') deformToggle++; //turn on deform shader
  }
}
