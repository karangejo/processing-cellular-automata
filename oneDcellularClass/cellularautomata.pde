int lines = 300;
int counter = 0;
CA cells= new CA(300,lines);


void setup(){
  cells.Create();
  cells.Randomize();
    surface.setSize(600,600);
  frameRate(11);
}

void draw(){
  cells.Display(600,counter++);
  delay(1);
  cells.Update(225);
  if(counter >= lines){
    counter = 0;
  }
}  
