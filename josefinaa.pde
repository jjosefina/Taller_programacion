// Variables de la pelota
float ballX, ballY;
float ballSpeedX = 4;
float ballSpeedY = 4;
float ballSize = 30; // ← Pelota más grande

// Variables de la pala
float paddleX;
float paddleY;
float paddleWidth = 120; // Pala más ancha también
float paddleHeight = 18;

// Puntuación
int score = 0;

void setup() {
  size(600, 400);
  iniciarJuego();
}

void draw() {
  background(0);

  // Mostrar la puntuación
  fill(255);
  textSize(22);
  text("Puntos: " + score, 10, 30);

  // Dibuja la pelota
  fill(255);
  ellipse(ballX, ballY, ballSize, ballSize);

  // Mueve la pelota
  ballX += ballSpeedX;
  ballY += ballSpeedY;

  // Rebote en los laterales
  if (ballX < 0 || ballX > width) {
    ballSpeedX *= -1;
  }

  // Rebote en la parte superior
  if (ballY < 0) {
    ballSpeedY *= -1;
  }

  // Mover la pala con el mouse
  paddleX = constrain(mouseX - paddleWidth / 2, 0, width - paddleWidth);
  rect(paddleX, paddleY, paddleWidth, paddleHeight);

  // Rebote con la pala
  if (ballY + ballSize/2 >= paddleY &&
      ballX > paddleX &&
      ballX < paddleX + paddleWidth &&
      ballSpeedY > 0) {
    ballSpeedY *= -1;
    ballY = paddleY - ballSize/2;
    score++;
    if(ballSpeedY > 0){
    ballSpeedY+=1;
    }else{
    ballSpeedY-=1;
    
    }
    if(ballSpeedX > 0){
    ballSpeedX+=1;
    }else{
    ballSpeedX-=1;
    
    }
    ballSize--;
    
  }

  // Si la pelota se cae, reiniciar juego y puntos
  if (ballY > height) {
    score = 0;
    iniciarJuego();
  }
}

void iniciarJuego() {
  ballX = width / 2;
  ballY = height / 2;
  ballSpeedX = random(-4, 4);
  if (abs(ballSpeedX) < 2) ballSpeedX = 2;
  ballSpeedY = 4;

  paddleY = height - 30;
  paddleX = width / 2 - paddleWidth / 2;
}
