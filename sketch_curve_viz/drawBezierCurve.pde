// draw bezier curve class
void drawBezierCurve(int total, int r, int g, int b) {
  
  int i;
  
  noFill();
  smooth();
  strokeWeight(1);
  stroke(r, g, b);
  
  for (i = 0; i < total; i++) {
    bezier(
      magArray[i]+ random(height), gapArray[i]+ random(height), 
      dminArray[i]+ random(height), rmsArray[i]+ random(height), 
      depthArray[i]+ random(height), gapArray[i]+ random(height), 
      magArray[i]+ random(height), latArray[i]+ random(height)
      );
  }
  
}
