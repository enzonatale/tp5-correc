class Juego {
  int posX, posY;
  int w, h; 
  int velx, vely;
  int paletaX, paletaY, paletaH, paletaW, paletaV; 
  int paletaXD, paletaYD;
  boolean up, down; 
  boolean upD, downD; 
  int puntos1=0;
  int puntos2=0;
  int ganador=3; 

  Juego() {
    posX=width/2;
    posY=height/2;
    w=30;
    h=30;
    velx=1;
    vely=2;
    textAlign(CENTER, CENTER);
    rectMode(CENTER); 
    paletaX=25;
    paletaY=height/2;
    paletaXD=width-25;
    paletaYD=height/2;
    paletaW=10;
    paletaH=60;
    paletaV=10;
  }
  void draw() {
    pelotita();
    movimientopelotita();
    rebote();
    pospaleta();
    paletamov();
    limitepaleta();
    esquinapaleta();
    puntosJugadores();
    finJuego();
  }
  void pospaleta() {
    noStroke();
    fill(255);
    rect(paletaX, paletaY, paletaW, paletaH);
    fill(255);
    rect(paletaXD, paletaYD, paletaW, paletaH);
  }
  void paletamov() {
    if (up) {
      paletaY=paletaY-paletaV;
    }
    if (down) {
      paletaY=paletaY+paletaV;
    }
    if (upD) {
      paletaYD=paletaYD-paletaV;
    }
    if (downD) {
      paletaYD=paletaYD+paletaV;
    }
  }

  void limitepaleta() {

    if (paletaY-paletaH/2<0) { 
      paletaY=paletaY+paletaV;
    }
    if (paletaY+paletaH/2>height) {
      paletaY=paletaY-paletaV;
    }
    if (paletaYD-paletaH/2<0) { 
      paletaYD=paletaYD+paletaV;
    }
    if (paletaYD+paletaH/2>height) {
      paletaYD=paletaYD-paletaV;
    }
  }  
  void esquinapaleta() {
    if (posX-w/2<paletaX+paletaW/2 && posY-w/2<paletaY+paletaH/2 && posY+h/2>paletaY-paletaH/2) {
      if (velx<0) { 
        velx=-velx*2;
        vely=-vely*2;
      }
    } else if (posX+w/2>paletaXD-paletaW/2 && posY-w/2<paletaYD+paletaH/2 && posY+h/2>paletaYD-paletaH/2) {
      if (velx>0) {
        velx=-velx*2;
        vely=-velx*2;
      }
    }
  }
  void pelotita() {
    fill(0);
    stroke((255), (0), (255));
    ellipse(posX, posY, w, h);
  }
  void movimientopelotita() {

    posX=posX+velx;
    posY=posY+vely;
  }
  void rebote() { 

    if (posX>width-w/2) {
      reiniciar();
      velx=-velx;
      puntos1=puntos1+1;
    } else if (posX<0 + w/2) {
      velx=-velx;
      puntos2=puntos2+1;
      reiniciar();
    }

    if (posY>height-h/2) {
      vely=-vely;
    } else if (posY<0+h/2) {
      vely=-vely;
    }
  }

  void puntosJugadores() {
    textSize(40);
    fill(255);
    text(puntos1, 250, 50);
    text(puntos2, width-250, 50);
  }

  void finJuego() {
    if (puntos1==ganador) {
      textSize(20);
      finJuegoPausa("¡Jugador izquierdo GANADOR!", 0);
    }
    if (puntos2==ganador) {
      finJuegoPausa("¡Jugador derecho GANADOR!", 0);
    }
  }

  void finJuegoPausa(String text, color c) {

    textSize(50);
    velx=0;
    vely=0;
    text("Final del juego :'(", width/2, height/3-60);
    fill(c);
    text(text, width/2, height/3);
    text("Click para jugar de nuevo", width/2, height/3+200);
    if (mousePressed) {

      puntos1=0;
      puntos2=0;
      velx=8;
      vely=4;
    }
  }
  void keyPressed() {
    if (key=='w' || key=='W') {
      up=true;
    }
    if (key=='s' || key=='S') {
      down=true;
    }
    if (keyCode==UP) {
      upD=true;
    }
    if (keyCode==DOWN) {
      downD=true;
    }
  }
  void keyReleased() { 
    if (key=='w' || key=='W') {
      up=false;
    }
    if (key=='s' || key=='S') {
      down=false;
    }
    if (keyCode==UP) {
      upD=false;
    }
    if (keyCode==DOWN) {
      downD=false;
    }
  }
  void reiniciar() {
    posX=width/2;
    posY=height/2;
    w=30;
    h=30;
    velx=1;
    vely=2;
    textAlign(CENTER, CENTER);
    rectMode(CENTER); 
    paletaX=25;
    paletaY=height/2;
    paletaXD=width-25;
    paletaYD=height/2;
    paletaW=10;
    paletaH=60;
    paletaV=10;
  }
}
