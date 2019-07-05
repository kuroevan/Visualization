package carsketch;

import processing.core.*;

public class CarSketch extends PApplet {

/* 
  Visualization of Information
   Assignment 10 - 3D Java Viz
     by Evan Giakoumakis     
*/
	
// declarations	
PShape mini, alfa;
PFont carfont;
PImage mini_logo, alfa_logo, platform;
boolean isAlfa;
int count, count2;
String str_mini = "MINI Cooper S";
String str_alfa = "Alfa Romeo 147";

public void setup() {
	  // init
	  size(720, 450, P3D);
	  carfont = createFont("SansSerif", 26);
	  mini_logo = loadImage("mini_cooper_logo2.png");
	  alfa_logo = loadImage("alfa-romeo-logo2.png");
	  platform = loadImage("platform.png");
	  mini = loadShape("minicooper.obj");
	  mini.setFill(color(120, 120, 120, 255));
	  alfa = loadShape("alfaromeo.obj");
	  alfa.setFill(color(120, 120, 120, 255));
	  isAlfa = false;
}

public void draw() {
  background(platform);

  lightControl();
  
  fill(40);
  
  if (isAlfa == true) {
    objectShow(alfa);
    infoShow(isAlfa);
  }
  else {
    objectShow(mini);
    infoShow(isAlfa);
  }
}

public void keyPressed() {
  if (key == 'z') {
    mini.rotateZ(.2f);
    alfa.rotateZ(.2f);
  } 
  else if (key == 'y') {
    mini.rotateY(.2f);
    alfa.rotateY(.2f);
  }  
  else if (key == 'x') {
    mini.rotateX(.2f);
    alfa.rotateX(.2f);
  }
  else if (key == 'r') {
    mini.setFill(color(220, 20, 60, 230));
    alfa.setFill(color(220, 20, 60, 230));
  }
  else if (key == 'b') {
    mini.setFill(color(20, 90, 177, 230));
    alfa.setFill(color(20, 90, 177, 230));
  }
  else if (key == 'g') {
    mini.setFill(color(34 ,139 ,34, 230));
    alfa.setFill(color(34 ,139 ,34, 230));
  }
  else if (key == 'p') {
    mini.setFill(color(147, 112, 219, 100));
    alfa.setFill(color(147, 112, 219, 100));
  }
  else if (key == 'n') {
	    mini.setFill(color(120, 120, 120, 255));
	    alfa.setFill(color(120, 120, 120, 255));
	  }
  else if (key == 'k') {
	    mini.setFill(color(1, 1, 1, 200));
	    alfa.setFill(color(1, 1, 1, 200));
  }
  else if (key == 'l') {
    count2++;
  }
}

public void mouseClicked() {
  count++;
  
  if (count % 2 == 0) {
    isAlfa = true;
  }
  else
    isAlfa = false;
}

public void lightControl() {
  // light control 
  if (count2 % 2 == 0) {
  lightFalloff(1, 0, 0);
  lightSpecular(0, 0, 0);
  ambientLight(128, 128, 128);
  directionalLight(128, 128, 128, 0, 0, -1);
  camera(0, 500, (height/2 * .86602f), 0, 0, 0, 0, 1, 0);
  }
  else {
    // pearl light effect
    pointLight(255, 0, 0, mouseX, mouseY, 64);
    pointLight(0, 0, 255, width - mouseX, height - mouseY, 64);
  }
}

public void objectShow(PShape ps) {
 
  shape(ps, 0, 210);
  //mini.rotateX(.01);
  //mini.rotateY(.001);
  ps.rotateZ(.005f);
  
}

void infoShow(boolean bo) {
 // show car name and logo
 if (bo == true) {
   text(str_alfa, 180, 230, 170, 180);
   image(alfa_logo, 198, 160);
 }
 else {
   text(str_mini, 180, 230, 170, 180);
   image(mini_logo, 185, 190);
 }
  
}

public void settings() {
	size(720, 450, P3D);
}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		PApplet.main(new String[] {"carsketch.CarSketch"} );
	}

}
