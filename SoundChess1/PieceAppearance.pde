class ChessPieces { //class only for the appearance.
  ChessPieces() {
  } //empty constructor.
  void pawn(float centerX, float centerY) { 
    //centerX + centerY moves the piece to the center of each square.
    pushMatrix(); //begin translate.
    translate(centerX-47, centerY-40); //center the piece on squares.
    ellipse(50, 15, 10, 10); //head
    ellipse(50, 32, 26, 16); //stem
    rect(50, 45, 26, 26); //stem
    rect(50, 69, 40, 10); //base
    popMatrix();
  }

  void rook(float centerX, float centerY) {
    pushMatrix();
    translate(centerX-47, centerY-40);
    rect(33, 12, 6, 6); //left top square
    rect(50, 12, 6, 6); //middle
    rect(67, 12, 6, 6); //right
    rect(50, 20, 40, 10); //head plate
    rect(50, 45, 25, 22); //stem
    rect(50, 69, 40, 10); //base
    popMatrix();
  }

  void knight(float centerX, float centerY) {
    pushMatrix();
    translate(centerX-47, centerY-40);
    beginShape(); //start drawing the curve of the main body.
    vertex(40, 55);
    vertex(65, 55);
    bezierVertex(65, 55, 67, 25, 50, 20);
    bezierVertex(50, 20, 35, 15, 30, 35);
    bezierVertex(30, 35, 25, 50, 45, 40);
    bezierVertex(45, 40, 49, 36, 45, 35);
    bezierVertex(45, 35, 46, 41, 35, 39);
    bezierVertex(35, 39, 28, 37, 35, 29);
    bezierVertex(35, 29, 49, 15, 51, 38);
    bezierVertex(51, 38, 52, 48, 40, 55);
    endShape(CLOSE);  //end the main body.
    beginShape(); //start the shape of the ear.
    vertex(38, 21);
    vertex(42, 16);
    bezierVertex(42, 16, 46, 10, 41, 9);
    endShape(CLOSE); //end the ear shape.
    rect(50, 69, 40, 10); //base
    popMatrix();
  }

  void bishop(float centerX, float centerY) {
    pushMatrix();
    translate(centerX-47, centerY-40);
    ellipse(50, 11, 9, 9); //moon
    arc(50, 25, 17, 17, -QUARTER_PI+.4, PI+(HALF_PI+0.5), PIE); //pacman shape.
    ellipse(50, 33, 40, 7); //ring
    rect(50, 50, 25, 17); //stem
    rect(50, 69, 40, 10); //base
    popMatrix();
  }

  void queen(float centerX, float centerY) {
    pushMatrix();
    translate(centerX-47, centerY-47);
    beginShape(); //start crown
    vertex(30, 37);
    vertex(70, 37);
    vertex(70, 15);
    vertex(59, 30);
    vertex(50, 15);
    vertex(41, 30);
    vertex(30, 15);
    vertex(30, 37);
    endShape(); //end crown
    ellipse(30, 12, 5, 5); //left circle crown
    ellipse(50, 12, 5, 5); //center circle crown
    ellipse(70, 12, 5, 5); //right circle crown

    ellipse(37, 41, 3, 3); //top body circles
    ellipse(50, 41, 3, 3);
    ellipse(63, 41, 3, 3);

    ellipse(37, 48, 3, 3); //middle body circles
    ellipse(63, 48, 3, 3);

    ellipse(37, 55, 3, 3); //bottom body circles.
    ellipse(50, 55, 3, 3);
    ellipse(63, 55, 3, 3);
    rect(50, 65, 40, 10); //first base layer
    rect(50, 80, 60, 10); //base layer.
    popMatrix();
  }

  void king(float centerX, float centerY) {
    pushMatrix();
    translate(centerX-47, centerY-47);
    beginShape(); //start crown
    vertex(30, 37);
    vertex(70, 37);
    bezierVertex(70, 37, 80, 10, 52, 30); //right curve
    vertex(52, 20); //cross
    vertex(55, 20);
    vertex(55, 17);
    vertex(52, 17);
    vertex(52, 14);
    vertex(48, 14);
    vertex(48, 17);
    vertex(45, 17);
    vertex(45, 20);
    vertex(48, 20);
    vertex(48, 30);
    bezierVertex(48, 30, 20, 10, 30, 37); //left curve
    endShape();

    ellipse(50, 5, 2, 2); //top cross echoes
    ellipse(50, 10, 3, 3);
    ellipse(43, 18, 2, 2); //right cross echo
    ellipse(57, 18, 2, 2); //left cross echo


    ellipse(37, 41, 3, 3); //top row body circles
    ellipse(50, 41, 3, 3);
    ellipse(63, 41, 3, 3);

    ellipse(37, 48, 3, 3); //middle row body circles
    ellipse(63, 48, 3, 3);

    ellipse(37, 55, 3, 3); //bottom row body circles
    ellipse(50, 55, 3, 3);
    ellipse(63, 55, 3, 3);
    rect(50, 65, 40, 10); //top base layer
    rect(50, 80, 60, 10); //base
    popMatrix();
  }
} //end pieces class

