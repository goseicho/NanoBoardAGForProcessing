PFont font;
NanoBoardAG[] nb;
Human[] h;
int[] arrayOfPortID = {3,4};

int timer = 0;
int displayID = 0;
int counterID = 0;

void setup(){
  size(480, 480);  
  nb = new NanoBoardAG[arrayOfPortID.length]; 
  h  = new Human[arrayOfPortID.length]; 
  for(int i = 0; i< arrayOfPortID.length; i++){
    nb[i] = new NanoBoardAG(this, arrayOfPortID[i]);
    h[i] = new Human("",175,65);
}
  font = createFont("Meiryo", 20);    
}

void draw(){
  background(255);
  fill(0);
  text("NanoBoradAG No.: " + displayID, 10, 10);
  text("Slider: " + nb[displayID].getValSlider(), 10, 20);
  text("Light: " + nb[displayID].getValLight(), 10, 30);  
  text("Sound: " + nb[displayID].getValSound(), 10, 40);
  text("Button: " + nb[displayID].getValButton(), 10, 50);  
  text("A: " + nb[displayID].getValResistanceA(), 10, 60);
  text("B: " + nb[displayID].getValResistanceB(), 10, 70);  
  text("C: " + nb[displayID].getValResistanceC(), 10, 80);
  text("D: " + nb[displayID].getValResistanceD(), 10, 90);  

  timer++;  
  if (timer % 60 == 0) displayID = (displayID + 1) % arrayOfPortID.length;

 // 一秒おきにモータを動かしたり止めたりする．
  if (timer % 60 == 0) nb[0].setMotorPower(0);
  if (timer % 60 == 30) nb[0].setMotorPower(100);

  // モータを制御する，さらに最新のセンサデータを取得する．
  for(int i = 0; i< arrayOfPortID.length; i++){
    nb[i].sendData();
  }

  for(int i = 0; i< arrayOfPortID.length; i++){
    // 人型ピクトグラムのX座標をスライダーの値によって換える，
    h[i].setX((int)(nb[i].getValSlider() * 5) + 100);
    // 人型ピクトグラムのY座標を要素番号によって換える，
    h[i].setY(200 + i * 50);
    // もし音がなったらお辞儀する．
    if(nb[i].getValSound() > 10){
      h[i].start();
    } 
  // 再描画する．
  h[i].update();
  }
}

// シリアル通信からデータが送出されたことを検知するイベント
void serialEvent(Serial p){
  for(int i = 0; i< arrayOfPortID.length; i++){
    nb[i].serialEvent(p);
  }  
}