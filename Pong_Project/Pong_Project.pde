import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//Pong!
//Katelynn Bai
//Oct 15


//mode framework
int mode;
final int INTRO    = 1;
final int GAME     = 2;
final int PAUSE    = 3;
final int GAMEOVER = 4;
final int OPTIONS  = 5;

//gamemode variables
boolean AI;
boolean rally;

//entity variables
float leftx, lefty, leftd, rightx, righty, rightd; //paddle
float ballx, bally, balld; //ball
float vx, vy;

//keyboard variables
boolean wkey, skey, upkey, downkey;

//scoring
int leftscore, rightscore, timer;
int rallyscore, rallyhigh;

//tactile variables
float tactileX, tactileY, tactileW, tactileH;
int tactileStroke, tactileWeight, tactileFill;
int greencolorr, greencolorg, greencolorb;
int lilaccolorr, lilaccolorg, lilaccolorb;
int orangecolorr, orangecolorg, orangecolorb;
boolean tactileOn;

//Options Variables
float leftsliderY, rightsliderY;

//images
PImage PogFish;
PImage settings, home;

//sounds
Minim minim;
AudioPlayer wallpong, leftpong, rightpong, music, clapping, score;

void setup() {
  size(800, 600);
  mode = INTRO;


  //initialize paddles
  leftx = 0;
  lefty = height/2;
  leftd = 200;

  rightx = width;
  righty = height/2;
  rightd = 200;

  //initialize ball
  ballx = width/2;
  bally = height/2;
  balld = 100;
  while (vx <= 2 && vx >= -2) {
    vx = random(-5, 6);
  }
  while (vy <= 2 && vy >= -2) {
    vy = random(-5, 7);
  }

  //initialize score
  rightscore = leftscore = rallyscore = rallyhigh = 0;
  timer = 100;


  //initialize keyboard vars
  wkey = skey = upkey = false;

  //initialize slider variables
  leftsliderY = 250;
  rightsliderY = 250;


  //text
  textAlign(CENTER, CENTER);

  //images
  PogFish = loadImage("pog.png");
  settings = loadImage("settings.png");
  home = loadImage("home.png");


  //sounds
  minim = new Minim(this);
  music = minim.loadFile("yummie__game-background-music-loop-short.mp3"); //https://freesound.org/people/yummie/sounds/410574/
  wallpong = minim.loadFile("pong.mp3");
  leftpong =  minim.loadFile("leftpaddle.wav");
  rightpong =  minim.loadFile("rightpaddle.wav");
  clapping = minim.loadFile("clapping.wav");
  score = minim.loadFile("score.wav");

  //colors
  greencolorr = 108;
  greencolorg = 255;
  greencolorb = 134;
}


void draw() {
  if (mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == PAUSE) {
    pause();
  } else if (mode == GAMEOVER) {
    gameover();
  } else if (mode == OPTIONS) {
    options();
  } else {
    System.out.println("Mode error: " + mode);
  }
}
