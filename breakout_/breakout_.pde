import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

// sounds
Minim minim;
AudioPlayer intro, point, bounce, life, win, loss;

// GIF
PImage[] space;
int frame;

//bricks
int [] x; //arrays
int [] y; //arrays
boolean [] alive;
int brickd;
int n;
int tempx, tempy;

// colors
color pink = #FF008D;
color green = #00FF3D;
color white = #FFFFFF;
color brown = #45201E;
color red = #A02D03;
color truered = #FF4B4B;
color orange = #FA8303;
color blue = #03ADFA;
color yellow = #E8BB3F;
color darkyellow = #FFAC12;
color black = #030303;
color darkblue = #272D4D;
color purple = #F50A60; //#B83564;
color mango = #FF6A5A;

// entity varables
float bx, by, bd; // paddle
float ballx, bally, balld; //ball
float vx, vy; // target velocity
float paddld;

// lives
int lives, timer, score;

// modes
int mode;
final int INTRO = 1;
final int GAME = 2;
final int PAUSE = 3;
final int GAMEOVER = 4;

PFont font;

void setup() {
  // load animated gif
  space = new PImage[9];
  int j = 0;
  while (j < 9) {
    space[j] = loadImage("frame_" +j+ "_delay-0.04s.gif");
    j = j + 1;
  }
  
  //initalize bricks
  brickd = 50;
  n = 22;
  x = new int [n];
  y = new int [n];
  alive = new boolean[n];
  
  tempx = 100; // starting point for bricks
  tempy = 100; // starting point for bricks
 
  int i = 0;
  while (i < n) {
    x[i] = tempx;
    y[i] = tempy;
    alive[i] = true;
    tempx = tempx + 100;
    i = i + 1;
    
    //second row
    if (tempx == 800) {
      tempx = 100;
      tempy = tempy + 100;
      tempx = tempx + 50;
    }
    // third row
    if (tempx == 750) {
      tempx = 100;
      tempy = tempy + 100;
      tempx = tempx + 101;
    }
    // fourth row
    if (tempx == 701) {
      tempx = 100;
      tempy = tempy + 100;
      tempx = tempx + 150;
    }
  }
  // general setup
  size(800, 600);
  mode = INTRO;

  // initalize paddle
  bx = width/2;
  by = 600;
  bd = 100;

  // initialize ball
  ballx = width/2;
  bally = 500;
  balld = 40;
  vx = vx + 10;
  vy = vy + 10;
  paddld = 100;

  // initialize score
  lives = 3;
  timer = 100;
  score = 0;
  
  // font
  font = loadFont("Tahoma-Bold-48.vlw");
  textFont(font, 48);
  
  //minim
  minim = new Minim(this);
  intro = minim.loadFile("intro.wav");
  point = minim.loadFile("beep.wav");
  life = minim.loadFile("boop.wav");
  win = minim.loadFile("win.wav");
  loss = minim.loadFile("failure.wav");
  bounce = minim.loadFile("wall.wav");
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
  } else {
    println("Mode error: " + mode);
  }
}
