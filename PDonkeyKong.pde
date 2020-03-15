/*  
 PDonkey Kong v0.1  --  07/03/2014
 Developer: Luis Antonio Mendoza Marriaga @lmendoza92
 Sprites resource : http://www.spriters-resource.com/
 scaled images 220%
 */

private PImage bg, bgInicio;
private Mario mario;
private final int stateGame = 0;
private final int statePause = 1;
private final int stateOpening = 2;
private int state = stateGame;

void setup () {
  size(537, 614);

  bg       = loadImage("images/bgLevel1.png");
  bgInicio = loadImage("images/bgInicio.png");
  mario = new Mario(10, 530, "images/marioSprite.png", "images/marioSpriteStairs.png");
  
  frameRate(60);
}

void draw () {
  switch(state){
    case stateOpening:
      background(bgInicio);
      
    break;
    case stateGame:
      background(bg);
      image(mario.getSprite(), mario.getX(), mario.getY());
    break;
  }
}

void keyPressed() {
  switch(keyCode){
    case LEFT:
      mario.setMoveLeft(true);
      break;
    case RIGHT:
      mario.setMoveRight(true);
      break;
    case UP:
      mario.setMoveUp(true);
      break;  
    case DOWN:
      mario.setMoveDown(true);
      break;
  }
}

void keyReleased() {
  switch(keyCode){
    case LEFT:
      mario.setMoveLeft(false);
      break;
    case RIGHT:
      mario.setMoveRight(false);
      break;
    case UP:
      mario.setMoveUp(false);
      break;  
    case DOWN:
      mario.setMoveDown(false);
      break;
  }
}
