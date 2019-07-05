// draw vertex curve class
void drawBezierCurve(int total, int c) {
 
  int i;
  
  noFill();
  smooth();
  strokeWeight(1);
  stroke(c);
  
    for (i = 0; i < total; i++) {
      beginShape();
      curveVertex(magArray[i], lonArray[i]); // the first control point
      curveVertex(magArray[i], lonArray[i]); // is also the start point of curve
      curveVertex(gapArray[i], random(height));
      curveVertex(dminArray[i], random(height));
      curveVertex(depthArray[i], random(height));
      curveVertex(latArray[i]*2+2*i, random(height)); // the last point of curve
      curveVertex(latArray[i]*2+2*i, random(height)); // is also the last control point
      endShape();
  }
  
}
