// class to draw flower

class Flower {
  float x, y;  

  // Constructor
  Flower(float x, float y) {
    this.x = x;
    this.y = y;
  }
    void sprout() 
    { 
    fill(0,222,0); //green sprout
    noStroke();
    fill(0,225,20);
    ellipse(x,y-5, 5, 10);
    }
    
    void grow() 
    {
    fill(0,225,0); //green stem
    rect(x-4,y-25, 8, 50);
    fill(255,255,0); // yellow bulb
    stroke(5);
    arc(x, y - 50, 30, 50, 0, PI);
    }
}
