  /***********************************************************************
  Assignment 2 - Fly Swatter Game
  
  Author - Will Duckworth
  
  Program - A simple fly swatter game that has the user interact
  with the randomly generated flies in order to click on the fly 
  with the cursor set to a fly swatter in order to squash the 
  animated flies.
  
  The program generates randomly moving and randomly spawned flies
  to the screen once they are squashed. The first level that is created
  here has a limit of ten flies, and the complexity is set to "easy mode"
  so that the fly speed is fairly slow.
  
  Once the player has killed all ten flies, the game ends and displays
  the message that the player has comlpeted the first level.
  ************************************************************************/

/* Import sound library for fly and swatter sounds
   Then initiate all variables used in functions */
import processing.sound.*;
SoundFile fly_buzz;
SoundFile smack;
int fly_dead;
PImage fly; PImage flybye;
PImage swatter; PImage swatted;
float x_dir = .1; float y_dir = .1;
float x = random(1,400); float y = random(1,400);
boolean fly_alive = true;
float splat_x; float splat_y;
int fly_counter = 0; int i = 0;
int [] score = new int [11]; 
float [] splat = new float [20]; 
int a_count = 0; 
int b_count [] = new int [20];
boolean cursor_switch = false;

/* Set up screen size, frame rate and draw score loop
   Load images for fly, swatter, swatted and the dead flies from library */

void setup(){
  frameRate(600);
  size(600,600);
  for (int i=0; i <= 10; i++){
  score[i] = i;
  }
  smack = new SoundFile(this, "smack.wav");
  fly_buzz = new SoundFile(this, "fly_buzz.wav");
  fly = loadImage("fly.png");
  swatter = loadImage("swatter.png");
  flybye = loadImage("flybye.png");
  swatted = loadImage("swatted.png");
}

// Draw flies and dead fly function calls in draw loop
void draw(){
  background(255);
  fly_move();
  fly_splat();
  
// Set the control flow for the change of cursor from MouseClicked function.
  if (cursor_switch == false){
  cursor(swatter, 40, 40);
  }else{
  cursor(swatted,10,10);
  noLoop();
  delay(50);
  loop();
  cursor_switch = false;
  }
  
// If flies dead has reached the game limit, stop draw loop and display win message 
  text(fly_score(), width - (width * .12), width - (width * .9));
  fill(0);textSize(height * .1);
  if(fly_dead == 10){
    text("LEVEL 1 COMPLETE!", width * .12, height/2);textSize((width+height)/4);  
    noLoop();
  }
}
// Function to return the appended fly dead variable to the draw loop
int fly_score(){
  fly_dead = score[fly_counter];
  return fly_dead;
}

// End of code
