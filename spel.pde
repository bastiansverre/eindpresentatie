//leuk spel
//als hij het niet doet, klik dan 1 keer
//luchtbom werkt pas bij de grond (vijand f)
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
Minim minim;
AudioPlayer muziek;
PImage c;
PImage b;
PImage a;
PImage d;
PImage e;
PImage f;
PImage gras;
boolean r = false;
boolean l = false;
boolean s = false;
float x = 60; 
float y = 580;
float xb = 1400; 
float xv = 1800; 
float xa = 2400;
float xe = 2000;
float yf = -100;
int score = 0;
void setup() {
  size(1400, 750);
  textSize(32);
  c = loadImage("c.gif");
  c.resize(40, 40);
  b = loadImage("b.png");
  b.resize(50, 50);
  a = loadImage("a.png");
  a.resize(50, 50);
  e = loadImage("e.png");
  e.resize(40, 40);
  f = loadImage("f.png");
  f.resize(60, 60);
  gras = loadImage("gras.png");
  gras.resize(450, 80);
  minim = new Minim(this);
  muziek = minim.loadFile("Wie is de Mol_ Muziek Medley.mp3", 2048);
  muziek.loop();
}
void tekenMonsters()
{
  image(c, xb, 650);
  image(b, xv, 630);
  if (score > 15)
  {
    image(a, xa, 630);
  }
  if (score > 35)
  {
    image(e, xe, 575);
  }
  if (score > 50)
  {
    image(f, 700, yf);
  }
}
void draw() {
  background(0, 0, 255);
  image(gras, 575, 500);
  fill(100, 200, 150);
  tekenMonsters();
  rect(x, y, 50, 80); 
  line(0, 675, 1400, 675);
  fill(0, 233, 69);
  rect(0, 675, 1400, 75);
  fill(21, 74, 40);
  rect(0, 0, 1400, 150);
  fill(255, 255, 255);
  text("score: " + score, 1000, 50);
  if (x > 200)
  {
    stroke(255, 80, 90);
    line(199, 0, 199, 675);  
    line(1201, 0, 1201, 675);
  }
  if (x <= 199)
  {
    x = x + 20;
  }
  if (x >= 1201)
  {
    x = x - 20;
  }
  if (r && x < 1300)
  {
    x = x + 6;
  }
  if (l && x > 10)
  {
    x = x -6;
  } 
  if (y < 600)
  {
    y = y + 5.5;
  }
  //vijand c
  xb = xb - 2;
  if (xb < x + 40 && xb > x && y > 560)
  {
    exit();
  }
  if (xb < 0)
  {
    xb = xb + 1400;
    score = score + 1;
  }
  //vijand b
  xv = xv - 4;
  if (xv < x + 50 && xv > x && y > 560)
  {
    exit();
  }
  if (xv < 0)
  {
    xv = xv + 1500;
    score = score + 1;
  }
  //vijand a
  xa = xa - 6;
  if (xa < x + 50 && xa > x && y > 560 && score > 10)
  {
    exit();
  }
  if (xa < 0 && score > 10)
  {
    xa = xa + 2500;
    score = score + 1;
  }
  //vijand e
  if (score > 35)
  {
    xe = xe - 6;
  }
  if (xe < x + 50 && xe > x && y > 540 && y < 570 && score > 10)
  {
    exit();
  }
  if (xe < 0 && score > 25)
  {
    xe = xe + 1400;
    score = score + 1;
  }
  //vijand f
  yf = yf + 10;
  if (score > 50)
  {
    yf = yf - 6;
  }
  if (x < 750 && x > 650 && yf < 625 && yf > 525 && score > 50)
  {
    exit();
  }
  if (yf > 750 && score > 50)
  {
    yf = yf - 850;
    score = score + 2;
  }
  if ( x > 575 && x < 1025 && y > 500)
  {
    y = 500;
  }
  if (keyCode == UP && x > 575 && x < 1025 && y > 700); 
  {
   y = y - 150; 
  }
}
void keyPressed() {
  if (key == ' ')
  {
    s = true;
  }
  if (keyCode == RIGHT)
  {
    r = true;
  }
  if (keyCode == LEFT)
  {
    l = true;
  }
  if (keyCode == UP && y >= 600)
  {
    y = y -150;
  }
  if (keyCode == DOWN && y >= 580)
  {
    y = y + 50;
  }
  //cheats     
  if (keyCode == 'Z')
  {
    xa = 2780;
  }
  if (keyCode == 'X')
  {
    xe = 2000;
  }
  if (keyCode == 'C')
  {
    score = score + 1000;
  }
  if (keyCode == 'V')
  {
    score = score + 100;
  }
  if (keyCode == 'B')
  {
    y = 350;
  }
  if (keyCode == 'N')
  {
    x = x - 250;
  }    
  if (keyCode == 'M')
    x = x + 250;
}

void keyReleased()
{
  if (keyCode == RIGHT)
  {
    r = false;
  }
  if (keyCode == LEFT)
  {
    l = false;
  }
}