//begin grid function.
void grid() { //draw the grid
  background(#daa420); //color the background yellow.
  fill(0); // fill the border black.
  rectMode(CORNER); //change the rectangle to draw from the corners.
  rect(-13, -13, 826, 826); //draw the black border.
  for (int i=0; i<8; i++) { //draw the X 8x8 grid.
    for (int j=0; j<8; j++) { //draw the Y 8x8 grid.
      if ((i+j)%2==0) fill(150);  //alternates black and white squares
      else fill(90);
      rect (i*100, j*100, 100, 100); //populate the grid with squares.
      textSize(14); //change the text size
      fill(#daa420); //change the text color to yellow.
      int lett = i+97; //change the square number to ascii characters.
      char let = (char)lett; //cast the int lett value to characters.
      text(let, i*100+50, height+12); //draw the bottom row of letters
      text(let, i*100+50, -2); //draw the top row of letters.
      text(j+1, 802, j*100+50); //draw the right row of numbers.
      text(j+1, -12, j*100+50); //draw the left column of numbers.
    } //end nested for loop.
  } //end for loop
  rectMode(CENTER); //change the rectangle to draw from the center for piece appearance.
  printDataToWindow();
} //end grid function

void printDataToWindow() {
  rectMode(CORNER);
  textSize(14);
  fill(#da8020);
  rect(825, -10, 95, 100);
  fill(#da9520);
  rect(830, -5, 85, 90);
  fill(0);
    if (count == 1) text(type() + "" + chess.getData(), 850, 30);
    else text(lastTurn -1 + ". " + type() + "" + chess.getData(), 850, 45);
  rectMode(CENTER);
}

String type() {
  //pawn
  if (pieceNum >= 8 && pieceNum <= 15 || pieceNum >= 24 && pieceNum <= 31) {
    String p = "";
    return p;
  }
  //rook
  else if (pieceNum == 0 || pieceNum == 7 || pieceNum == 16 || pieceNum == 23) {
    String r = "R";
    return r;
  }
  // knight
  else if (pieceNum == 1 || pieceNum == 6 || pieceNum == 17 || pieceNum == 22) {
    String n = "N";
    return n;
  }
  // bishop
  else if (pieceNum == 2 || pieceNum == 5 || pieceNum == 18 || pieceNum == 21) {
    String b = "B";
    return b;
  }
  //queen
  else if (pieceNum == 3 || pieceNum == 19) {
    String q = "Q";
    return q;
  }
  //king
  else if (pieceNum == 4 || pieceNum == 20) {
    String k = "K";
    return k;
  }
  else {
    String z = "";
    return z;
  }
}

