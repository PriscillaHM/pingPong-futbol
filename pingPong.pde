Jugador jugador1, jugador2;
Balon pelota;
boolean ganador;
int puntajeMaximo;

PImage img;
PImage balon;

void setup() {
  size(600,400);
  
  //creacion de jugadores
  jugador1 = new Jugador(1); 
  jugador2 = new Jugador(2);
  
  pelota = new Balon(1); //creacion de pelota 
  ganador = false; 
  
  puntajeMaximo = 3; //puntje para ganar
  
  img=loadImage("cancha.jpg");
  balon =loadImage("balon.png");
}

void draw() {
  //fondo
  img.resize(600,400);
  image(img,0,0);
  
  fill(0);
  textSize(30);
  text(jugador1.getPuntos(), width/2 - 60, 45);
  text(jugador2.getPuntos(), width/2 + 30, 45);
  textSize(15);
  text("Jugador 1",120,45);
  textSize(15);
  text("Jugador 2",420,45);
  textSize(10);
  text("Priscilla Hurtado Mijares",490,393);

  //juego
  if(ganador == false) {
    strokeWeight(2);
    stroke(255);
    pelota.mostrarPelota();
    pelota.moverPelota();
  }
  
  jugador1.mostrarRectangulo();
  jugador1.mover();
  pelota.reboteJugador1(jugador1.getPosicion());
  
  jugador2.mostrarRectangulo();
  jugador2.mover();
  pelota.reboteJugador2(jugador2.getPosicion());
  
  pelota.reboteParedes();
  puntos();
  ganador();
}

void puntos() {
  PVector posicionPelota = pelota.getPosicion();
  
  //puntos jugador 1
  if(posicionPelota.x > width && jugador1.getPuntos() <= puntajeMaximo) {
    jugador1.setPuntos(1);
    pelota = new Balon(-1);
  } 
  //puntos jugdor 2
  else if(posicionPelota.x < 0 && jugador2.getPuntos() <= puntajeMaximo) { 
    jugador2.setPuntos(1);
    pelota = new Balon(1);
  }
  //reiniciar juego
  else if (keyPressed && ganador == true) {
    setup();
  }
}

void ganador() {
  //Al alcanzar el puntaje maximo el jugador gana
  if(jugador1.getPuntos() == puntajeMaximo) {
    fill(255);
    rect(300, 200, 300,80,10);
    fill(0);
    textSize(20);
    text("Jugador 1 ha ganado la partida", 170, height/2);
    textSize(10);
    text("Presione cualquier tecla para volver a jugar", 210, height/2 + 30);
    ganador = true;
  } else if(jugador2.getPuntos() == puntajeMaximo) {
    fill(0);
    text("Jugador 2 ha ganado la partida", 170, height/2);
    textSize(20);
    text("Presione cualquier tecla para volver a jugar",  210, height/2 + 30);
    ganador = true;
  }
}
