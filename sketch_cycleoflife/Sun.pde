// class creating sun

void Sun() {
  
  deg += 10;
  imageMode(CENTER);
  pushMatrix();
  translate(flowerX, height/4);
  rotate(deg);
  image(sun, 0, 0);
  popMatrix();
  
}
