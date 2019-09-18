import peasy.*;


float x = 5;
float y = 5;
float z = 5;

float a = 10;
float b = 50;
float c = 4;

ArrayList<PVector> points = new ArrayList<PVector>();

PeasyCam cam;

void setup() {
  size(800, 600, P3D);
  background(0);
  colorMode(HSB);
  cam = new PeasyCam(this, 500);
}
void draw() {
  background(0);
  float dt = 0.01;
  float dx = (a * (y - x)) * dt;
  float dy = (x * (b - z) - y) * dt;
  float dz = (x * y - (c * z)) * dt;

  x = x + dx;
  y = y + dy;
  z = z + dz;
  points.add(new PVector(x, y, z));

  translate(0, 0, -80);
  stroke(255);
  noFill();
  scale(5);
  float hu = 0;
  beginShape();
  for (PVector v : points) {
    stroke(hu, 255, 255);
    vertex(v.x, v.y, v.z);
    hu += 0.1;
    if (hu > 255) {
      hu = 0;
    }
  }
  endShape();
}
