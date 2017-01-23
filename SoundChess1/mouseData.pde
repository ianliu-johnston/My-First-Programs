void mousePressed() { //mouse event when pressed.
  count++; //increase count by 1
  int whichX = (int) map(mouseX, 0, 800, 0, 8); //map mouseX from 800 to 8.
  int whichY = (int) map(mouseY, 0, 800, 0, 8); //map mouseY from 800 to 8.
  x = round(mouseX/100-.5); //sets X and Y mouse position on the first click.
  y = round(mouseY/100-.5);
  if (count==1) { //The first mouse click count
    rectMode(CORNER);
    fill(#34DDDD, 50); //fills the square with turquoise.
    rect(whichX*100, whichY*100, 100, 100); 
    //draws a transparant square over the designated  square.
    rectMode(CENTER);
    fill(255, 0, 0);
    textSize(50);
    text(count, whichX*100, whichY*100+100);  //displays click count as big and red.
  } //end if
  else if (count == 2) { //The second mouse click
    rectMode(CORNER);
    fill(#34DDDD, 50); //fills the designated square with turquoise
    rect(whichX*100, whichY*100, 100, 100); 
    //and draws a transparant rectangle over the designated square.
    rectMode(CENTER);
    fill(255, 0, 0);
    textSize(50);
    text(count, whichX*100, whichY*100+100); //and displays click count.
  } //end else if
} //end mousePressed function.

void mouseReleased() { //mouse released function.
  if (count == 1) { //if the first mouse click, 
    chess.chooseSquare(); //calls the chess function to designate the correct squre.
//  sequencer.start();


    /*DISABLED FOR DEBUG*/
    rule.playerRules(); //players take turns.
  } //end if
  else if (count == 2) { //otherwise, if its the second click
    chess.run();
sdfx.triggerSDFX(x);
    count = 0; //then reset the mouse click counter.
  } //end else if
  println(chess.getData());

  //whenever the mouse is clicked, display the clicked square's location.
} //end mouseReleased function.

void keyPressed() {
  chess.reset(); //load the reset function. The space bar resets the board.
}

