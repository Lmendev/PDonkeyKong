/*  
    PDonkey Kong v0.1  --  07/03/2014
    Developer: Luis Antonio Mendoza Marriaga @lmendoza92
    Sprites resource : http://www.spriters-resource.com/
    scaled images 220%
*/

 PImage img;

void setup (){
  size(537, 614);
   
  img = loadImage("images/bgLevel1.png");
}

void draw (){
  background(img);
}
