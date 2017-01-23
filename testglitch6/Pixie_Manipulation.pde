class VideoDistort {
  int thingy = 0;
  //Constructor
  VideoDistort(int t) {
    thingy = t;
  }

  //***Main function***//
  void loadPixies() {
    thingy = 0;
    //checks to see if there is a camera to read
    if (cam.available() == true) {
      cam.read();
      //load empty pixel array from PImage
      pixieTrap.loadPixels();
      //load movie pixel array from Movie
      colorBurst.loadPixels();
      //load camera feed from Capture
      cam.loadPixels();
      //Choose all the pixels in camera stream
      for (int i = 0; i<cam.pixels.length; i++) {
        //cam and movie pixel array are combined into a single pixel array.
        //Pixel data is combined, resulting in posterization of 
        //both images simultaneously.
        //Finally, the operator on the right side is bit shifted by *******,
        //resulting in more dramatic distortion and posteriation.
        cam.pixels[i] = cam.pixels[i] << camEFX;
        cam.pixels[i] += colorBurst.pixels[i] << efx[vidEFX];
        //traps the combined pixel array into the PImage.
        pixieTrap.pixels[i] = cam.pixels[i];
      }
      //load combined pixel arrays into PImage object.
      pixieTrap.updatePixels();
      //Display PImage object
    }
  }
  //***End Main Function***//

  //Turn on ColorBurst3
  void colorBurst3() {
    if (colorBurst3IO % 2 == 0) {
      //Blend together PImage object and Movie2 inside of PImage Object pixel array
      pixieTrap.blend(colorBurst3, 0, 0, width, height, 0, 0, width, height, EXCLUSION);
      //display PImage object
      image(pixieTrap, 0, 0);
    }
    //otherwise just display the combined pixel streams from the Camera stream
    //and Movie1.
    else {
      image(pixieTrap, 0, 0);
    }
  }
  
  //Turn on Shader
  void edgeBool() {
    //Turns on and off the shader.
    if (edgeToggle % 2 != 0) {
      image(pixieTrap, 0, 0);
      filter(edgeDetect);
    }
    else image(pixieTrap, 0, 0);
  }

  void deformIO() {
    if (deformToggle % 2 != 0) {
      image(pixieTrap, 0, 0);
      filter(deform);
    }
    else {
    }
  }

  void dispData() {
    String camIO;
    String glix1;
    String colBur;
    String edge;
    String def;
    if (camEFX == 31) camIO = "OFF";
    else camIO = "ON";
    if (vidEFX == 0) glix1 = "OFF";
    else glix1 = "ON";
    if (colorBurst3IO % 2 == 0) colBur = "ON";
    else colBur = "OFF";
    if (edgeToggle %2 != 0) edge = "ON";
    else edge = "OFF";
    if ( deformToggle %2 != 0) def = "ON";
    else def = "OFF";
    String info = "Camera: " + camIO + "-Bits Offset: " + camEFX + 
      " || Video1: " + glix1 + "-Bits Offset: " + efx[vidEFX] + 
      " || Video2: " + colBur + 
      " || Edge Detect: " + edge +
      " || Deform: " + def;
    //Display sketch data in top of window frame
    frame.setTitle(info);
    text("Last Key Pressed: " + key, 75, height-35);
    text(info, width/2, height-15);
  }
}

