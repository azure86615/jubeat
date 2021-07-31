import ddf.minim.*;
Minim minim;
AudioPlayer kimi;
int timelimit=180;
int time;
int time2=0;
int i;
int score = 0;
int num;
int scene = 0;
PImage play;
PImage end;
PImage start;
PImage how;
class square{
  public int life = 0;
  public int size = 0;
}
square[] a = new square[16];

void setup(){
  size(800,1000);
  background(30,240,200);
  strokeWeight(5);
  //PImage back = loadImage ("name.jpg");
  //image(back,-20,-50);
  
  play = loadImage("play.PNG");
  start = loadImage("start.jpg");
  how = loadImage("how.PNG");
  image(start,0,0);
  
  String button="start";
  textSize(56);
  fill(54,60,252);
  stroke(54,60,252);
  text(button,350,350);
  fill(200,200,200,50);
  rect(300,300,220,70);
  
  minim = new Minim(this);
  
  
  /*//hitting square
  fill(255,255,255,150);
  for(int i=0;i<4;i++){
    for (int j=0;j<4;j++){
      rect(10+200*i,230+190*j,180,180);
    }
  }*/
  
  frameRate(100);
  for (int k=0; k<16;k++)
    a[k]= new square();
}

void draw(){
  //start scene
  if (scene ==0){
    image(start,0,0);
    
    //button
    String button="start";
    textSize(56);
    fill(54,60,252);
    stroke(54,60,252);
    text(button,350,350);
    fill(200,200,200,50);
    rect(300,300,220,70);
    
    button="how to";
    fill(242,79,247);
    stroke(242,79,247);
    text(button,320,710);
    fill(200,200,200,50);
    rect(300,650,220,70);
    
    if(mousePressed==true&&mouseButton==LEFT){
    if(mouseX>300&&mouseY>300&&mouseY<370&&mouseX<520){
      scene = 1;
      time = timelimit;
      kimi = minim.loadFile("kimi.mp3");
      kimi.play();
      for (int x=0;x<16;x++)
        a[x].life = 0;
    }
    else if(mouseX>300&&mouseY>650&&mouseY<720&&mouseX<520){
      scene = 3;
      kimi = minim.loadFile("kimi.mp3");
      kimi.play();
    }
    }
  }
  //play scene
  else if(scene ==1){
    image(play,-4,-6);
    
     //score
    textSize(50);
    fill(233,63,126);
    text("score: "+score,30,80);
    
    //time
    time2++;
    if(time2%100==0) time--;
    fill(242,252,50);
    String t =nf(time,2); 
    text("Time:",530,70);
    if (time <=10) fill(255,0,0);
    text(t,670,70);
    if(time ==0)
      scene=2;
    
    //random spot
    if (score >300){
      if(time2 %20==1){
         num = (int)random(0,15);
         a[num].life =1;}
    }
    else if (score > 200){
      if(time2 %50==1){
         num = (int)random(0,15);
         a[num].life =1;}
    }
    else{
      if(time2 %100==1){
         num = (int)random(0,15);
         a[num].life =1;}
    }
   spot();
  }
  //end scene
  else if (scene ==2){
    end = loadImage("end.jpg");
    image(end,0,-20);
    fill(255,100);
    strokeWeight(5);
    stroke(255,0,0);
    rect(200,550,400,200);
    textSize(100);
    fill(255,0,0);
    text("Final Score",150,150);
    if (score <0) score = 0;
    String s =nf(score,5);
    text(s,245,700);
    
    //back to start button
    String button="BACK";
    textSize(56);
    fill(104,236,60);
    stroke(104,236,60);
    text(button,340,860);
    fill(200,200,200,50);
    rect(300,800,220,70);
    
    if(mousePressed==true&&mouseButton==LEFT){
      if(mouseX>300&&mouseY>800&&mouseY<870&&mouseX<520){
        scene = 0;
        score = 0;
        minim.stop();
      }
    }
  }
  
  // how to play scene
  else if (scene ==3){
    image(how,0,0);
    String button="start";
    textSize(56);
    fill(54,60,252);
    stroke(54,60,252);
    text(button,330,850);
    fill(200,200,200,50);
    rect(300,800,220,70);
    
    if(mousePressed==true&&mouseButton==LEFT){
      if(mouseX>300&&mouseY>800&&mouseY<870&&mouseX<520){
        scene = 1;
        time = timelimit;
        for (int x=0;x<16;x++)
          a[x].life = 0;
      }
    }
  }
}

