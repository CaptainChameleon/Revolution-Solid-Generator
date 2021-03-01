final int DRAW = 0;
final int VISUALIZE = 1;

color shapeColor = color(255, 255, 255);
//color shapeColor = color(255, 0, 0);
//color shapeColor = color(0, 255, 0);
//color shapeColor = color(0, 0, 255);

float zoom = 0.5;

int meridians = 16; 

Profile currentProfile = new Profile();
RevolutionSolid currentSolid;

int mode = DRAW;

void setup() {
  size(800, 800, P3D);
  stroke(shapeColor);
  strokeWeight(2);
}

void draw() {
  background(0);
  showInstructions();
  translate(width/2, height/2);
  switch (mode) {
  case DRAW:
    currentProfile.display();
    if (currentProfile.vertices.size() > 0) previsualizeNextLine();
    line(0, -height/2, 0, height);
    text((mouseX-width/2) + ", " + (-1*(mouseY - height/2)), mouseX + 10 - height/2, mouseY - height/2);      
    break;
  case VISUALIZE:
    pointLight(255, 255, 255, -width/2, -height/2, 0); 
    scale(zoom);
    pushMatrix();
    rotateX(0.03 * (mouseY - height/2));
    rotateY(0.03 * (mouseX - width/2));
    currentSolid.display();
    popMatrix();
    break;
  }
}

void previsualizeNextLine() {
  Vertex lastVertex = currentProfile.vertices.get(currentProfile.vertices.size() - 1);
  line(lastVertex.x, lastVertex.y, mouseX - width/2, mouseY -height/2);
}
