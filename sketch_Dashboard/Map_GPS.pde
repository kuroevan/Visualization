// GPS Map class
class Map_GPS extends Dashboard
{
  int x, y;
  int xwidth = 649;
  int yheight = 391;
  int mv = 14;
  
  Map_GPS(int inx, int iny)
  {
    x = inx;
    y = iny;
  }
  
  void display(float lon, float lat)
  {
    
  float lonDist = width/36;               // every 10º - divide by 36 not 360
  float latDist = height/18;              // every 10º from 180
  stroke(100);
  strokeWeight(1);
  for (int i=0; i<xwidth; i+=lonDist) {    // draw vertical lines
    if(i == 0) {
      stroke(45);
      line(i+mv,0+mv, i+mv,yheight+mv);
    }
    else
      stroke(100);
      line(i+mv,0+mv, i+mv,yheight+mv);
  }
  for (int i=0; i<yheight; i+=latDist) {   // draw horizontal lines 
     if(i == 0) {
      stroke(45);
      line(0+mv,i+mv, xwidth+mv,i+mv);
    }
    else
      stroke(100);
      line(0+mv,i+mv, xwidth+mv,i+mv);
  }
  

  // convert from lat/lon to screen coordinates
  lat = map(lat, 90.0, -90.0, 0+mv, yheight+mv);
  lon = map(lon, -180.0, 180.0, 0+mv, xwidth+mv);
  fill(255, 0, 0, 150); // semi-transparent fill
  noStroke();
  ellipse(lon, lat, rad1, rad1);
  fill(255, 0, 0, 200); // semi-transparent fill
  noStroke();
  ellipse(lon, lat, rad2, rad2);

  }
  
}
