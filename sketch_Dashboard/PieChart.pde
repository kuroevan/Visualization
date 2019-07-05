// Pie Chart class
class PieChart extends Dashboard
{
  int x, y;
  int xwidth = 649;
  int yheight = 390;
  
  PieChart(int inx, int iny)
  {
    x = inx;
    y = iny;
  }
  
  void display(float diameter, int[] data, boolean bool)
  {
    float lastAngle = 0;
    stroke(0);
    for (int i = 0; i < data.length; i++) {
      if (i == 1) {
        fill(c3);
      }
      else
        fill(c4);

      arc(x, y, diameter, diameter, lastAngle, lastAngle+radians(data[i]));
      lastAngle += radians(data[i]);
      
      if(bool) {
        fill(45, 45, 45);
        ellipse(x, y, 150, 150);
      }
    }
    
    fill(c3);
    rect(x+130, y-140, 10, 10);
    fill(250);
    text("Day", x+165, y-138);
    
    fill(c4);
    rect(x+130, y-110, 10, 10);
    fill(250);
    text("Night", x+170, y-108);

  }
  
}
