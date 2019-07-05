// Global declarations
int count;
int numDrops = 40;
int flakenum = 300;
int segments = 40;
PImage sun;
float deg, r;
float damping = 0.6;
float flowerX = 0.0; // ground x position of flower
float flowerY = 0.0; // ground y position of flower
PVector position, velocity;
PVector gravity = new PVector(0,0.2);
float x1 = 0.0;
float y1 = 0.0;

// create array instances
Rain[] drops = new Rain[numDrops];
Snow[] flakes = new Snow[flakenum];
Ground[] ground = new Ground[segments];

Orb orb;
Rain r1;
Flock flock;

void setup(){
  size(640, 360);
  sun = loadImage("sun.png");

  // create object instances
  orb = new Orb(50, 50, 2);
  flock = new Flock();
  
  // add flock of birds
  for (int i = 0; i < 150; i++) {
    flock.addBoid(new Boid(width ,height/2));
  }
  
  // Calculate ground peak heights 
  float[] peakHeights = new float[segments+1];
  for (int i=0; i<peakHeights.length; i++){
    peakHeights[i] = random(height-40, height-30);
  }

  /* Float value required for segment width (segs)
   calculations so the ground spans the entire 
   display window, regardless of segment number. */
  float segs = segments;
  for (int i=0; i<segments; i++){
    ground[i]  = new Ground(width/segs*i, peakHeights[i], width/segs*(i+1), peakHeights[i+1]);
  }
  
   //Loop through array to create each object
  for (int i = 0; i < drops.length; i++) {

    drops[i] = new Rain(); // Create each object
    r1 = new Rain();
  }
  
  //Loop through array to create each snowflake
    for (int i = 0; i<flakes.length; i++) { 
    flakes[i] = new Snow(random(2, 10));
    flakes[i].spreadY(i);
  }
  
}


void draw()
{
  // Background
  noStroke();
  fill(0, 15);
  rect(0, 0, width, height);
 
 // story activated by mouse clicks
  if(count == 1) 
    { 
      println("in late spring, a seed falls from the sky and bounces along the ground");
      println ("the summer sun follows the seed until it stops");
      background(0);
      Sun();
    }
    else if(count == 2) 
    {
       println("a flock of boids soar with the autumn winds");
       background(0);
       flock.run(); 
    }
    else if(count == 3) 
    {
      println("the plant is dormant through the winter snowfall");
      background(0);
      for (int i = 0; i < flakes.length; i++) 
      {
        flakes[i] .display();
        if (flakes[i].x > 280 && flakes[i].y >445 && flakes[i].x<400)
           {flakes[i].bounce();}
      }
    } 
    else if(count == 4) 
    {
      println("spring rain fall as a new plant sprouts");
      //Loop through array to use objects.
      for (int i = 0; i < drops.length; i++) 
        {drops[i].fall();}
      Flower f = new Flower(flowerX,flowerY);
      f.sprout();
    }
   else if(count == 5) 
   {
     println("at last, the flower blooms");
     background(0); 
     Flower f = new Flower(flowerX,flowerY);
     f.grow();
   }
   
  // Move and display the orb
  orb.move();
  orb.display();
  // Check walls
  orb.checkWallCollision();
  // Check against all the ground segments
  for (int i=0; i<segments; i++)
  {
    orb.checkGroundCollision(ground[i]);
  }

  // Draw ground
  fill(127);
  beginShape();
  for (int i=0; i<segments; i++)
  {
    vertex(ground[i].x1, ground[i].y1);
    vertex(ground[i].x2, ground[i].y2);
  }
  vertex(ground[segments-1].x2, height);
  vertex(ground[0].x1, height);
  endShape(CLOSE); 
}

void mouseClicked() 
{
  // event counter
  count++;
  if (count > 6) {count = 0;}
}
