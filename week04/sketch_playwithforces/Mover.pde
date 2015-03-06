class Mover {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;
  color tint; 
  float xtime = 0.0;
  float ytime = 100.0;
  float incr = 0.01;


  // added color to Movers
  Mover(color t,float m, float x , float y) {
    tint = t; // added tint to display colors on the movers
    mass = m;
    location = new PVector(x,y);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
  }
  
  void applyForce(PVector force) {
    PVector f = PVector.div(force,mass);
    acceleration.add(f);
  }
  
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }

  void display() {
    stroke(0);
    strokeWeight(1);
    fill(tint);
    
    float noiseWidth = mass*16 + 200 * noise(xtime);
    float noiseHeight = mass*16 + 200 * noise(ytime);
  
    xtime+=incr;
    ytime+=incr;
  
    ellipse(location.x,location.y, mass*16, mass*16);

  }

  void checkEdges() {
// the term "width-mass*8" helps keep Movers inside the boundaries of canvas

    if (location.x > width-mass*8) {
      // when the Mover reach bottom of the frame, it needs to bounce, i.e. velocity reverses
      location.x = width-mass*8;
      velocity.x *= -1;
    } 
    else if (location.x < 0) {
      // when the Mover reach at the top in the frame, it needs to bounce, i.e. velocity reverses
      location.x = 0;
      velocity.x *= -1;
    }
    
   
    if (location.y > height - mass*8 ) {
      // when the Mover reach in the right of the frame
      velocity.y *= -1;
      location.y = height - mass*8;
    }
      else if (location.y <0 ){
      // when the Mover reach in the left of the frame
      velocity.y *= -1;
      location.y = 0;
      }
  }
}
