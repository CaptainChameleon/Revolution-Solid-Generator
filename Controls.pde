void showDrawInstructions() {
  textSize(15);
  fill(shapeColor);
  text("Draw Mode", 10, 15);
  text("---------", 10, 30);
  text("Left Mouse -> Register vertex", 10, 45);
  text("Right Mouse -> Delete last vertex", 10, 60);
  text("Enter -> Generate solid", 10, 75);
}

void showVisualizationInstructions() {
  textSize(15);
  fill(shapeColor);
  text("Visualization Mode", 10, 15);
  text("------------------", 10, 30);
  text("Enter -> Switch to Draw Mode", 10, 45);
}

void mouseClicked() {
  if (mode == VISUALIZE) return;
  if (mouseButton == LEFT) {
    currentProfile.addVertex(mouseX,mouseY);
  } else if (mouseButton == RIGHT) {
    currentProfile.removeLastVertex();
  }
}
      
void keyPressed() {
  if (key == ENTER) {
    switch (mode) {
    case DRAW:
      mode = VISUALIZE;
      currentSolid = new RevolutionSolid(currentProfile);
      break;
    case VISUALIZE:
      mode = DRAW;
      currentProfile = new Profile();
      break;
  }
  }
}