void spot(){
  int  x = 0,y = 0;
  for (int i =0; i<16;i++){
  switch (i){
    case 0:
      x = 0;
      y = 0;
      break;
    case 1:
      x = 1;
      y = 0;
      break;
    case 2:
      x = 2;
      y = 0;
      break;
    case 3:
      x = 3;
      y = 0;
      break;
    case 4:
      x = 0;
      y = 1;
      break;
    case 5:
      x = 1;
      y = 1;
      break;
    case 6:
      x = 2;
      y = 1;
      break;
    case 7:
      x = 3;
      y = 1;
      break;
    case 8:
      x = 0;
      y = 2;
      break;
    case 9:
      x = 1;
      y = 2;
      break;
    case 10:
      x = 2;
      y = 2;
      break;
    case 11:
      x = 3;
      y = 2;
      break;
    case 12:
      x = 0;
      y = 3;
      break;
    case 13:
      x = 1;
      y = 3;
      break;
    case 14:
      x = 2;
      y = 3;
      break;
    case 15:
      x = 3;
      y = 3;
      break;
  }
  
    if (a[i].life ==1){
      if(a[i].size >173){ 
        a[i].life = 0;        
      }
      a[i].size++;
      noStroke();
      fill(50,255,39);
      rect(100-a[i].size/2 +200*x,320-a[i].size/2+190*y,a[i].size,a[i].size);
    }
    else if(a[i].life ==0)
      a[i].size = 0;
  }
}

void keyPressed(){
  if (scene ==1){
  switch (key){
    case '3':
      if(a[0].life ==1){
        score +=10;
        a[0].life = 0;
      }
      else
        score -=5;
      break;
    case '4':
      if(a[1].life ==1){
        score +=10;
        a[1].life = 0;
      }
      else
        score -=5;
      break;
    case '7':
      if(a[2].life ==1){
        score +=10;
        a[2].life = 0;
      }
      else
        score -=5;
      break;
    case '8':
      if(a[3].life ==1){
        score +=10;
        a[3].life = 0;
      }
      else
        score -=5;
      break;
    case 'e':
      if(a[4].life ==1){
        score +=10;
        a[4].life = 0;
      }
      else
        score -=5;
      break;
    case 'r':
      if(a[5].life ==1){
        score +=10;
        a[5].life = 0;
      }
      else
        score -=5;
      break;
    case 'u':
      if(a[6].life ==1){
        score +=10;
        a[6].life = 0;
      }
      else
        score -=5;
      break;
    case 'i':
      if(a[7].life ==1){
        score +=10;
        a[7].life = 0;
      }
      else
        score -=5;
      break;
    case 'd':
      if(a[8].life ==1){
        score +=10;
        a[8].life = 0;
      }
      else
        score -=5;
      break;
    case 'f':
      if(a[9].life ==1){
        score +=10;
        a[9].life = 0;
      }
      else
        score -=5;
      break;
    case 'j':
      if(a[10].life ==1){
        score +=10;
        a[10].life = 0;
      }
      else
        score -=5;
      break;
    case 'k':
      if(a[11].life ==1){
        score +=10;
        a[11].life = 0;
      }
      else
        score -=5;
      break;
    case 'c':
      if(a[12].life ==1){
        score +=10;
        a[12].life = 0;
      }
      else
        score -=5;
      break;
    case 'v':
      if(a[13].life ==1){
        score +=10;
        a[13].life = 0;
      }
      else
        score -=5;
      break;
    case 'm':
      if(a[14].life ==1){
        score +=10;
        a[14].life = 0;
      }
      else
        score -=5;
      break;
    case ',':
      if(a[15].life ==1){
        score +=10;
        a[15].life = 0;
      }
      else
        score -=5;
      break;
  }   
} 
}