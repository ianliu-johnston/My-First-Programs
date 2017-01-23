import promidi.*;

Sequencer sequencer; //for promidi library

//declare class instances
Pieces chess; //main class object
Rules rule;

//declare sound class instances
Sound sdfx;
MidiIO midiIO;
MidiOut midi1, midi2, midi3, midi4, midi5, midi6;
Note note;

int x; //declare mouseX choosing variable
int y; //declare mouseY choosing variable
int count = 0; //start mouse click counter at 0
int pieceNum = 32; //declare global variable for choosing pieces
int lastTurn=1; //declare and initialize turn numbers. 
int lastPiece;
float graveyardCounter = 1;
float graveyardCountX = 0;

void setup() {


  size(1000, 800);
  chess = new Pieces(); //initialize main class instance.
  rule = new Rules(); //initialize rules instance.

  sdfx = new Sound(); //initialize sound efx instance.
  sdfx.initialize(); 
  note = new Note(48, 90, 60000);
  midi6.sendNote(note);
  noStroke(); //disable stroke for piece clarity
  cursor(HAND); //change the cursor to a hand
  scale(.95); //change the scale of the chess board
  translate(21, 21); //change the location of the chess board
  //the scale and translate are done to have a yellow border.
  chess.position();
} //end setup.

void draw() {
  scale(.95); //change the scale of the chess board
  translate(21, 21); //change the location of the chess board
} //end draw loop.


/*********BUGZZZZZZZ***************\ 
 *pieces with a number lower can capture and send pieces of a higher number
 to the graveyard, but pieces with a higher number can not capture and send
 lower numbered pieces to the graveyard.
 
 *bishops can move more than in a diagonal.
 
 *queen can move anywhere.
 
 *Pieces cannot be blocked by other pieces
 
 **********COMPONENTS TO INSTALL************
 
 *Sound assignments to individual pieces.
 
 *adaptive sound to piece position: sequencer
 
 \*********END**********************/
