TDCA cells= new TDCA(100,100);


void setup(){
  cells.Create();
  cells.Randomize();
  surface.setSize(1000,1000);
 frameRate(3);
}

void draw(){
  cells.Display(1000);
  delay(1);
  cells.Update(2345);
}  
