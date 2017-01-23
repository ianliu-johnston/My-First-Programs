class Rules { //rules class.

  Rules() {
  } //empty constructor.
  //************functions*************//
  void run(PVector _pieceLoc) { //main rules function.
    //encapsulates all other Rules class functions.
    pawnRules(_pieceLoc);
    rookRules(_pieceLoc);
    knightRules(_pieceLoc);
    bishopRules(_pieceLoc);
    queenRules(_pieceLoc);
    kingRules(_pieceLoc);
  } //end main run function.

  void pawnRules(PVector _whichPiece) {
    int whichPieceX = (int) _whichPiece.x;
    int whichPieceY = (int) _whichPiece.y;

    //single square movement
    if (pieceNum >= 8 && pieceNum <= 15 || pieceNum >= 24 && pieceNum <= 31) { 
      if (whichPieceX  > x || whichPieceX  < x) { //Pawns cant move out of their column.
        println("Pawn #" + pieceNum + " moved out of its column.");
        x = whichPieceX;
        y = whichPieceY;
        lastTurn--;
      }

      if (pieceNum >= 8 && pieceNum <= 15) { //Black
        if (whichPieceY == 6) {
          if (y < whichPieceY-2) {
            println("Black pawn #" + pieceNum + " moved too far.");
            y = whichPieceY;
            lastTurn--;
          } //end of if white pawn movement restriction
        }
        else if (y > whichPieceY) {
          y = whichPieceY;
          lastTurn--;
        }
        else {
          if (y < whichPieceY-1) {
            println("Black pawn #" + pieceNum + " moved too far.");
            y = whichPieceY;
            lastTurn--;
          } //end of if white pawn movement restriction
        }
      } //end of if black pawn movement restriction designation

      else if ( pieceNum >= 24 && pieceNum <= 31) {
        if (whichPieceY == 1) {
          if (y > whichPieceY+2) {
            println("Black pawn #" + pieceNum + " moved too far.");
            y = whichPieceY;
            lastTurn--;
          } //end of if white pawn movement restriction
        }
        else if (y < whichPieceY) {
          y = whichPieceY;
          lastTurn--;
        }
        else {
          if (y > whichPieceY+1) {
            println("Pawn #" + pieceNum + " moved too far.");
            y = whichPieceY;
            lastTurn--;
          } //end of if white pawn movement restriction
        }
      } //end of if white pawn movement restriction designation
    } //end of all pawn deisgnation if loop
    //en passant
    //diagonal capture
    //pawn promotion
  } //end pawn rules function.

  void rookRules(PVector _whichPiece) {
    if (pieceNum == 0 || pieceNum == 7 || pieceNum == 16 || pieceNum == 23) {
      int whichPieceX = (int) _whichPiece.x;
      int whichPieceY = (int) _whichPiece.y;
      if (x > whichPieceX && y > whichPieceY ||
        x > whichPieceX && y < whichPieceY ||
        x < whichPieceX && y > whichPieceY ||
        x < whichPieceX && y < whichPieceY) {

        x = whichPieceX;
        y = whichPieceY;
        lastTurn--;
      }
    }
    //column and row movement
  } //end rook rules function.



  void knightRules(PVector _whichPiece) {
    int whichPieceX = (int) _whichPiece.x;
    int whichPieceY = (int) _whichPiece.y;
    if (pieceNum == 1 || pieceNum == 6 || pieceNum == 17 || pieceNum == 22) {
      if (x == whichPieceX+2 && y == whichPieceY + 1 ||
        x == whichPieceX+2 && y == whichPieceY - 1 ||
        x == whichPieceX-2 && y == whichPieceY + 1 ||
        x == whichPieceX-2 && y == whichPieceY - 1 ||
        x == whichPieceX+1 && y == whichPieceY + 2 ||
        x == whichPieceX+1 && y == whichPieceY - 2 ||
        x == whichPieceX-1 && y == whichPieceY + 2 ||
        x == whichPieceX-1 && y == whichPieceY - 2) {
        x = x;
        y = y;
      }
      else {
        x = whichPieceX;
        y = whichPieceY;
        lastTurn--;
      }
    }
  } //end knight rules function.

  void bishopRules(PVector _whichPiece) {
    int whichPieceX = (int) _whichPiece.x;
    int whichPieceY = (int) _whichPiece.y;
    //diagonal movement restriction

    if (pieceNum == 2 || pieceNum == 21) {
//      if (abs(whichPieceX-x) == abs(whichPieceY-y)) { //darkSquared
//      
//      //absolute value of teh difference between the x's and absolute value of the difference between the y's
//        x = whichPieceX;
//        y = whichPieceY;
//        lastTurn--;
//      }
    }
    else if (pieceNum == 5 || pieceNum == 18) { //lightSquared
//      //      if ((x + y) % 2 != 0) { 
//      x = whichPieceX;
//      y = whichPieceY;
//      lastTurn--;
            }
  } //end bishop rules function.

  void queenRules(PVector whichPiece) {
    if (pieceNum == 3 || pieceNum == 19) {
    }

    //bishop and rook movement
  } //end queen rules function.

  void kingRules(PVector _whichPiece) {
    int whichPieceX = (int) _whichPiece.x;
    int whichPieceY = (int) _whichPiece.y;
    //king movement
    if (pieceNum == 4 || pieceNum == 20) {
      if (x < whichPieceX-1 || x > whichPieceX+1 || 
        y < whichPieceY-1 || y > whichPieceY+1) { //Movement Restriction
        println("King " + pieceNum + " moved too far.");
        x = whichPieceX;
        y = whichPieceY;
        lastTurn--;
      }
      //castling
      
    }
    //castling
    //castling prevention
    //piece pin
    //check
    //checkmate
  } //end king rules function

  int kill() {
    int t = 32;
    int newPiece;
    lastPiece = pieceNum;
    chess.chooseSquare();
    newPiece = pieceNum;
    if ( lastPiece !=  newPiece ) t = pieceNum;
    if (pieceNum == 20 || pieceNum == 4) t = 32; //can't take the King.
    if (lastPiece < 16 && pieceNum < 16) t = 32; //and white can't take white.
    if (lastPiece >= 16 && pieceNum >= 16) t = 32; //black can't take black
    return t;
  }

  void blocking() {
    
  }


  void playerRules() { //Player rule of taking turns and illegal moves.
    lastTurn++; //ChooseTurn counter.
    if (lastTurn % 2 != 0 && pieceNum > 15) println("Go, Black"); //odd turns are white.
    else if (lastTurn % 2 == 0 && pieceNum <= 15) {
      println("Go, White");  //even turns are black.
    }
    else { //if it is not a players turn, prevent the player from selecting a piece.
      count =0; //by resetting the mouse counter to 0
      lastTurn--; // and setting the turn count back.
      chess.position(); //re-display the position to clear designation squares.
      print("Not Your Turn, "); //print not your turn to the console.
      if (pieceNum <15) //if the piece is white or black
        println("White"); //print the white or black player name.
      else 
        println("Black");
    }//end Choose Turn
  } //end player Rules
} //end rules class.

