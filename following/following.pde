// Learning Processing
// Daniel Shiffman
// http://www.learningprocessing.com

// Example 9-8: A snake following the mouse

// Declare two arrays with 50 elements.
int[] xpos = new int[50]; 
int[] ypos = new int[50];

void setup() {
  size(200,200);
  
  smooth();
  // Initialize all elements of each array to zero.
  for (int i = 0; i < xpos.length; i ++ ) {
    xpos[i] = 0; 
    ypos[i] = 0;
  }
}

void draw() {
  background(255);
  
  // New location
  xpos[xpos.length-1] = mouseX; // Update the last spot in the array with the mouse location.
  ypos[ypos.length-1] = mouseY;
  
  for (int i = 0; i < xpos.length; i ++ ) {    
    // Draw an ellipse for each element in the arrays. 
    // Color and size are tied to the loop's counter: i.
    noStroke();
    fill(map(i,0,xpos.length,255,0)); // 255~0
    ellipse(xpos[i],ypos[i],i,i); 
    
    // Shift array values
    // Shift all elements down one spot. 
    // xpos[0] = xpos[1], xpos[1] = xpos[2], and so on. Stop at the second to last element.
    if (i < xpos.length-1){
      xpos[i] = xpos[i+1];
      ypos[i] = ypos[i+1];
    }
  }
}
