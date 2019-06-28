 class Shape2 {
  PVector pos;
  
  
  color myColor;
 
 
 Shape2(PVector _pos,  color _myColor) {
    pos = _pos;
    
    myColor = _myColor;
  }
  
  void display() {
    pushMatrix();
    translate(pos.x, pos.y, pos.z);
    noStroke();
    fill(myColor);
    sphere(5);
    popMatrix();
  }
  
  
  
  
 }
 