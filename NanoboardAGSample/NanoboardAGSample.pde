PFont font;
NanoBoardAG nb;
Human taro;
int timer=0;

void setup(){
  size(480, 480);  
  nb = new NanoBoardAG(this);
  taro = new Human("taro",175,65);
  font = createFont("Meiryo", 20);    
}

void draw(){
  background(255);
  fill(0);
  text("Slider: " + nb.getValSlider(), 10, 10);
  text("Light: " + nb.getValLight(), 10, 30);  
  text("Sound: " + nb.getValSound(), 10, 50);
  text("Button: " + nb.getValButton(), 10, 70);  
  text("A: " + nb.getValResistanceA(), 10, 90);
  text("B: " + nb.getValResistanceB(), 10, 110);  
  text("C: " + nb.getValResistanceC(), 10, 130);
  text("D: " + nb.getValResistanceD(), 10, 150);  
  // 一秒おきにモータを動かしたり止めたりする．
  timer++;
  if (timer % 60 == 0) nb.setMotorPower(0);
  if (timer % 60 == 30) nb.setMotorPower(100);
  // モータを制御する，さらに最新のセンサデータを取得する．
  nb.sendData();

  // taroのX座標をスライダーの値によって換える，
  taro.setX((int)(nb.getValSlider()*5)+100);
  taro.setY(300);
  
  // もし音がなったらお辞儀する．
  if(nb.getValSound() > 10){
    taro.start();
  } 
  // taro を再描画する．
  taro.update();
}

// シリアル通信からデータが送出されたことを検知するイベント
void serialEvent(Serial p){
  nb.serialEvent(p);
}
