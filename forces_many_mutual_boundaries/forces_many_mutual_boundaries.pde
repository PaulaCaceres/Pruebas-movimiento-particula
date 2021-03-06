// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

Mover[] movers = new Mover[100];

float g = 0.4;

void setup() {
  size(1280,720);
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(random(1,2),random(width),random(height)); 
  }
}

void draw() {
  background(0);




  for (int i = 0; i < movers.length; i++) {
    for (int j = 0; j < movers.length; j++) {
      if (i != j) {
        PVector force = movers[j].attract(movers[i]);
        movers[i].applyForce(force);
      }
    }
   
    movers[i].boundaries();
    movers[i].update();
    movers[i].display();
  }

}