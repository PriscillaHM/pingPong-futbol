class Balon {
  PVector posicion, velocidad;
  int anchoJugador, altoJugador;
  
  Balon(int direccion) {
    anchoJugador = 20;
    altoJugador = 100;

    //pelota al centro 
    posicion = new PVector(width/2, height/2);
    //velocidad de lo pelota entre 4 y 5
    velocidad = new PVector(direccion*random(4,5), random(4,5));
  }

  void moverPelota() {
    posicion.add(velocidad);
  }
  
  void mostrarPelota() {
    fill(0);
    noStroke();
    //ellipse(posicion.x, posicion.y, 20,20);
    image(balon,posicion.x, posicion.y, 20,20);
  }
  
  void reboteJugador1(PVector posicionJugador) {
    //Valor minimo en la que la pelota puede estar cerca 
    //del rectangulo del jugador 1 en su coordenada Y
    float min = posicionJugador.y - altoJugador/2;
    
    //Valor maximo en la que la pelota puede estar cerca 
    //del rectangulo del jugador 1 en su coordenada Y
    float max = posicionJugador.y + altoJugador/2;
    
    //si la coordena Y de la pelota está dentro del rango [min,max]
    //de la coordenada Y del jugador 1 y su coordena X es menor al 
    //ancho del rectangulo del jugador 1, quiere decir que está tocando
    //al rectangulo del jugador 1 entonces su velocidad en X irá en
    //direccion contraria (rebotará)
    if(posicion.x < anchoJugador && posicion.y > min && posicion.y < max) {
      velocidad.x *= -1;
    }
  }
  
  void reboteJugador2(PVector posicionJugador) {
    //Valor minimo en la que la pelota puede estar cerca 
    //del rectangulo del jugador 2 en su coordenada Y
    float min = posicionJugador.y - altoJugador/2;
    
    //Valor maximo en la que la pelota puede estar cerca 
    //del rectangulo del jugador 1 en su coordenada Y
    float max = posicionJugador.y + altoJugador/2;
    
    //si la coordena Y de la pelota está dentro del rango [min,max]
    //de la coordenada Y del jugador 2 y su coordena X es menor al 
    //ancho del rectangulo del jugador 2, quiere decir que está tocando
    //al rectangulo del jugador 2 entonces su velocidad en X irá en
    //direccion contraria (rebotará)
    if(posicion.x > width - anchoJugador && posicion.y > min && posicion.y < max) {
      velocidad.x *= -1;
    }
  }
  
  void reboteParedes() {
    //cambio de direccion en el rebote
    if(posicion.y > height) {
      velocidad.y *= -1;
    } else if(posicion.y < 0) {
      velocidad.y *= -1;
    }
  }
  
  PVector getPosicion() {
    return posicion;
  }
}
