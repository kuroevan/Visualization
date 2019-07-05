/**
 * Visualization of Information
 * Assignment 6 - Net Visualization
 * by Evangelos Giakoumakis & David Benepe
 **/
 
// Global variables
Table table;
String tablename = "earthquakes.csv";
int arrayLength = 212;
int circ = 60;
int count, timer, clicks;
int [] gapArray;
float[] latArray, lonArray, depthArray;
float[] magArray, dminArray, rmsArray;
String[] placeArray;
boolean chroma;

// init function
void setup()
{
  size(400,400);
  background(110);
  noStroke();
  
  surface.setTitle("Japan Seismic Activity");
  
  gapArray = new int[arrayLength];
  latArray = new float[arrayLength];
  lonArray = new float[arrayLength];
  depthArray = new float[arrayLength];
  magArray = new float[arrayLength];
  dminArray = new float[arrayLength];
  rmsArray = new float[arrayLength];
  placeArray = new String[arrayLength];

  table = loadTable(tablename, "header");
}

// main loop
void draw()
{  
  noStroke();
  fill(0);
  if (chroma == true) {
    fill(237, 41, 57);
  }
  ellipse(200, 200, circ, circ);
  
   if (millis() - timer >= 500) {
      drawBezierCurve(arrayLength, 255, 255, 255);
      //drawBezierCurve(arrayLength/2, 255);
      timer = millis();
      circ+=10;
      
      if (circ > 260) {
        circ-=10;
      }
      
   }
}

// mouse click listener
void mouseClicked() 
{
  clicks++;
  
  if(clicks == 1) {
  loadTable();
  chroma = true;
  }
  else
   //drawBezierCurve(arrayLength/2, 240);
   drawBezierCurve(arrayLength/6, 90, 90, 90);
}
