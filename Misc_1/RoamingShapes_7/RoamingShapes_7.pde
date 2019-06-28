/*
 * By default, Camera3D's stereoscopic generators use asymmetric
 * frustums. As I understand it, this is the 'correct' way to
 * render stereoscopy. If for some reason you want to turn it
 * off, you can use the useSymmetricFrustum() method.
 * 
 * To learn more about what this is, read this:
 *
 * http://paulbourke.net/stereographics/stereorender/
 * 
 * or uncomment the useSymmetricFrustum() line below and see what
 * changes.
 */
 
 ///modified by Adrion T. Kelley
 ///Squares eat spheres and grow in size then split into new smaller squares.
 ///Squares that don't eat have grey stroke and don't grow then disappear.


import java.util.List;
import peasy.*;

PeasyCam cam;





List<Shape1>shapeArray1=new ArrayList();
List<Shape2>shapeArray2=new ArrayList();

int xMin;
int xMax;
int yMin;
int yMax;
int zMin;
int zMax;
int zMaxShape;


final float velSizeT=55;
final float maxLifeT = 300;
final float lifeT = 0.25;
final float foodRegardT = 80;
final int mutationT = 30;
final int startingCellsT = 200;




void setup() {
  size(1000, 1000, P3D);
  frameRate(12);
  colorMode(HSB, 360, 100, 100);
cam = new PeasyCam(this, 100);
  cam.setMinimumDistance(50);
  cam.setMaximumDistance(5000);
  
  

  // initialize variables.
  int offset = 0;
  xMin = -width / 2 + offset;
  xMax = width / 2 - offset;
  yMin = -height / 2 + offset;
  yMax = height / 2 - offset;
  zMin = -400;
  zMaxShape = -50;
  zMax = -25;

  

  
  for (int i=0; i<10; i++) {
    shapeArray1.add(new Shape1(new PVector(random(xMin, xMax), random(yMin, yMax),
        random(zMin, zMax)), random(40, 60), random(200,300), 100, color(random(255), random(255), random(255)),0));
  }
  
  
  
  for (int i=0; i<150; i++) {
    shapeArray2.add(new Shape2(new PVector(random(xMin, xMax), random(yMin, yMax),
        random(zMin, zMax)), color(random(360), 25, 100)));
  }
  
  
 }
  
  void draw() {
  background(0);
  //rotateX(-.5);
  //rotateY(-.5);
  //cam.beginHUD();
  lights();
  translate(width / 2, height / 2);
  
  
  for (int i=0; i<shapeArray2.size(); i++) {
    shapeArray2.get(i).display();
  }
  
  for (int i=0; i<shapeArray1.size(); i++) {
    shapeArray1.get(i).display();
    shapeArray1.get(i).searchFood();
    shapeArray1.get(i).eat();
    if (shapeArray1.get(i).life<0)shapeArray1.remove(i);
  }
  
  
  if((millis()%int(3+abs(4*sin(0.00001*millis()))))==0)shapeArray2.add( new Shape2(new PVector(random(xMin, xMax), random(yMin, yMax),
        random(zMin, zMax)), color(random(360), 25, 100)));
  
  
 //cam.endHUD();
  
}