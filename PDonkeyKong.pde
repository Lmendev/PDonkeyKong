/*  
 PDonkey Kong v0.1  --  07/03/2014
 Developer: Luis Antonio Mendoza Marriaga @lmendoza92
 Sprites resource : http://www.spriters-resource.com/
 scaled images 220%
 */

private PImage bg;
private Mario mario;


void setup () {
  size(537, 614);

  bg = loadImage("images/bgLevel1.png");
  mario = new Mario(10, 530, "images/marioSprite.png");
  
  frameRate(60);
}

void draw () {
  background(bg);
  
  image(mario.getSprite(), mario.getX(), mario.getY());
}

void keyPressed() {
  if (keyCode == LEFT)
    mario.setMoveLeft(true);
   
  if (keyCode == RIGHT)
    mario.setMoveRight(true); 
}

void keyReleased() {
  if (keyCode == LEFT)
    mario.setMoveLeft(false);
   
  if (keyCode == RIGHT)
    mario.setMoveRight(false);
}
