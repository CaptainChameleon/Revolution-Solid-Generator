void showInstructions() {
  switch (mode) {
  case DRAW:
    textSize(15);
    fill(shapeColor);
    text("Draw Mode", 10, 15);
    text("---------", 10, 30);
    text("Left Mouse -> Register vertex", 10, 45);
    text("Right Mouse -> Delete last vertex", 10, 60);
    text("Enter -> Generate solid", 10, 75);
    break;
  case VISUALIZE:
    textSize(15);
    fill(shapeColor);
    text("Visualization Mode", 10, 15);
    text("------------------", 10, 30);
    text("Enter -> Switch to Draw Mode", 10, 45);
    break;
  }
}

void mouseClicked() {
  if (mode == VISUALIZE) return;
  if (mouseButton == LEFT) {
    currentProfile.addVertex(mouseX-width/2,mouseY-height/2);
  } else if (mouseButton == RIGHT) {
    currentProfile.removeLastVertex();
  }
}

void mouseWheel(MouseEvent event) {
  if (mode == DRAW) return;
  zoom = zoom - ( 0.05 * event.getCount());
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
