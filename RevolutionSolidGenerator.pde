final int DRAW = 0;
final int VISUALIZE = 1;

color shapeColor = color(255, 255, 255);
//color shapeColor = color(255, 0, 0);
//color shapeColor = color(0, 255, 0);
//color shapeColor = color(0, 0, 255);

int meridianNum = 16; 

Profile currentProfile = new Profile();
RevolutionSolid currentSolid;

int mode = DRAW;

void setup() {
  size(800,800,P3D);
  stroke(shapeColor);
  strokeWeight(2);
}

void draw() {
  background(0);
  line(width/2, 0, width/2, height);
  switch (mode) {
    case DRAW:
      showDrawInstructions();
      text(mouseX + ", " + mouseY, mouseX+10, mouseY);
      currentProfile.display();
      if (currentProfile.vertices.size() > 0) previsualizeNextLine();
      break;
    case VISUALIZE:
      showVisualizationInstructions();
      translate(width/2, mouseY/2);
      currentSolid.display();
      break;
  }
}

void previsualizeNextLine() {
  Vertex lastVertex = currentProfile.vertices.get(currentProfile.vertices.size() - 1);
  line(lastVertex.x, lastVertex.y, mouseX, mouseY);
}
