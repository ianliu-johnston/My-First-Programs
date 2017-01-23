//*****MAIN CLASS******//
//Piece movement, functionality and display.
class Pieces { 
  ChessPieces p; //declare piece appearance instance
  Rules r; //declare rules appearance.
  PVector[] prevPos; //main movement PVector array.
  Pieces() {   //constructor

    prevPos = new PVector[33]; //initialize position array.
    for (int i = 0; i<8; i++) { //for loop to initialize each instance in the array.
      //loads each type of piece with the correct row
      prevPos[i] = new PVector(i, 7); //white major and minor pieces.
      prevPos[i+8] = new PVector(i, 6);
      prevPos[i+16] = new PVector(i, 0); //black major and minor pieces. 
      prevPos[i+24] = new PVector(i, 1);
    }
    prevPos[32] = new PVector(8, 4);
    for (int i = 0; i<32; i++) { //initialize each piece in the piece appearance array.
      p = new ChessPieces();
    }
    r = new Rules(); //initialize rules instance.
  } //end constructor

  //**************functions****************//
  String getData() { //simple function to display movement data.
    int dataX = (int) map(mouseX, 0, 800, 0, 8)+97; //change from mouseX to row numbers.
    char x = (char) dataX; //cast from row numbers to row letter characters.
    int dataY = (int) map(mouseY, 0, 800, 8, 0) + 49; //change from mouseY to column numbers.
    char y = (char)dataY; //cast from column numbers to column number characters.
    String data;
    if (mouseX > 800) data = "GRAVEYARD";  //prevents pieces moving off the board.
    else data = x + "" + y; //combine row and column data into a single string.

    return data; //send the data string out.
  } //end get data string

  void run() { //main function, encapsulating other functions.
    r.run(prevPos[pieceNum]);
    update(x, y); //load the update function, using x and y as parameters.
    if (pieceNum != 32) takePiece();
    position();
  } //end run function.

  void update(int _x, int _y) { 
    //update the piece position with x and y data on second mouse click.
    if (count == 2) { //if the count is 2, 
      if (getData() != "GRAVEYARD") { //conditional to prevent pieces moving off the board
        prevPos[pieceNum].set(_x, _y); //then set the position to the desired position.
      } //end GRAVEYARD conditional
      else lastTurn--; //Resets turn if piece tries to move off the board.
    } //end if
    //    sdfx.triggerSDFX(); //make a sound when the piece is moved.
  } //end update.

  void position() { //function to display the pieces in the correct positions.
    grid(); //draw the grid first, then display the pieces.
    fill(255); //draw white pieces. 
    //Each instance of the appearance class
    //has two parameters, the X and Y position 
    //in specific locations in the position array, prevPos[].
    //also does math to snap the pieces to the center of each square.
    p.rook(prevPos[0].x*100+50, prevPos[0].y*100+50);
    p.knight(prevPos[1].x*100+50, prevPos[1].y*100+50);
    p.bishop(prevPos[2].x*100+50, prevPos[2].y*100+50);
    p.queen(prevPos[3].x*100+50, prevPos[3].y*100+50);
    p.king(prevPos[4].x*100+50, prevPos[4].y*100+50);
    p.bishop(prevPos[5].x*100+50, prevPos[5].y*100+50);
    p.knight(prevPos[6].x*100+50, prevPos[6].y*100+50);
    p.rook(prevPos[7].x*100+50, prevPos[7].y*100+50);
    for (int i = 0; i<8; i++) p.pawn(prevPos[8+i].x*100+50, prevPos[8+i].y*100+50);
    //the for loop draws the pawns.
    fill(0); //draw the black pieces
    p.rook(prevPos[16].x*100+50, prevPos[16].y*100+50);
    p.knight(prevPos[17].x*100+50, prevPos[17].y*100+50);
    p.bishop(prevPos[18].x*100+50, prevPos[18].y*100+50);
    p.queen(prevPos[19].x*100+50, prevPos[19].y*100+50);
    p.king(prevPos[20].x*100+50, prevPos[20].y*100+50);
    p.bishop(prevPos[21].x*100+50, prevPos[21].y*100+50);
    p.knight(prevPos[22].x*100+50, prevPos[22].y*100+50);
    p.rook(prevPos[23].x*100+50, prevPos[23].y*100+50);
    for (int i = 0; i<8; i++) p.pawn(prevPos[24+i].x*100+50, prevPos[24+i].y*100+50);
  } //end piece position function.

  void chooseSquare() { //function for the first click to designate the piece.
    if (mouseX >= 800) { 
      pieceNum = 32;
    }
    else {
      if (pieceNum >= 16) {
        for (int i = 32; i>=0; i--) { //checks through every piece in the position array
          if (prevPos[i].x == x && prevPos[i].y == y) { //to see if it matches with the mouse position.
            pieceNum = i; //if it does match, then select that position in the array.
          } //end if
        } //end for
      } //end if
      else if (pieceNum <16) {
        for (int i = 0; i<32; i++) { //checks through every piece in the position array
          if (prevPos[i].x == x && prevPos[i].y == y) { //to see if it matches with the mouse position.
            pieceNum = i; //if it does match, then select that position in the array.
          } //end if
        } //end for
      } //end mouseX
    } //end else
  } //end choose square function.

  void takePiece() {
    int capturedPiece = r.kill();
    //    println(lastPiece + " destination: " + capturedPiece);
    prevPos[capturedPiece].set(8+graveyardCountX, graveyardCounter); 
    if (r.kill() != 32) {
      graveyardCounter++;
      if (graveyardCounter >= 8) {
        graveyardCountX += 0.5;
        if (graveyardCountX >= 1.0) {
          graveyardCounter = 0;
          println("");
        }
        else graveyardCounter = 1;
      }
    }
  }

  void reset() { //reset board
    if (keyPressed == true && key == 32) { //if the space bar is pressed, 
      for (int i = 0; i<8; i++) { //then start a new game with the default start position.
        //load the positions in the position array.
        prevPos[i].set(i, 7); //white major and minor pieces
        prevPos[i+8].set(i, 6);//white pawns
        prevPos[i+16].set(i, 0); //black major and minor pieces
        prevPos[i+24].set(i, 1); //black pawns
      }
      position(); //display the default position.
      count = 0; //reset the mouse counter
      lastTurn = 1; //reset the turn counter.
      pieceNum = 32;
      graveyardCounter=1;
      graveyardCountX=0;
      note = new Note(48, 90, 60000);
      midi6.sendNote(note);
      textSize(50); //change the text size to large
      text("New Game", width/2, height/2); //and display the new game message.
      println("New Game"); //print it to the console.
    } //end of keypressed function
  } //end of reset function
} //end of class

