final int O = 0;
final int X = 1;
final int EMPTY = -1;

final int GAME_START = 1;
final int GAME_RUN = 2;
int gameState;

PImage imgO, imgX;

boolean turn;
final boolean O_TURN = true;
final boolean X_TURN = false;

int s = 3; // board size
int [][] pegs = new int[s][s];
float spacing;

void setup(){
  size (150,150);
  imageMode(CENTER);
  imgO = loadImage("O.png");
  imgX = loadImage("X.png");
  spacing = width/s;
  
  turn = O_TURN;
  gameState = GAME_START;
}

void draw(){
  switch (gameState){
    case GAME_START:
      // reset the pegs
      for (int row=0; row < s; row++){
        for (int col=0; col < s; col++){
          // initialize array
          pegs[col][row] = EMPTY;  // column major
          // draw grid
          stroke(0);
          rect(col*spacing, row*spacing, spacing, spacing);
        }
      }

      gameState = GAME_RUN;
      break;
      
    case GAME_RUN:
      // check isTie?
      boolean isTie = true;
      for (int row=0; row < s; row++){
        for (int col=0; col < s; col++){
          // no empty pegs left and no one has won
          if (pegs[col][row] == EMPTY){
            isTie = false;
          }
        }
      }
      if (isTie){
        println("tie");
        gameState = GAME_START;
      }
      break;
  }
}

void mousePressed(){
  int col = int(mouseX / spacing);
  int row = int(mouseY / spacing);
  float x = spacing/2 + col*spacing;
  float y = spacing/2 + row*spacing;
    
  if (pegs[col][row] == EMPTY){
    int currentPeg = (turn) ? O : X;
    pegs[col][row] = currentPeg;
    if ( currentPeg == O){
      image(imgO, x, y);
    }else{
      image(imgX, x, y);
    }
    
    //check rows for win
    for (row=0; row < s; row++){
      if (pegs[0][row] == currentPeg &&
          pegs[1][row] == currentPeg && 
          pegs[2][row] == currentPeg){
          //y = spacing/2 + row*spacing;
          //stroke(255,0,0);
          //line(0, y, width,y);
          println("player" + currentPeg + " wins");
          gameState = GAME_START;
      }
    }
    // check columns for win
    for (col=0; col < s; col++){
      if (pegs[col][0] == currentPeg &&
          pegs[col][1] == currentPeg &&
          pegs[col][2] == currentPeg){
          //x = spacing/2 + col*spacing;
          //stroke(255,0,0);
          //line(x, 0, x, height);
          println("player" + currentPeg + " wins");
          gameState = GAME_START;
      }
    }
    // check diagonals for win
    if (pegs[0][0] == currentPeg &&
        pegs[1][1] == currentPeg &&
        pegs[2][2] == currentPeg){
        //stroke(255,0,0);
        //line(0, 0, width, height);
        println("player" + currentPeg + " wins");
        gameState = GAME_START;
    }
    if (pegs[2][0] == currentPeg &&
        pegs[1][1] == currentPeg &&
        pegs[0][2] == currentPeg){
        //stroke(255,0,0);
        //line(width, 0, 0, height);
        println("player" + currentPeg + " wins");        
        gameState = GAME_START;
    }
    
    // take turn
    turn = !turn;
  }
}
