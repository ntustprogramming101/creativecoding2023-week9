/*
"Spinning Dancer" by Nobuyuki Kayahara - Procreo Flash Design Laboratory. 
Licensed under CC BY-SA 3.0 via Commons - https://commons.wikimedia.org/wiki/File:Spinning_Dancer.gif#/media/File:Spinning_Dancer.gif
*/

int numFrames=34;
int currentFrame;
PImage [] images = new PImage[numFrames];

void setup(){
  size(300,400);
  currentFrame = 0;
  for (int i=0; i<numFrames; i++){
    images[i] = loadImage("img/dancer-" + (i+1) + ".png");
  }
  frameRate(30);
}

void draw(){
    int i = (currentFrame ++) % numFrames; // clip loop
    image(images[i], 0, 0);
}
