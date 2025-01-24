import processing.pdf.*;
boolean record;

int intervalo = (int) random(4999, 5000); 
int ultimoCambio = 0; 
boolean colorFosforito = true;

String mytext = "br";
PFont myfont;
int num;
float py;

void setup() {
  
  
  myfont = createFont("IBMPlexMono-Medium.ttf", 18);
  textFont(myfont);
  background(255);
  fill(0);
  textSize(8);
  
  
  frameRate (2);
  size (568, 843);
}

void draw() {
  
   if(record){
    beginRecord(PDF, "llapis-####.pdf");
    }
  
  //PARA HACER EL CAMBIO DE LOS COLORINES
  
  if (millis() - ultimoCambio > intervalo) { 
    colorFosforito = !colorFosforito;
    ultimoCambio = millis(); 
  }
  
  
  if (colorFosforito) {
    background(204, 255, 0); 
    fill (0);
  } else {
    background(50, 50, 50); 
    fill(0, 0, 0); 
  }
  
  
//  ___________________________________________________________________




  
/*
for(int i=0; i<700; i++){
  py=random(height);
    if (py>height/3 && py<height-height/3) {
      bola_b2 (random(width), py) ;
    }
  } 


  
 for(int i=0; i<800; i++){
      py=random(height);
    if(py<=height && py>=height/3*2){
      bola_r(random(width), py);
    }
    if(py<=height/3){
     
      bola_b(random(width), py);
    }
  }
    cascada1 (0, 0);
  cascada2(0, 0);
 
 */
  //---------------------------------------------------------------------------
  
  bola_b2 (random(200, 395), random (0,978));
  bola_r(random(465, 595), random (0,489));
  bola_b(random(0, 150), random (0,489)) ;
  bola_r(random(465, 595), random (480,978));   
  bola_b(random(0, 150), random (0,489));
  lineasArriba(0, 0, random(40, 100));
  cascada_mid_abajo(0, 0);
  cascada_mid_arriba(0, 0);
  
   cascada1 (0, 0);
  cascada2(0, 0);

  
 //--------------------------------------------------------------------------- 
 

//EXPORTAR EN PNG'S
saveFrame("png/onomatopeia-####.png");

//EXPORTAR EN VIDEO -> HERRAMIENTAS -> CREAR PELICULA


 if (record){
    endRecord();
    record = false;
    } 
}
  
  




void cascada1(float px, float py) {
  for (float y = 10; y <= height/2; y *= 1.05) {
    for (int x = 0; x <= width; x += 10) {
      text(mytext, x, y-2);
    }
  }
}

void cascada_mid_abajo(float px, float py) {

  for (float y = height / 2; y <= height; y += (y - height / 2) * 0.05 + 1) {  // Comienza desde la mitad y mantiene el incremento
    for (int x = 0; x <= width; x += 10) {
      text(mytext, x, y - 2);
    }
  }
}
void cascada_mid_arriba(float px, float py) {
  for (float y = height / 2; y >= 0; y -= (height / 2 - y) * 0.05 + 1) {  // Comienza en el centro y sube hacia el top
    for (int x = 0; x <= width; x += 10) {
      text(mytext, x, y - 2);
    }
  }
}




void cascada2(float px, float py) {
  
  for (float y = height/2; y >= 10; y /= 1.05) {
    for (int x = 0; x <= width; x += 10) {
      text(mytext, x, height - y + 2); 
    }
  }
}

void lineasArriba (float px, float py, float pc) {
  float centerY = height/2;

  // Dibujar hacia arriba
  for (float y = centerY; y >= 10; y -= 10) {
    for (float x = random(10); x <= width; x += pc+random(10)) {
      text(mytext.charAt(0), x, y);
    }
  }
  for (float y = centerY; y <= height - 20; y += 10) {
    for (float x = random(100); x <= width - 20; x += pc+random(100)) { 
      text(mytext.charAt(1), x, y);
    }
  }
}
void bola_b(float px, float py) {
  push();
  translate(px, py);
  for (int i=0; i<14; i=i+1) {
    rotate(radians(-50));
    text(mytext.charAt(0), 10, 0);
  }
  pop();

  push();
  translate(px, py);

  text(mytext, -7, 3);
  pop();
}

void bola_r(float px, float py) {
    push();
  translate(px, py);
 
  for (int i=0; i<14; i=i+1) {
    rotate(radians(-50));
    text(mytext.charAt(1), 10, 0);
  }
  pop();

  push();
  translate(px, py);
  text(mytext, -7, 3);
  pop();
}

void bola_b2(float px, float py) {
  push();
  translate(px, py);
  
  for (int i=0; i<28; i=i+1) {
    rotate(radians(-33));
    text(mytext.charAt(0), 30, 0);
  }
  pop();
  push();
  translate(px, py);

  for (int i=0; i<14; i=i+1) {
    rotate(radians(-50));
    text(mytext.charAt(1), 20, 0);
  }
  pop();

  push();
  translate(px, py);
  for (int i=0; i<28; i=i+1) {
    rotate(radians(-33));
    text(mytext.charAt(0), 50, 0);
  }
  pop();

  push();
  translate(px, py);
  text(mytext, -5, 0);
  pop();

  push();
  translate(px, py);
  rotate(radians(180));
  text(mytext, -5, -3);

  pop();
}

void mousePressed() {
  record = true;
}
