// Posición de la pelota
float x = 100;
float y = 100;

// Velocidad de la pelota
float velX = 5;
float velY = 5;

// Tamaño de la pelota
float diametro = 50;

void setup() {
size(800, 600);
}

void draw() {
background(100, 0, 0, 8);

// Dibujar la paleta (rectángulo)
float paletaX = mouseX;
float paletaY = 550;
float paletaAncho = 150;
float paletaAlto = 20;
rect(paletaX, paletaY, paletaAncho, paletaAlto);

// Dibujar la pelota
ellipse(x, y, diametro, diametro);

// Movimiento de la pelota
x += velX;
y += velY;

// Rebote contra paredes
if (x < diametro/2 || x > width - diametro/2) {
velX *= -1;
}
if (y < diametro/2) {
velY *= -1;
}

// Rebote contra la paleta
if (x > paletaX && x < paletaX + paletaAncho &&
y + diametro/2 >= paletaY && y + diametro/2 <= paletaY + paletaAlto) {
velY *= -1;
y = paletaY - diametro/2; // Corrige que no se quede pegada
}

// Si la pelota se cae abajo, reinicia
if (y > height) {
x = width/2;
y = height/2;
velY = 5;
velX = 5;
}
}
