class Vertex {
  float x;
  float y;
  float z;
  
  Vertex(float x, float y) {
    this.x = x;
    this.y = y;
    z = 0;
  }
  
  Vertex(float x, float y, float z) {
    this.x = x;
    this.y = y;
    this.z = z;
  }
}

class Profile {
  ArrayList<Vertex> vertices = new ArrayList<Vertex>();
  PShape currentShape;
  boolean shapeChanged;
  
  void addVertex(float x, float y) {
    vertices.add(new Vertex(x, y));
    shapeChanged = true;
  }
  
  void removeLastVertex() {
    if(vertices.size() > 1) {
      vertices.remove(vertices.size() - 1);
      shapeChanged = true;
    }
  }
  
  private void buildShape() {
    currentShape = createShape();
    //currentShape.setStroke(shapeColor);
    currentShape.beginShape();
    currentShape.noFill();
    for(Vertex vertex : vertices){
      currentShape.vertex(vertex.x, vertex.y);
    }
    currentShape.endShape();
    //currentShape.setFill(shapeColor);
  }
  
  void display() {
    if (vertices.size() == 2) {
      Vertex vertex1 = vertices.get(0);
      Vertex vertex2 = vertices.get(1);
      line(vertex1.x, vertex1.y, vertex2.x, vertex2.y);
      return;
    }
    if (currentShape == null || shapeChanged) {
      buildShape();
      shapeChanged = false;
    }
    shape(currentShape);
  }
}

class RevolutionSolid {  
  PShape solidShape;
  
  RevolutionSolid(Profile profile) {
    solidShape = createShape();
    solidShape.beginShape(TRIANGLE_STRIP);
    //solidShape.noFill();      
    
    /*
    for(int i = 0; i < profile.vertices.size(); i++) {
       Vertex vertex1 = profile.vertices.get(i);
       Vertex vertex2;
       if (i+1 == profile.vertices.size()) {
          vertex2 = profile.vertices.get(0);
       } else {
         vertex2 = profile.vertices.get(i+1);
       }
       for(int j = 1; j < meridians + 1; j++) {
         float rotationAngle = radians(360/meridians*j);
         solidShape.vertex((vertex1.x - width/2) * cos(rotationAngle), vertex1.y, (vertex1.x - width/2) * sin(rotationAngle));
         solidShape.vertex((vertex2.x - width/2) * cos(rotationAngle), vertex2.y, (vertex2.x - width/2) * sin(rotationAngle));
       }
    }
    */
    
    for(int i = 0; i < profile.vertices.size(); i++) {
       Vertex vertex = profile.vertices.get(i);
       for(int j = 0; j <= meridians; j++) {
         float rotationAngle = radians(ceil(360/meridians)*j);
         solidShape.vertex((vertex.x - width/2) * cos(rotationAngle), vertex.y, (vertex.x - width/2) * sin(rotationAngle));
       }
    }
    
    solidShape.endShape(CLOSE);
  }
  
  void display(){
    shape(solidShape);
  }
}
