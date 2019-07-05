// Library imports
import grafica.*;
  
// Global variables

// array declarations
  Table table;
  int [] gapArray;
  float[] latArray, lonArray, depthArray;
  float[] magArray, dminArray, rmsArray;
  String[] placeArray;
  int[] angles = { 210, 150 };
// static declarations
  int arrayLength = 212;
  int space = 10;
  int count;
  int rad1 = 15; 
  int rad2 = 6;
  color back = color(20, 20, 20);
  color fore = color(45, 45, 45);
  color c1 = color(207, 31, 47);
  color c2 = color(20, 138, 20);
  color c3 = color(250, 140, 0);
  color c4 = color(75, 0, 130);
// object declarations
  Dashboard dash;
  Dial dialA, dialB;
  Bar barA, barB, barC;
  Map mapA;
  Map_GPS gpsmap;
  PieChart pchart;
  ReadTable rdTbl;
  Arrow arrow;
  GPlot plot;
// various declarations
  PImage img;
  int i = 0;
  Boolean pieFlag = true;
  PFont f, ft;
  GPointsArray points;

void setup ()
{
  
  size (1110, 825);
  
  Initialize();

}

void draw()
{
  
  dash.layout(5); 
  
  dash.show();

  dash.PrintTxt();

  dash.Increment();
  
}
