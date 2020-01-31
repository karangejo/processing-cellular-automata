class CA{   //one dimensional cellula automatas
  
  int [] ca;       //cell grid
  int wide;
  int high;
  int rule;
  int xstep;
  int ystep;
  int spacer;
  
  CA(int _w, int _h){    //constructor
    wide = _w;
    high = _h;
    ca = new int [wide];
  }
  
  void Create(){
    for(int i = 0; i < (wide-1); i++){
      ca[i] = 0;
    }
  }
  
  void Randomize(){         //randomizer
    int maxrandom = wide/3;
    for(int i = 0; i < maxrandom; i++){
      ca[(int)random(wide-1)]= 1;
    }
  }
  
  
  void Update(int _rule){   // update the cells according to the rule. Takes advantage of the fact that rules can be stated as binary strings
     rule = _rule;
     int index;
     int [] tempca = new int[wide];
     for(int i = 0; i < ca.length; i++){
       if(i == 0){
          index = 4 * ca[wide-1] + 2 * ca[i] + ca[i+1];
       }else if(i == (wide - 1)){
          index = 4 * ca[i-1] + 2 * ca[i] + ca[0];
       }else{
           index = 4 * ca[i-1] + 2 * ca[i] + ca[i+1];
       }
       tempca[i]= (rule >> index) % 2;
     }
     for(int i = 0; i < ca.length; i++){
       ca[i]=tempca[i];
     }
  }
  
  void Display(int windowsize,int lines){
    
    
    color black =  color(0,0,0); // black
    color white =  color(0, 0, 225); // blue (white)
    
    if(wide == high){                 // make sure non square matrices don't get lopsided
      ystep = windowsize/high;
      xstep = windowsize/wide;
    }else if(high > wide){
      ystep = windowsize/high;
      xstep = windowsize/high;
    }else if(wide > high){
      ystep = windowsize/wide;
      xstep = windowsize/wide;
    }
  
   spacer = windowsize/(wide*high);
  
  int ycord = ystep/2;
  int xcord = xstep/2;
  
      for(int i=0; i < ca.length; i++){
        if(ca[i] == 0){
          DrawBlock((xcord + (xstep * i)),(ycord + (ystep * lines)),white);
        }else if(ca[i] == 1){
           DrawBlock((xcord + (xstep * i)),(ycord + (ystep * lines)),black);
        }   
      }
  }
  
  void DrawBlock(int _x, int _y, color _blockcolor){   //draw a square
  int x =_x;
  int y =_y;
  color bcolor = _blockcolor;
  
  colorMode(RGB);
  rectMode(CENTER);
  fill(bcolor);
  rect(x,y,xstep-spacer, ystep-spacer);
}

}
