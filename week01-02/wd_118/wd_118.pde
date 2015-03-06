int x_list[]=new int[50];
int y_list[]=new int[50];

void setup() {
  size(600,600);
  frameRate(1.5);
}

void draw() {
  background(100);
  stroke(255);
  fill(128);
  beginShape();
  for (int i = 0; i < 50; i++) {
  float rx = random(600);
  float ry = random(600);
  vertex(rx, ry);
  }
  endShape(CLOSE);
}
