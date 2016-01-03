double [] g=new double[10];
double [] x=new double[10];
double [] y=new double[10];
int [] red_ = new int[10];
int [] green_ = new int[10];
int [] blue_ = new int[10];
int [] al = new int[10];
int [] count=new int[10];

int clickX=0;
int clickY=0;
double score=0;
double highScore;
boolean start=false;
boolean end=false;
int startTime;

void mousePressed(){
    
    if(!start&&!end){startTime=millis();
    start=true;
    }
    for(int i=0;i<10;i++){
       
        if((mouseX-x[i])*(mouseX-x[i])+(mouseY-y[i])*(mouseY-y[i])<=(count[i]/2)*(count[i]/2)){
            count[i]=0;
            clickX=0;
            clickY=0;
            score++;
            return;
        }
    }
}

void setup() {
    PFont font = createFont("MS Gothic",48,true);
    textFont(font);
    frameRate(50);
  
    size(1900,1000); 
    fill(255,0,0); 
    background(255,255,255);
    noStroke();//輪郭線を描画しない
    
    for(int i=0;i<10;i++){
        red_[i]=0;blue_[i]=0;green_[i]=0;count[i]=-1;
        x[i]=random(100,1800);
               y[i]=random(100,900);
    }
    score=0;start=false;end=false;
    
    
    for(int j=0;j<10;j++){     
        count[j]=(j+1)*20;
    }
    
    String[] read = new String[1];
    read=loadStrings("score.txt");//score.txtからデータ読み込み
    highScore=unhex(read[0]);//データ変換
    
   
}

void draw(){
    if(30-(millis()-startTime)/1000<=0){end=true;start=false;}
   
   background(255,255,255);
     
        if(start){
    for(int i=0;i<10;i++){
       
       
           count[i]--;
           if(count[i]<=0){
               count[i]=200;
               x[i]=random(100,1800);
               y[i]=random(100,900);
               al[i]=(int)random(80,100);
               
               do{
               red_[i]=(int)random(0,255);
               blue_[i]=(int)random(0,255);
               green_[i]=(int)random(0,255);
               }while(red_[i]+blue_[i]+green_[i]<100);
           }
           
          fill(red_[i],green_[i],blue_[i],al[i]);
           ellipse((int)x[i],(int)y[i],count[i],count[i]);              
       
    }
    
    
     fill(0,0,0);
           text("点数",10,50);
           text((int)score,150,50);
           text("残り",10,120);
           if(30-(millis()-startTime)/1000<=5)fill(255,0,0);
           text(30-(millis()-startTime)/1000,150,120);
            text("秒",200,120);
     
        }//ここまでstart
       
       
       
       
       
       
       
       
        if(!start&&!end){//ゲーム開始前
           fill(0,0,0);
           text("だんだん小さくなる玉をクリックしてください。",500,110);
           text("制限時間は30秒です。",500,170);
           text("マウスをクリックすると始まります。",500,230);

           text("今までの最高点は　　点です。",550,290);
           fill(255,0,0);
           text((int)highScore,960,290);
         }
  
        if(end){//ゲーム終了後
             fill(0,0,0);
             text("あなたの点数は　　点です。",500,210);
             text((int)score,880,210);
             if(score>highScore){//最高記録を更新していたら
             fill(255,0,0);
                text("最高記録更新！",500,290);              
                String[] lines = new String[1];
                lines[0]=hex((int)score);//変換して
                saveStrings("score.txt",lines);//score.txtに書き込む
             }
         }
         
         
         
           
      
        
        
    }
    


 

