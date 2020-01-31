class TDCA{   //2 dimensional cellula automatas
  
  int [][] ca;       //cell grid
  int wide;
  int high;
  int rule;
  int xstep;
  int ystep;
  int spacer;
  
  TDCA(int _w, int _h){    //constructor
    wide = _w;
    high = _h;
    ca = new int [wide][high];
  }
  
  void Create(){
    for(int i = 0; i < (wide-1); i++){
      for(int j = 0; j < (high-1); j++){
        ca[i][j] = 0;
      }
    }
  }
  
  void Randomize(){         //randomizer
    int maxrandom = (wide*high)/3;
    for(int i = 0; i < maxrandom; i++){
      ca[(int)random(wide-1)][(int)random(high-1)]= 1;
    }
  }
  
  
  void Update(int _rule){   // update the cells according to the rule. Takes advantage of the fact that rules can be stated as binary strings
     rule = _rule;
     int index;
     int [][] tempca = new int[wide][high];
     for(int i = 0; i < (wide-1); i++){
       for(int j = 0; j < (high-1); j++){
         if(i==0 && j==0){
            index = 256 * ca[wide-1][high-1]+ 128 * ca[i][high-1]+ 64 * ca[i+1][high-1]+ 32 * ca[wide-1][j] + 16 * ca[i][j]+ 8 * ca[i+1][j]+ 4 * ca[wide-1][j+1]+ 2 * ca[i][j+1]+ ca[i+1][j+1];
         }else if(i==(wide-1) && j==0){
            index = 256 * ca[i-1][high-1]+ 128 * ca[i][high-1]+ 64 * ca[0][high-1]+ 32 * ca[i-1][j] + 16 * ca[i][j]+ 8 * ca[0][j]+ 4 * ca[i-1][j+1]+ 2 * ca[i][j+1]+ ca[0][j+1];
         }else if(i==0 && j==(high-1)){
            index = 256 * ca[wide-1][j-1]+ 128 * ca[i][j-1]+ 64 * ca[i+1][j-1]+ 32 * ca[wide-1][j] + 16 * ca[i][j]+ 8 * ca[i+1][j]+ 4 * ca[wide-1][0]+ 2 * ca[i][0]+ ca[i+1][0];
         }else if(i==(wide-1) && j==(high-1)){
            index = 256 * ca[i-1][j-1]+ 128 * ca[i][j-1]+ 64 * ca[0][j-1]+ 32 * ca[i-1][j] + 16 * ca[i][j]+ 8 * ca[0][j]+ 4 * ca[i-1][0]+ 2 * ca[i][0]+ ca[0][0];
         }else if(i == 0){
            index = 256 * ca[wide-1][j-1]+ 128 * ca[i][j-1]+ 64 * ca[i+1][j-1]+ 32 * ca[wide-1][j] + 16 * ca[i][j]+ 8 * ca[i+1][j]+ 4 * ca[wide-1][j+1]+ 2 * ca[i][j+1]+ ca[i+1][j+1];
         }else if(i == (wide - 1)){
            index = 256 * ca[i-1][j-1]+ 128 * ca[i][j-1]+ 64 * ca[0][j-1]+ 32 * ca[i-1][j] + 16 * ca[i][j]+ 8 * ca[0][j]+ 4 * ca[i-1][j+1]+ 2 * ca[i][j+1]+ ca[0][j+1];
         }else if (j == 0){
            index = 256 * ca[i-1][high-1]+ 128 * ca[i][high-1]+ 64 * ca[i+1][high-1]+ 32 * ca[i-1][j] + 16 * ca[i][j]+ 8 * ca[i+1][j]+ 4 * ca[i-1][j+1]+ 2 * ca[i][j+1]+ ca[i+1][j+1];
         }else if (j == (high - 1)){
            index = 256 * ca[i-1][j-1]+ 128 * ca[i][j-1]+ 64 * ca[i+1][j-1]+ 32 * ca[i-1][j] + 16 * ca[i][j]+ 8 * ca[i+1][j]+ 4 * ca[i-1][0]+ 2 * ca[i][0]+ ca[i+1][0];
         }else{
           index = 256 * ca[i-1][j-1]+ 128 * ca[i][j-1]+ 64 * ca[i+1][j-1]+ 32 * ca[i-1][j] + 16 * ca[i][j]+ 8 * ca[i+1][j]+ 4 * ca[i-1][j+1]+ 2 * ca[i][j+1]+ ca[i+1][j+1];
            
          }
       tempca[i][j]= (rule >> index) % 2;
     }
     }
     for(int i = 0; i < (wide-1); i++){
       for(int j = 0; j < (high-1); j++){
       ca[i][j]=tempca[i][j];
     }
     }
  }
  
  void Display(int windowsize){
    
    
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
  
      for(int i = 0; i < (wide-1); i++){
       for(int j = 0; j < (high-1); j++){
        if(ca[i][j] == 0){
          DrawBlock((xcord + (xstep * i)),(ycord + (ystep * j)),white);
        }else if(ca[i][j] == 1){
           DrawBlock((xcord + (xstep * i)),(ycord + (ystep * j)),black);
        }   
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
