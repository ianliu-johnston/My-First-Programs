SenStruct reconstruct;

String [] nouns;
String [] nouns2;
String [] nouns3;
String [] past_verbs;
String [] present_verbs;
String [] adverbs;
String [] adjectives;
String [] adjectives2;
String [] spoke;

String [] posessive_pronouns;
String [] pronouns;
String [] pronouns2;
String outputMain;

String[] words = new String[11];
String[] punct = new String [4]; //punctuation
String struct;
String listNum;

//For Naming
int d = day();
int m = month();
int y = year();
//For Formatting   
int yLoc = 60;
int indent = 5;
int numOfPoem = 1;
int whichOne;

void setup() {
  size(650, 800, P3D);  
  textSize(12);
  fill(0);
  background(255);
  frameRate(2);   //speed

  //to initialize dictionaries
  adjectives = loadStrings("Adjectives.txt");
  adjectives2 = loadStrings("Adjectives.txt");
  nouns = loadStrings("Nouns.txt");
  nouns2 = loadStrings("Nouns.txt");
  nouns3 = loadStrings("Nouns.txt");
  past_verbs = loadStrings("Past_Verbs.txt");
  present_verbs = loadStrings("Present_Verbs.txt");
  posessive_pronouns = loadStrings("Posessive_Pronouns.txt");
  pronouns = loadStrings("Pronouns.txt");
  pronouns2 = loadStrings("Posessive_Pronouns.txt");
  spoke = loadStrings("Talking.txt");

  adverbs = loadStrings("Adverbs.txt");

  //for punctuation
  punct [0] =  " ";
  punct [1] = ".";
  punct [2] = ",";
  punct [3] = "?";

  //Nameing
  text("Pseudorandom Poem " + numOfPoem, indent, 15); 
  text( m + "-" + d + "-" + y, indent, 30);
  listNum = pronouns2[(int)random(pronouns2.length-1)];
  text ( listNum + " life flashed before " + listNum + " eyes. The gun was loaded in front of the firing line." , indent, 60);
  //reconstructing sentences class
  //picks a random word from the dictionary as a control
  reconstruct = new SenStruct( 1, 2, 3 );
}

//Main Loop
void draw() {
  sentence();
}

//Intermediary function inbetween words picker and sentence type picker.
void sentence() {
  if (frameCount % 4 == 0) {
    outputMain = (String) reconstruct.detectWord( (int) random(nouns.length), (int) random(nouns.length), (int) random(nouns.length), 
   (int) random(nouns.length), (int) random(nouns.length), (int) random(nouns.length), (int) random(nouns.length) );
    //brings to a new line  
    yLoc+=15;     
    //Writes text to screen
    text ( outputMain, indent, yLoc);

    //Repeats list generation
    if(yLoc > height-15-indent) {
      //outputs to a file
      if(yLoc > height-indent) {

      String Title = "Pseudorandom Poem " + numOfPoem + ".txt";
      numOfPoem++;

      //      save( Title ); //outputs a file to the project folder as a .tif
      //      saveStrings (Title, ); // --> turn into string array, and you can save that string array
      // Resets the Poem
      yLoc = 60;
      background(255);
      text( "Pseudorandom Poem " + numOfPoem, indent, 15); 
      text( m + "-" + d + "-" + y, indent, 30);
      listNum = pronouns2[(int)random(pronouns2.length-1)];
      text ( listNum + " life flashed before " + listNum + " eyes. The gun reloaded as the soldier moved down the firing line." , indent, 60);
      }
    }
    }
  }
