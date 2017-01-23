class SenStruct { //declare class
//variables of class SenStruct
  int wordOfTheDay;
  int wordOfTheDay2;
  int wordOfTheDay3;
  //constructor
  SenStruct( int retnClass, int retnClass2, int retnClass3 ) {
    wordOfTheDay = retnClass;
    wordOfTheDay2 = retnClass2;
    wordOfTheDay3 = retnClass3;
  }
//detectWordFunction**START**
  String detectWord(int compareWord1, int compareWord2, int compareWord3, int compareWord4, int compareWord5, int compareWord6,
 int compareWord7 ) {
    String output;
//Words
    //pronouns
    String pos = words[0] = posessive_pronouns[(int) random(posessive_pronouns.length)];
    String pro = words[6] = pronouns[(int) random(pronouns.length)];
    String pr2 = words[9] = pronouns2[(int) random(pronouns2.length)];
    //adjectives
    String adj = words[1] = adjectives[(int) random(adjectives.length)];
    String adj2 = words[10] = adjectives2[(int) random(adjectives2.length)];

    //nouns
    String nou = words[2] = nouns[(int) random(nouns.length)];
    String no2 = words[5] = nouns2[(int) random(nouns2.length)];
    String no3 = words[8] = nouns3[(int) random(nouns3.length)];
    //verbs
    String presV = words[7] = present_verbs[(int) random(present_verbs.length)];
    String pastV = words[3] = past_verbs[(int) random(past_verbs.length)];
    String adv = words[4] = adverbs[(int) random(adverbs.length)];
    //punctuation
    String sp = punct[0];
    String p = punct[1];
    String exclaim = pro + sp + spoke[(int)random(spoke.length-1)] + ", '";
//Word Strings
    //type1 Example: "Her catatonic reality teathered your tome."
    String type1 = pos + sp + adj + sp + nou + sp + pastV + sp + pr2 + sp + no2 + p;
    //type2 Example: "we decrypted the illusion, rejouicing the theological insanity of your virus."
    String type2 = pro + sp + pastV + sp + "the" + sp + nou + ", " + presV + " the " + adj + sp + no2 + " of " + 
    pos + sp + no3 + p;
    //type3 Example: "they retracted the mimesis of his virus like a sience."
    String type3 = pro + sp + pastV + " the " + nou + " of " + pos + sp + no2 + " like a " + no3 + p; 
    //type4 Example: "when her audacity remembered its insanity I remembered your tendril a little longer."
    String type4 = "when " + pos + sp + nou + sp + pastV + sp + pr2 + sp + no3 + "," + sp + pro + sp + 
    pastV + sp + pos + sp + no2 + " a little longer.";
    //type5 Example: "
    String type5 = "the gun kept firing.";
    //type5 Example: "
    String type6 = "screams were heard.";
    String type7 = "blood splattered everywhere.";


    if ( wordOfTheDay == compareWord1 ) {
      output = exclaim + type3 + "'";
      whichOne = 3;
    }
    else if ( wordOfTheDay == compareWord2) {
      output = exclaim + type2 + "'";
       whichOne = 2;
    }
    else if ( wordOfTheDay == compareWord3 ) {
      output = exclaim + type1 + "'";
             whichOne = 1;
    }
    else if ( wordOfTheDay2 == compareWord4 ) { 
      output = exclaim + type4 + "'";
             whichOne = 4;
    }
    else if ( wordOfTheDay2 == compareWord5 ) { 
      output = type5;
             whichOne = 5;
    }
    else if ( wordOfTheDay2 == compareWord6 ) { 
      output = type6;
             whichOne = 6;
    }
    else if (wordOfTheDay3 == compareWord7 ) {
      output = type7;
             whichOne = 7;
    }
    else { 
      output = "RATATATATATATA";
            whichOne = 0;
    }
    return output;
  }
  //**END** detectWordFunction
}
