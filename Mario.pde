public class Mario {

  private int x;
  private int y;
  private int statusj;
  private int statusi;
  private int wait = 0;
  private boolean moveLeft;
  private boolean moveRight;
  private boolean alive;
  private PImage sprite[][]= new PImage[2][3];


  public Mario (int x, int y, String url) {
    this.x = x;
    this.y = y;
    this.alive = true;
    this.moveLeft = false;
    this.moveRight = false;
    this.statusj = 0;
    this.statusi = 0;

    PImage tmp = loadImage(url);

    this.sprite[0][0] = tmp.get(0, 0, 57, 66);
    this.sprite[0][1] = tmp.get(55, 0, 57, 66);
    this.sprite[0][2] = tmp.get(110, 0, 57, 66);
    this.sprite[1][0] = tmp.get(0, 64, 57, 66);
    this.sprite[1][1] = tmp.get(55, 64, 57, 66);
    this.sprite[1][2] = tmp.get(110, 64, 57, 66);
  }

  public int getX () {
    return this.x;
  }

  public int getY () {
    return this.y;
  }

  public PImage getSprite () {
    if (this.moveLeft) this.x-=2;
    if (this.moveRight) this.x+=2;

    if (moveRight || moveLeft) {
      if (wait>=5) {
        statusj++;
        wait =0;
      }
      else
        wait++;
    }
    if (statusj == 3)
      statusj =0;

    
      if (moveLeft){
        switch(statusj) {
    case 0:
      return this.sprite[0][0];
    case 1:
      return this.sprite[0][1];
    case 2:
      return this.sprite[0][2];
        }
      }else{
        switch(statusj) {
        case 0:
      return this.sprite[1][0];
    case 1:
      return this.sprite[1][1];
    case 2:
      return this.sprite[1][2];
      }
    }
    return null;
  }

  public void setMoveLeft(boolean moveLeft) {
    this.moveLeft = moveLeft;
  }

  public void setMoveRight(boolean moveRight) {
    this.moveRight = moveRight;
  }
}

