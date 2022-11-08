class Jugador {
  PVector posicion, velocidad;
  int ancho, alto, numeroJugador, puntos;
  
  Jugador(int numeroJugador_) {
    numeroJugador = numeroJugador_;
    ancho = 20; //rectangulo del jugador
    alto = 100; 
    puntos = 0; //puntos del jugador

    if(numeroJugador == 1) {
      posicion = new PVector(ancho/2, height/2);
    } else if(numeroJugador == 2) {
      posicion = new PVector(width - ancho/2, height/2);
    }
    
    velocidad = new PVector(0,3);
  }
  
  //movimiento
  void mover() {
    //jugador 1
    //tecla w = arriba
    if(numeroJugador == 1 && key == 'w') {
      posicion.sub(velocidad);
    } 
    //tecla s = abajo
    else if(numeroJugador == 1 && key == 's') {
      posicion.add(velocidad);
    }
    //jugador 2
    //arriba
    if(numeroJugador == 2 && keyCode == UP) {
      posicion.sub(velocidad);
    } 
    //abajo
    else if(numeroJugador == 2 && keyCode == DOWN) {
      posicion.add(velocidad);
    }
    posicion.y = constrain(posicion.y,alto/2,height - alto/2);
  }

  void mostrarRectangulo() {
    fill(255);
    noStroke();
    rectMode(CENTER);
    rect(posicion.x, posicion.y, ancho, alto);
  }
  
  PVector getPosicion() {
    return posicion;
  }
  
  //contador de puntos
  void setPuntos(int puntos_) {
    puntos += puntos_;
  }
  
  int getPuntos() {
    return puntos;
  }
}
