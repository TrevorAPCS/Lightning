int x = (int)(Math.random() * 300);
int y = 0;
boolean lightning = false;
boolean house1 = true;
boolean house2 = true;
boolean house3 = true;
boolean car1 = true;
boolean car2 = true;
boolean car3 = true;
float sw = 8;
float h1r = (float)Math.random() * 255;
float h1g = (float)Math.random() * 255;
float h1b = (float)Math.random() * 255;
float h2r = (float)Math.random() * 255;
float h2g = (float)Math.random() * 255;
float h2b = (float)Math.random() * 255;
float h3r = (float)Math.random() * 255;
float h3g = (float)Math.random() * 255;
float h3b = (float)Math.random() * 255;
float c1r = (float)Math.random() * 255;
float c1g = (float)Math.random() * 255;
float c1b = (float)Math.random() * 255;
float c2r = (float)Math.random() * 255;
float c2g = (float)Math.random() * 255;
float c2b = (float)Math.random() * 255;
float c3r = (float)Math.random() * 255;
float c3g = (float)Math.random() * 255;
float c3b = (float)Math.random() * 255;
int c1x = 0;
int c2x = -125;
int c3x = -250;
void setup()
{
  size(300,300);
}
void draw()
{
  fillCarFade(c1x, 280, car1);
  fillCarFade(c2x, 280, car2);
  fillCarFade(c3x, 280, car3);
  drawHouses();
  if(lightning && y < 300){
    int px = x;
    int py = y;
    x += (int)(Math.random() * 20 - 10);
    y += (int)(Math.random() * 13 + 2);
    strokeWeight(sw);
    if(sw > 1){
      sw -= Math.random() * 0.25;
    }
    stroke(255, 255, 0);
    line(px, py, x, y);
    strokeWeight(1);
    checkCollisions();
  }
  else {
    lightning = false;
    x = (int)(Math.random() * 300);
    y = 0;
    sw = 8;
  }
  drawClouds();
  moveCars();
  fill(0, 0, 0, 10);
  stroke(0, 0, 0);
  rect(0, 0, 300, 300);
}
void mousePressed()
{
  lightning = true;
}
void drawHouses(){
  stroke(0);
  drawHouse(25, 250, house1, h1r, h1g, h1b);
  drawHouse(125, 250, house2, h2r, h2g, h2b);
  drawHouse(225, 250, house3, h3r, h3g, h3b);
}
void drawHouse(int posX, int posY, boolean notDestroyed, float r, float g, float b){
  if(notDestroyed){
    fill(r, g, b);
    rect(posX, posY, 50, 50);
    fill(#8AEDF5);
    rect(posX + 30, posY + 30, 10, 20);
    rect(posX + 10, posY + 30, 10, 10);
    rect(posX + 10, posY + 10, 10, 10);
    rect(posX + 30, posY + 10, 10, 10);
  }
  else{
    fill(100);
    stroke(0);
    beginShape();
    vertex(posX, posY + 30);
    vertex(posX + 10, posY + 25);
    vertex(posX + 15, posY + 32);
    vertex(posX + 20, posY + 35);
    vertex(posX + 30, posY + 28);
    vertex(posX + 35, posY + 30);
    vertex(posX + 40, posY + 25);
    vertex(posX + 50, posY + 32);
    vertex(posX + 50, posY + 50);
    vertex(posX, posY + 50);
    vertex(posX, posY);
    endShape();
    fill(50);
    rect(posX + 30, posY + 30, 10, 20);
    rect(posX + 10, posY + 30, 10, 10);
  }
}
void checkCollisions(){
  if (y >= 250 && x <= 75 && x >= 25 && house1){
    house1 = false;
    drawFire(50, 275);
  }
  if (y >= 250 && x <= 175 && x >= 125 && house2){
    house2 = false;
    drawFire(150, 275);
  }
  if (y >= 250 && x <= 275 && x >= 225 && house3){
    house3 = false;
    drawFire(250, 275);
  }
  if (y >= 280 && x >= c1x - 15 && x <= c1x + 30 && car1){
    car1 = false;
  }
  if (y >= 280 && x >= c2x - 15 && x <= c2x + 30 && car2){
    car2 = false;
  }
  if (y >= 280 && x >= c3x - 15 && x <= c3x + 30 && car3){
    car3 = false;
  }
}
void drawFire(int x, int y){
  fill(255, 0, 0);
  stroke(240, 160, 20);
  strokeWeight(5);
  triangle(x, y - 10, x + 10, y + 20, x - 10, y + 20);
  triangle(x - 15, y, x - 10, y + 20, x - 20, y + 20);
  triangle(x + 15, y, x + 20, y + 20, x + 10, y + 20);
  strokeWeight(1);
}
void drawClouds(){
  fill(100);
  noStroke();
  ellipse(0, 0, 50, 50);
  ellipse(25, 25, 75, 50);
  ellipse(75, 20, 100, 50);
  ellipse(100, 0, 50, 50);
  ellipse(125, 30, 50, 25);
  ellipse(150, 0, 100, 100);
  ellipse(175, 40, 80, 30);
  ellipse(200, 0, 50, 50);
  ellipse(225, 20, 70, 50);
  ellipse(250, 0, 50, 50);
  ellipse(275, 30, 50, 40);
  ellipse(300, 0, 75, 75);
}
void fillCarFade(int x, int y, boolean notDestroyed){
  if(notDestroyed){
    fill(0);
    beginShape();
    vertex(x - 5, y);
    vertex(x - 15, y + 5);
    vertex(x - 20, y + 5);
    vertex(x - 20, y + 15);
    vertex(x + 25, y + 15);
    vertex(x + 25, y + 8);
    vertex(x + 17, y + 6);
    vertex(x + 7, y);
    vertex(x - 5, y);
    endShape();
  }
}
void drawCar(int x, int y, boolean notDestroyed, float r, float g, float b){
  if(notDestroyed){
    fill(r, g, b);
    beginShape();
    vertex(x, y);
    vertex(x - 10, y + 5);
    vertex(x - 15, y + 5);
    vertex(x - 15, y + 15);
    vertex(x + 30, y + 15);
    vertex(x + 30, y + 8);
    vertex(x + 22, y + 6);
    vertex(x + 12, y);
    vertex(x, y);
    endShape();
    fill(25);
    ellipse(x - 7, y + 15, 10, 10);
    ellipse(x + 23, y + 15, 10, 10);
    fill(#8AEDF5);
    beginShape();
    vertex(x + 1, y + 1);
    vertex(x - 9, y + 5);
    vertex(x + 20, y + 6);
    vertex(x + 11, y + 1);
    vertex(x + 1, y + 1);
    endShape();
  }
  else{
    fill(75);
    beginShape();
    vertex(x, y + 8);
    vertex(x - 10, y + 8);
    vertex(x - 15, y + 10);
    vertex(x - 13, y + 16);
    vertex(x + 5, y + 18);
    vertex(x + 30, y + 17);
    vertex(x + 28, y + 10);
    vertex(x + 22, y + 11);
    vertex(x + 12, y + 9);
    vertex(x, y + 8);
    endShape();
    fill(25);
    ellipse(x - 7, y + 15, 10, 10);
    ellipse(x + 23, y + 15, 10, 10);
  }
}
void moveCars(){
  drawCar(c1x, 280, car1, c1r, c1g, c1b);
  drawCar(c2x, 280, car2, c2r, c2g, c2b);
  drawCar(c3x, 280, car3, c3r, c3g, c3b);
  if(c1x < 350 && car1){
    c1x += 1;
  }
  else if(c1x >= 350 && car1){
    c1x = - 50;
    c1r = (float)Math.random() * 255;
    c1g = (float)Math.random() * 255;
    c1b = (float)Math.random() * 255;
  }
  if(c2x < 350 && car2){
    c2x += 1;
  }
  else if(c2x >= 350 && car2){
    c2x = - 50;
    c2r = (float)Math.random() * 255;
    c2g = (float)Math.random() * 255;
    c2b = (float)Math.random() * 255;
  }
  if(c3x < 350 && car3){
    c3x += 1;
  }
  else if(c3x >= 350 && car3){
    c3x = - 50;
    c3r = (float)Math.random() * 255;
    c3g = (float)Math.random() * 255;
    c3b = (float)Math.random() * 255;
  }
}
