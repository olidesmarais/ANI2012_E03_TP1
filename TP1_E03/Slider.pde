class Slider {
  PVector posJour, posNuit;
  PVector posIndicateur;
  float longueur;
  float diametre;
  PImage imgJour, imgNuit;
  boolean deplacement;
  
  Slider(float x, float y) {
    longueur = 50.0f;
    diametre = 20.0f;
    deplacement = false;
    
    imgJour = loadImage("soleil.png");
    imgNuit = loadImage("lune.png");
    
    posJour = new PVector (x, y);
    posNuit = new PVector (x + longueur, y);
    posIndicateur = new PVector (x, y);
  }
  
  void render() {
    tint(255, 255, 255, 255);
    ellipseMode(CENTER);
    
    //Fond
    fill(255);
    stroke(255);
    strokeWeight(10);
    strokeCap(ROUND);
    line(posJour.x, posJour.y, posNuit.x, posNuit.y);
    noStroke();
    ellipse(posJour.x, posJour.y, diametre, diametre);
    ellipse(posNuit.x, posNuit.y, diametre, diametre);
    
    //Images
    imageMode(CENTER);
    image(imgJour, posJour.x, posJour.y - 1.5f * diametre, 20, 20);
    image(imgNuit, posNuit.x, posNuit.y - 1.5f * diametre, 20, 20);
    
    //Indicateur
    stroke(100);
    point(posIndicateur.x, posIndicateur.y);
    /*if (!deplacement) {
      stroke(100);
      if(isJour) {
        point(posJour.x, posJour.y);
      } else {
        point(posNuit.x, posNuit.y);
      }
    }*/
  }
  
  void update() {
    if (verifierSuperposition(posJour) && pressed && !isJour)
      deplacement('j');
    if (verifierSuperposition(posNuit) && pressed && isJour)
      deplacement('n');
  }
  
  boolean verifierSuperposition(PVector position) {
    float distance =  sqrt(sq(mouseX - position.x) + sq(mouseY - position.y));
    
    if (distance < diametre / 2)
      return true;
    else
      return false;
  }
  
  void deplacement(char destination) {
    if (destination == 'j') {
      while (posIndicateur.x > posJour.x) 
        posIndicateur.x -= 0.0001f;
      isJour = true;
    }
    if (destination == 'n') {
      while (posIndicateur.x < posNuit.x)
        posIndicateur.x += 0.0001;
      isJour = false;
    }
  }
}
