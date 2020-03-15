public class Mario {

  private float x, y, speedX, speedY;
  private int statusi, statusj;
  private int wait = 0;
  private boolean moveLeft, moveRight, moveUp, moveDown;
  private final int stateGame = 0;
  private int actualDirection;
  private final int leftDirection = 0, rightDirection = 1, upDirection = 2, downDirection = 3;
  private boolean alive;
  private PImage sprite[][]= new PImage[3][3];
  private String direction = "Right";
  private PImage actualSprite;


  public Mario (float x, float y, String url, String urlStairs) {
    this.x = x;
    this.y = y;
    this.alive = true;
    this.moveLeft = false;
    this.moveRight = false;
    this.statusj = 0;
    this.statusi = 0;
    this.speedX = 0;
    this.speedY = 0;

    PImage tmp = loadImage(url);
    PImage tmpStairs = loadImage(urlStairs);

    this.sprite[0][0] = tmp.get(0, 0, 57, 66);
    this.sprite[0][1] = tmp.get(55, 0, 57, 66);
    this.sprite[0][2] = tmp.get(110, 0, 57, 66);
    this.sprite[1][0] = tmp.get(0, 64, 57, 66);
    this.sprite[1][1] = tmp.get(55, 64, 57, 66);
    this.sprite[1][2] = tmp.get(110, 64, 57, 66);
    
    this.sprite[2][0] = tmpStairs.get(0, 0, 57, 66);
    this.sprite[2][1] = tmpStairs.get(55, 0, 57, 66);
    
    this.actualSprite = this.sprite[0][0];
    this.actualDirection = this.rightDirection;
  }
  
  public PImage getSprite () {
    
    this.speedX = 0;
    if (this.moveLeft) this.speedX = -2; //<>//
    if (this.moveRight) this.speedX = 2;
    if((this.moveLeft && (this.moveRight || this.moveUp || this.moveDown)) || (this.moveRight && (this.moveLeft || this.moveUp || this.moveDown))) speedX = 0;
    
    this.speedY = 0;
    if(this.moveUp) this.speedY = -2;
    if(this.moveDown) this.speedY = 2;
    if((this.moveUp && (this.moveRight || this.moveLeft || this.moveDown)) || (this.moveDown && (this.moveLeft || this.moveUp || this.moveRight))) speedY = 0;
    
    this.x += this.speedX;
    this.y += this.speedY;
    
    //Actualizar direccion actual
    if (this.speedX > 0)
      this.actualDirection = rightDirection;
    
    if (this.speedX < 0)
      this.actualDirection = leftDirection;
    
    if (this.speedY > 0)
      this.actualDirection = upDirection;
    
    if (this.speedY < 0)
      this.actualDirection = downDirection;

    if (speedX != 0) {
      if (wait>=5) {
        statusj++;
        wait =0;
      }
      else
        wait++;
    }
    
    if (speedY != 0) {
      if (wait>=5) {
        statusi++;
        wait =0;
      }
      else
        wait++;
    }
    
    if (statusj == 3)
      statusj = 0;
      
    if (statusi == 2)
      statusi = 0;
      
    if(this.speedX != 0 || this.speedY != 0){
      if (this.moveLeft){
        this.actualSprite = this.sprite[this.leftDirection][statusj];
      }
      
      if (this.moveRight){
        this.actualSprite = this.sprite[this.rightDirection][statusj];
      }
      
      if (this.moveUp){
        this.actualSprite = this.sprite[this.upDirection][statusi];
      }
      
      if (this.moveDown){
        this.actualSprite = this.sprite[this.upDirection][statusi];
      }
    }


    if(this.speedX == 0 && this.speedY == 0) {
      if (this.actualDirection == leftDirection || this.actualDirection == rightDirection) {
          this.actualSprite = this.sprite[this.actualDirection][0];
      }
    }
    
    return this.actualSprite;
  }
  
  //Gets, Sets

  public float getX () {
    return this.x;
  }

  public float getY () {
    return this.y;
  } //<>//

  public void setMoveLeft(boolean moveLeft) {
    this.moveLeft = moveLeft;
  }

  public void setMoveRight(boolean moveRight) {
    this.moveRight = moveRight;
  }
  
  public void setMoveUp(boolean moveUp) {
    this.moveUp = moveUp;
  }
  
  public void setMoveDown(boolean moveDown) {
    this.moveDown = moveDown;
  }
}
