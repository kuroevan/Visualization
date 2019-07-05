// Dashboard super class
class Dashboard {
  
  int x, y, n;
  
  Dashboard() {
  }
  
  Dashboard(int dwidth, int dheight, int n) {
    this.x = dwidth;
    this.y = dheight;
    this.n = n;
  }
  
  void layout(int n) {
    
    // draw dash background
    background(back);
    fill(255, 0, 0);
    noStroke();
    // design layout
    fill(fore);
    
    switch(n) {
    case 1:
      rect(0+space, 0+space, 658, 410, 7);
      break;
    case 2:
      rect(0+space, 0+space, 658, 410, 7);
      rect(670+space, 0+space, 420, 410, 7);
      break;
    case 3:
      rect(0+space, 0+space, 658, 410, 7);
      rect(670+space, 0+space, 420, 410, 7);
      rect(0+space, 420+space, 658, 340, 7);
      break;
    case 4:
      rect(0+space, 0+space, 658, 410, 7);
      rect(670+space, 0+space, 420, 410, 7);
      rect(0+space, 420+space, 658, 340, 7);
      rect(670+space, 420+space, 420, 340, 7);
      break;
    case 5:
      rect(0+space, 0+space, 658, 410, 7);
      rect(670+space, 0+space, 420, 410, 7);
      rect(0+space, 420+space, 658, 340, 7);
      rect(670+space, 420+space, 420, 340, 7);
      rect(0+space, 780, width-2*space, 35, 7);
      image(img, 1+space, 1+space);
      
      if (pieFlag == false) {
        fill(150, 150, 150);
        rect(695, 450, 390, 300, 7);
      }
      break;
    default:
      println("Number of objects not supported!");
      break;
    }
  }
  
  void show() {
   
    // display dash objects 
    dialA.display(gapArray[i]);
    dialB.display (dminArray[i]*60);
    barA.display ((int) magArray[i]*22, c1);
    barB.display ((int) depthArray[i], c2);
    gpsmap.display(lonArray[i], latArray[i]);
    if (pieFlag == true) {
      pchart.display(230, angles, true);
    }
    else
      mapA.display();

  }
  
  void Dial(int iSize, int iPosX, int iPosY, int rangeLow, int rangeHigh, String iFace) {
    
  }
  
  void Bar(int iposX, int iposY, int iSize, int rangeLow, int rangeHigh, String ilabel) {
    
  }
  
  void Map(int iposX, int iposY, int isizeX, int isizeY) {
    
  }
 
  void Map_GPS(int inx, int iny) {
    
  }
  
  void PieChart(int inx, int iny) {
    
  }
  
  void Arrow() {
    
  }
 
  void PrintTxt() {
    
    // print text
    fill(250, 250, 250);
    text("Location: " + placeArray[i], width/2, 795);
    // create arrow
    stroke(180, 180, 180);
    strokeWeight(10);
    arrow.draw(1005, 797, 1070, 797, 0, 7, true);
    noStroke();
    
  }
  
  void Increment() {
    
      if(mousePressed){
    if(mouseX>970 && mouseX <1090 && mouseY>795 && mouseY <807) {
       i++;
       angles[0] = (int) random(10,250);
       angles[1] = 360 - angles[0];
       rad1 = (int) magArray[i]*4;
       rad2 = (int) magArray[i]*2;
       if(i >= arrayLength) {
         i = 0;
       }
        // print out interesting variables
       println("Location: " + placeArray[i] + " Magnitude: " + magArray[i] + " Duration: " + dminArray[i] + " mins");
    }
   }
   
   if(mouseX>970 && mouseX <1090 && mouseY>795 && mouseY <807) {
          stroke(36, 119, 187);
          strokeWeight(10);
          arrow.draw(1005, 797, 1070, 797, 0, 7, true);
          noStroke();
  }
    
  }
  
}
