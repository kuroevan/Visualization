// Bar class
class Bar extends Dashboard
{
  int size;
  int posX, posY;
  PFont f;
  int [] scale;
  String label;

  Bar (int iposX, int iposY, int iSize, int rangeLow, int rangeHigh, String ilabel)
  {
    size = iSize;
    posX = iposX;
    posY = iposY;
    label = ilabel;
    scale = new int [11];
    for (int i = 0 ; i <=10 ; i ++)
      scale[i] = rangeLow + (rangeHigh - rangeLow) * i / 10;
    f = createFont("Arial", iSize/20);
    textFont(f);
    textAlign(CENTER, CENTER);
  }

  void display (int iheight, color c)
  {
    float barHeight = map (iheight, 0, 255, 0, size);
    strokeWeight (2);
    fill (150, 150, 150);
    stroke (0);
    rect (posX, posY, size/10.0, size*1.01);
    noStroke ();
    fill (c);
    rect (posX + size/100, posY + (size - barHeight), size/12.4, barHeight);
    fill(250, 250, 250);
    text(label, posX + size/20, posY + size*1.08);
    for (int i = 0 ; i <=10 ; i ++)
    {
      fill(100, 100, 100, 200);
      text(scale[i], posX - size/15, posY + size - size*i/10.4);
      stroke (0);
      strokeWeight (1);
      line(posX - size/50, posY + size - size*i/10.5, posX, posY + size - size*i/10.5);
    }

  }
  
    void textdisp () {
    println("Inside Bar Gauge class");
  }
  
}
