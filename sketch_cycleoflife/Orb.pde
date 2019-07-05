// class to generate seed
// original code by: Ira Greenberg

class Orb {
  // Orb has position and velocity

  Orb(float x, float y, float r_) {
    position = new PVector(x, y);
    velocity = new PVector(.5, 0);
    r = r_;
  }

  void move() {
    // Move orb
    velocity.add(gravity);
    position.add(velocity);
  }

  void display() {
    // Draw orb
    noStroke();
    fill(200);
    ellipse(position.x, position.y, r*2, r*2);
  }
  
  // Check boundaries of window
  void checkWallCollision() {
    if (position.x > width-r) {
      position.x = width-r;
      velocity.x *= -damping;
    } 
    else if (position.x < r) {
      position.x = r;
      velocity.x *= -damping;
    }
  }

  void checkGroundCollision(Ground groundSegment) {

    // Get difference between orb and ground
    float deltaX = position.x - groundSegment.x;
    float deltaY = position.y - groundSegment.y;

    // Precalculate trig values
    float cosine = cos(groundSegment.rot);
    float sine = sin(groundSegment.rot);

    /* Rotate ground and velocity to allow 
     orthogonal collision calculations */
    float groundXTemp = cosine * deltaX + sine * deltaY;
    float groundYTemp = cosine * deltaY - sine * deltaX;
    float velocityXTemp = cosine * velocity.x + sine * velocity.y;
    float velocityYTemp = cosine * velocity.y - sine * velocity.x;

    /* Ground collision - check for surface 
     collision and also that orb is within 
     left/rights bounds of ground segment */
    if (groundYTemp > -r &&
      position.x > groundSegment.x1 &&
      position.x < groundSegment.x2 ) {
      // keep orb from going into ground
      groundYTemp = -r;
      // bounce and slow down orb
      velocityYTemp *= -1.0;
      velocityYTemp *= damping;
    }

    // Reset ground, velocity and orb
    deltaX = cosine * groundXTemp - sine * groundYTemp;
    deltaY = cosine * groundYTemp + sine * groundXTemp;
    velocity.x = cosine * velocityXTemp - sine * velocityYTemp;
    velocity.y = cosine * velocityYTemp + sine * velocityXTemp;
    position.x = groundSegment.x + deltaX;
    position.y = groundSegment.y + deltaY;
    
    if ((abs(x1-position.x) < .001)&(abs(y1-position.y) < .001)) {flowerX = position.x; flowerY = position.y;}
    else {x1=position.x;y1=position.y;}
 
  }

}