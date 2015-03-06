Mover[] movers = new Mover[7];
// an array of Movers
int direction=1;

void setup() {
  size(1000, 500);
  randomSeed(1);
  smooth();
  for (int i = 0; i < movers.length; i++) {
    // I have used HSB mode to have similar colored balls with same saturation and brightness
    colorMode(HSB, 100);
    color tint=color(random(50, 100),55,100);
    movers[i] = new Mover(tint,random(1, 4), random(width), 0);
  }
}

void draw() {
  background(color(15));
  // used the closer to black as background
  // Now, the following if else changes how Movers show up when key is pressed and not pressed 
  if(!keyPressed)
  {
    for (int i = 0; i < movers.length; i++) {
    PVector wind = new PVector(0.01, 0);
    PVector gravity ;
    if (direction==1){
      // when direction is 1 the gravity is downward
      gravity = new PVector(0, 0.1*movers[i].mass);
    }
    else{
      // when direction is -1 the gravity is upward, makes it topsy-turvy
      gravity = new PVector(0, -0.1*movers[i].mass);
    }
    float c = 0.05;
    PVector friction = movers[i].velocity.get();
    friction.mult(-1); 
    friction.normalize();
    friction.mult(c);
    
    movers[i].applyForce(friction);
    movers[i].applyForce(wind);
    movers[i].applyForce(gravity);

    movers[i].update();
    movers[i].display();
    movers[i].checkEdges();
  }
  }
  else
  {
    // when a key is pressed the movers are paused.
    for (int i = 0; i < movers.length; i++) 
      movers[i].display();
  }
  
}
// This is to toggle the direction of gravity right when key is released
void keyReleased()
   {    // when direction = 0 the statement below changes it to 1 and
        // when direction = 1 the statement below changes it to 0
       direction= 1-direction;
   }
  
