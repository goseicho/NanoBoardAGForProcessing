
class Human {
  private String name;  // 名前
  private double shincho;  // 身長
  private double taijyu;  // 体重
  private int x = 0; // 表示のX座標
  private int y = 0; // 表示のY座標
  private PImage stand = loadImage("master.png");
  private PImage bow = loadImage("master2.png");
  private int time = 0;
  private int step = 0;

  Human() {
    this.name = null;
    this.shincho = 170.0;
    this.taijyu = 65.0;
  }
  
  Human(String name) {
    this.name = name;
    this.shincho = 170.0;
    this.taijyu = 65.0;
  }
  
  Human(String name, double shincho, double taijyu) {
    this.name = name;
    this.shincho = shincho;
    this.taijyu = taijyu;
  }

  void start(){
    step = 1;
  }
     
  void update(){
    time = time + step;
    if (time == 0) {
      image(stand, (int)(x - stand.width/2), (int)(y - stand.height/2 ), stand.width, stand.height);
    } else {
      image(bow, (int)(x - bow.width/2), (int)(y - bow.height/2 ) - 20 , bow.width, bow.height);
    }    
    // 名前を一文字づつ縦に表示する．
    for(int i = 0; i < this.name.length(); i++){ 
      text(this.name.charAt(i) , x - 5, y - 30 + i * 10);
    }
    if (time == 60) {
      step = 0;
      time = 0;
    }
  }
  
  String getName() {
    return this.name;
  }

  double getShincho() {
    return this.shincho;
  }

  double getTaijyu() {
    return this.taijyu;
  }

  int getX() {
    return this.x;
  }

  int getY() {
    return this.y;
  }
  
  void setName(String name) {
    this.name = name;
  }

  void setShincho(double shincho) {
    this.shincho = shincho;
  }

  void setTaijyu(double taijyu) {
    this.taijyu = taijyu;
  }
  
  void setX(int x){
    this.x = x;
  }

  void setY(int y){
    this.y = y; 
  }

}