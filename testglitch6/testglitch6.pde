///************************************************************//*.
/*============================================================//*.
 A sketch by Ian Xaun Liu-Johnston                           //*.
 Final Project                                              //*.
 For "Hack Your Practice"                                  //*.
 Professor Brad Borevitz                                  //*.
 California College of the Arts                          //*.
 -------------------------------------------------------//*.
 All Original Code except for:                         //*.
 -edgeDetect.glsl Open GL shader,                     //*.
 from Processing Examples:                           //*.
 Topics--> Shaders --> EdgeDetect                   //*.
 --> Data --> edge.glsl                            //*.
 -------------------------------------------------//*.
 *///============================================//*.
//**********************************************//*.

import processing.video.*; //Import default video library
//Declare Classes and their instances
//camera stream
Capture cam;
//movie files stream
Movie colorBurst, colorBurst3;
//Class Declaration
VideoDistort messWithPixies;
//Empty Image Container
PImage pixieTrap, welcomScreen;
//OpenGLSL Shaders
PShader edgeDetect, deform;
//Declare and initialize integer array for different cam/movie distortions
int[] efx = new int[6];
//variables for bitshifting effects
int vidEFX = 5;
int camEFX;
//Switches
int colorBurst3IO = 0;
int vidToggle = 1;
int camToggle = 1;
int edgeToggle = 2;
int deformToggle = 2;
//open the welcome screen first with this variable
int state = 1;

String cameraFeed = "Vega USB 2.0 Camera.";
//**************Begin****************//

void setup()
{
  //declare size, load P3D renderer with OpenGL acceleration
  size(640, 600, P2D);
  background(0, 0, 0);
  //Declare Framerate. 120 will smooth out stream differences between 24p and 30p/60i
  frameRate(30);
  fill(255);
  //Call the list function of the Capture class to display the available cameras
  String[] camList = Capture.list();
  //go through the array one by one
  for (int i = 0; i < camList.length; i++) {
    //print out all the cameras in a numbered list
    println(i + " " + camList[i]);
  }
  //declare objects within Classes
  cam = new Capture(this, 640, 480, cameraFeed, 30);
  //load movie files
  colorBurst = new Movie(this, "glix1.mp4");
  colorBurst3 = new Movie(this, "colorbust3.mp4");
  //set movies to loop
  colorBurst.loop();
  colorBurst3.loop();
  //start camera capture
  cam.start();

  //initialize PImage container to trap pixels inside
  pixieTrap= new PImage(640, 480);
  //initialize welcomScreen PImage container
  welcomScreen = loadImage("welcom.jpg");
  //Shader Initialization
  edgeDetect = loadShader("edgeDetect.glsl");
  deform = loadShader("deform.glsl");
  deform.set("resolution", float(width), float(height));
  //Class initialization
  messWithPixies = new VideoDistort(1);
}

//***************Start Displaying Video Data****************//

void draw()
{
  background(0);
  //press any key to get past the welcome screen
  if (key == 10) state = 2;
else if (key == 9) state = 4;
  // switch statement to get past the welcome screen.
  switch(state) {
  case 1: //welcome screen
    background(welcomScreen);
    textSize(18);
    textAlign(LEFT);
    text("  Directions:", 25, height/2-75);
    text("* Press keys to switch between different glitches.", 25, height/2-50);
    text("* Keys 12345 turn on and off video layers.", 25, height/2-25);
    text("* Keys qwertyuiop[] adds effects to the live camera feed.", 25, height/2);
    text("* Keys asdfg adds effects to video layer 1.", 25, height/2+25);
    text("* The spacebar resets the image to only the video feed.", 25, height/2+50);
    text("* A line of text at the bottom displays what layers are active.", 25, height/2+75);
    text("* Press ENTER to continue.", 25, height/2+100);
    text("* Press any key to continue.", 25, height/2+125);
    break;
    case 2:
    background(welcomScreen);
    textSize(12);
    textAlign(CENTER);
    break;
  case 4: //main video
    //Different types of effects for cam/movie distortion
    //All based on bitshifting within a range
    efx[0] = 31; //clears glitches by shifting over to the alpha channel
    efx[1] = (int)random(1, 4); //bitshifts 1-4 within the blue pixels
    efx[2] = (int)random(4, 6);
    efx[3] = (int)random(8, 12); //bitshifts 8-12 within the green pixels
    efx[4] = (int)random(12, 14);
    efx[5] = (int)random(16, 24); //bitshifts over 16-24, within the red spectrum
    //Parameters for Deform Shader
    deform.set("time", millis() / 1000.0);
    deform.set("mouse", float(mouseX), float(mouseY));
    //loadPixies contains the complied pixel arrays
    messWithPixies.loadPixies();
    messWithPixies.colorBurst3();
    //switch on/off shaders from this function
    messWithPixies.edgeBool();
    messWithPixies.deformIO();
    //Display data on the title bar
    messWithPixies.dispData();
    break;
  }
}
//*********************************End***********************//
//create a movie event to play the movies
void movieEvent(Movie m) {
  if (m== colorBurst) colorBurst.read();
  else if (m == colorBurst3) colorBurst3.read();
}

