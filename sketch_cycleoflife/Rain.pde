//  class generating rain

class Rain {
  float r = random(600);
  float y = random(-height);

  void fall() {
    y = y + 7;
    fill(250,180);
    ellipse(r, y, 5, 5);

   if(y>height){
   r = random(600);
   y = random(-200);
     }

  }
}
