// Map class
class Map extends Dashboard
{
  int posX, posY, sizeX, sizeY;

  Map (int iposX, int iposY, int isizeX, int isizeY)
  {
    noStroke();
    this.posX = iposX;
    this.posY = iposY;
    this.sizeX = isizeX;
    this.sizeY = isizeY;
    
  }

  void init ()
  {
    plot.setPos(posX, posY);
    plot.setDim(sizeX, sizeY);
    //plot.setTitleText("Magnitude vs Number Earthquakes");
    plot.getXAxis().setAxisLabelText("Earthquakes");
    plot.getYAxis().setAxisLabelText("Magnitude");
    plot.setPoints(points);
  }

  void display ()
  {
    plot.beginDraw();
    //plot.drawBackground();
    //plot.drawBox();
    plot.drawXAxis();
    plot.drawYAxis();
    //plot.drawTitle();
    plot.drawLines();
    plot.drawGridLines(GPlot.BOTH);
    plot.drawPoints();
    plot.endDraw();
  }
}
